This guide documents what OpenELIS sends today. Where that behaviour does not conform to FHIR R4, or is likely to
surprise a receiver, it is listed here with the code location, so implementers can plan around it and the
OpenELIS team can fix it. Class names refer to
[OpenELIS-Global-2](https://github.com/DIGI-UW/OpenELIS-Global-2) `develop` as of 29 September 2026.

When an item is fixed in OpenELIS, update the matching profile and remove the item in the same pull request.

### Conformance with base FHIR R4

These make some OpenELIS resources fail validation against base R4.

| # | Issue | Where | Suggested fix |
|---|---|---|---|
| 1 | Referral Tasks have no `intent`. R4 requires it. | `FhirReferralServiceImpl.createReferralTask` | Set `intent = order`. |
| 2 | Order Task `status` is left empty when the order status has no mapping. R4 requires `status`. | `TaskTransformServiceImpl.transformToTask` | Map the remaining statuses, or fall back to `in-progress`. |
| 3 | ServiceRequests for environmental and vector samples have no `subject`. R4 requires it. | `ServiceRequestTransformServiceImpl` | Use a Location (sampling site) or Group as the subject. |
| 4 | `SupplyDelivery.type` uses `http://terminology.hl7.org/CodeSystem/supply-item-type#medication` with display "Specimen Shipment". The element has a required binding to SupplyDeliveryType, the display does not match, and specimens are not medication. | `ShippingBoxFhirTransform` | Omit `type` (it is optional), or carry the shipment type in an extension. |
| 5 | Identifiers can be sent with a system and no value when the record has no FHIR UUID, for example `Practitioner.identifier` with system `{base}/provider_uuid`. | `Provider.getFhirUuidAsString`, `PractitionerTransformServiceImpl` | Skip the identifier when there is no UUID. |
| 6 | When importing an EMR order, OpenELIS writes an extra Task that has only an id and `basedOn` (the remote Task URL), with no `status` or `intent`. Task is in the default subscription list, so subscribers receive it. | `FhirApiWorkFlowServiceImpl.saveTaskBasedOnRemoteTask` | Populate status and intent, or drop the extra Task. |
| 7 | On the lost and rejected referral paths, when the FHIR store has no copy of the ServiceRequest, OpenELIS pushes a ServiceRequest with only an id and a status. | `FhirReferralServiceImpl.publishReferralLost` / `publishReferralRejected` | Rebuild the full ServiceRequest from the Analysis. |
{:.grid}

### Semantics and data quality

| # | Issue | Where | Suggested fix |
|---|---|---|---|
| 8 | `ServiceRequest.authoredOn` is the time the resource was generated, not the time the order was entered. | `ServiceRequestTransformServiceImpl` (`new Date()`) | Use `Sample.enteredDate`. |
| 9 | `ServiceRequest.locationReference` is written as `Location/{Organization UUID}` for the referring site and department. No such Location exists. | `ServiceRequestTransformServiceImpl` | Publish matching Location resources, or reference the Organization another way. |
| 10 | `Observation.performer` is the ordering provider, not the analyst or the validating biologist. | `ObservationTransformServiceImpl` | Reference the validating user, or omit it. |
| 11 | `Specimen.collection.collector` is never populated, although the collector is passed to the transform. | `SpecimenTransformServiceImpl.transformToCollection` | Populate it. |
| 12 | `Specimen.container.specimenQuantity` sends the OpenELIS unit name as a UCUM code. Not every OpenELIS unit name is valid UCUM. | `SpecimenTransformServiceImpl` | Send `system` only when the unit is a UCUM code. Otherwise use `unit` only. |
| 13 | `Patient.gender`: any stored value other than `M` is sent as `female`. | `PatientTransformServiceImpl` | Map F to female, blank to unknown, and anything else to other or unknown. |
| 14 | The `{base}/org_uuid` identifier is only sent when the organization has a code. The condition checks `code` instead of the UUID. | `OrganizationTransformServiceImpl.setFhirOrganizationIdentifiers` | Check the UUID. |
| 15 | Order Task `output.type` is the code `reference` with no system. Referral Tasks use `{base}/task_output#DiagnosticReport`. | `TaskTransformServiceImpl` | Use the same coding in both. |
| 16 | Referral Task `reasonCode` has a system (`{base}/refer_reason`) but no code. | `FhirReferralServiceImpl.createReferralTask` | Send the referral reason, or omit the element. |
| 17 | Storage `Location.physicalType`: devices use `ve` (Vehicle), and shelves, racks and boxes use `co`, which is *Corridor* in FHIR. OpenELIS sends the display "Container", which validators report as a display mismatch. | `StorageLocationFhirTransform` | Use `ca` (Cabinet) for devices. Rely on `meta.tag` for the level and send physicalType as text or a local code. |
| 18 | Storage Locations declare `meta.profile` = `http://ihe.net/fhir/StructureDefinition/IHE.mCSD.Location`, which does not resolve. The IHE mCSD canonical is `https://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.Location`. | `StorageLocationFhirTransform` | Declare this guide's OpenELIS Storage Location profile instead. |
| 19 | The storage temperature is sent with no unit. Box grids are sent as the formatted string `"R × C"`. The `position-grid-row` and `position-grid-column` extensions are defined in code but never sent. | `StorageLocationFhirTransform` | Use a Quantity with a UCUM unit, and two integers for the grid. |
| 20 | `shipment-non-conformity` does not say which item in the box it applies to. | `ShippingBoxFhirTransform` | Nest it in `shipment-content-item`. |
| 21 | Draft and ready-to-send boxes are written to the FHIR store as `in-progress`. A receiver imports any `in-progress` box as in transit, so it can receive a box that was never sent. | `ShippingBoxFhirTransform.mapBoxStateToFhirStatus`, `ShipmentFhirImportService` | Write the SupplyDelivery only once the box is sent, or map draft to a status receivers skip. |
| 22 | `ServiceRequest.basedOn` is written as `ServiceRequest/{external order number}` (the incoming ServiceRequest's first identifier value), not the incoming ServiceRequest's id. It is one value per sample, so every test carries the same reference. | `ServiceRequestTransformServiceImpl` (`sample.getReferringId()`) | Keep the incoming ServiceRequest id per analysis and reference it, or use a logical reference by identifier. |
| 23 | The referral Task requester is a copy of the provider written to the FHIR store with a new random id for each referral, so duplicate Practitioners accumulate and the reference never carries the provider UUID. On the completion, lost and rejected paths the owner can be empty when the reference lab's Organization is not in the FHIR store. | `FhirReferralServiceImpl` | Reference the provider's existing Practitioner. Fail loudly when the owner cannot be resolved. |
| 24 | The referring lab only polls for referral Tasks in requested, received or accepted status, so a Task the reference lab rejected is never seen. | `FhirApiWorkFlowServiceImpl.beginTaskCheckIfAcceptedPath` | Include rejected in the search and handle it. |
| 25 | QuestionnaireResponses have no `subject`, `basedOn` or `authored`. Generic Sample answers use `valueCoding` with no system. | `GenericSampleOrderServiceImpl`, order entry front end | Link the response to the patient and order, and send the answer option's system. |
| 26 | The questionnaire identifier system is misspelled: `{base}/notebook_questionare`. | `QuestionnaireConfigurationHandler` | Correct it, and keep reading the old spelling. |
{:.grid}

### URLs and configuration

| # | Issue | Where | Suggested fix |
|---|---|---|---|
| 27 | OpenELIS uses three URL bases for its own definitions (`http://openelis-global.org`, `http://openelis.org`, `https://openelis-global.org/fhir`), and none of them resolves. This guide defines the extensions under its own canonical, so live messages do not match its definitions until the code changes. | Various | Move every extension and profile URL to this guide's canonical (`https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/{id}`) and keep accepting the old URLs on import. |
| 28 | Some code ignores `org.openelisglobal.oe.fhir.system` and hard-codes `http://openelis-global.org/pat_*`. | `PatientTransformServiceImpl.transformToOpenElisPatientSearchResults`, `PatientSearchRestController` | Use `FhirConfig.getOeFhirSystem()`. |
| 29 | Analyzer `Device.id` falls back to the numeric database id when the analyzer has no UUID. `Device.owner` is an identifier-only reference. | `DeviceTransformServiceImpl` | Always assign a UUID. Add `owner.reference` to the site Organization. |
{:.grid}

### REST API

| # | Issue | Where |
|---|---|---|
| 30 | `POST /Patient` returns the database id in the Location header, not the FHIR UUID used by `GET /Patient/{id}`. `DELETE /Patient/{id}` does not change the OpenELIS patient: it only marks the FHIR store copy inactive. | `PatientProvider.create` / `delete` |
| 31 | `_sort` is accepted and ignored. | `BaseFhirDao` |
| 32 | Unauthenticated requests, including `GET /metadata`, get a redirect to the login page instead of 401 with an OperationOutcome. | `SecurityConfig` |
| 33 | The OpenELIS-generated CapabilityStatement at `/metadata` does not reference the profiles in this guide. | `FhirRestfulServer` |
{:.grid}

### Not yet covered by this guide

* The inbound analyzer-bridge result bundle (`POST /analyzer/fhir`, profile
  `https://openelis-global.org/fhir/StructureDefinition/analyzer-normalized-bundle-v1`).
* External quality assessment (EQA) result submission (DiagnosticReport and Observation with `{base}/eqa/...` systems).
* Questionnaire and QuestionnaireResponse (programme questions and Generic Sample forms).
* Pathology, cytology and immunohistochemistry reports.
