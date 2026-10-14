# Known Issues - OpenELIS Global FHIR Implementation Guide v0.2.2

## Known Issues

This guide documents what OpenELIS sends today. Where that behaviour does not conform to FHIR R4, or is likely to surprise a receiver, it is listed here with the code location, so implementers can plan around it and the OpenELIS team can fix it. Class names refer to [OpenELIS-Global-2](https://github.com/DIGI-UW/OpenELIS-Global-2) `develop` at commit `f863283` (14 October 2026). The Jira column links the OpenELIS ticket that tracks each item.

When an item is fixed in OpenELIS, update the matching profile and remove the item in the same pull request. The numbers of removed items are not reused, so the numbers cited in OpenELIS commits and tests stay stable.

### Conformance with base FHIR R4

These make some OpenELIS resources fail validation against base R4.

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| 1 | Referral Tasks have no`intent`. R4 requires it. | `FhirReferralServiceImpl.createReferralTask` | Set`intent = order`. | [OGC-1394](https://uwdigi.atlassian.net/browse/OGC-1394) |
| 4 | `SupplyDelivery.type`uses`http://terminology.hl7.org/CodeSystem/supply-item-type#medication`with display "Specimen Shipment". The element has a required binding to SupplyDeliveryType, the display does not match, and specimens are not medication. | `ShippingBoxFhirTransform` | Omit`type`(it is optional), or carry the shipment type in an extension. | [OGC-1397](https://uwdigi.atlassian.net/browse/OGC-1397) |
| 7 | On the lost and rejected referral paths, when the FHIR store has no copy of the ServiceRequest, OpenELIS pushes a ServiceRequest with only an id and a status. | `FhirReferralServiceImpl.publishReferralLost`/`publishReferralRejected` | Rebuild the full ServiceRequest from the Analysis. | [OGC-1394](https://uwdigi.atlassian.net/browse/OGC-1394) |

### Semantics and data quality

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| 16 | Referral Task`reasonCode`has a system (`{base}/refer_reason`) but no code. | `FhirReferralServiceImpl.createReferralTask` | Send the referral reason, or omit the element. | [OGC-1394](https://uwdigi.atlassian.net/browse/OGC-1394) |
| 17 | Storage`Location.physicalType`: devices use`ve`(Vehicle), and shelves, racks and boxes use`co`, which is**Corridor**in FHIR. OpenELIS sends the display "Container", which validators report as a display mismatch. | `StorageLocationFhirTransform` | Use`ca`(Cabinet) for devices. Rely on`meta.tag`for the level and send physicalType as text or a local code. | [OGC-1402](https://uwdigi.atlassian.net/browse/OGC-1402) |
| 18 | Storage Locations declare`meta.profile`=`http://ihe.net/fhir/StructureDefinition/IHE.mCSD.Location`, which does not resolve. The IHE mCSD canonical is`https://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.Location`. | `StorageLocationFhirTransform` | Declare this guide's OpenELIS Storage Location profile instead. | [OGC-1402](https://uwdigi.atlassian.net/browse/OGC-1402) |
| 19 | The storage temperature is sent with no unit. Box grids are sent as the formatted string`"R × C"`. The`position-grid-row`and`position-grid-column`extensions are defined in code but never sent. | `StorageLocationFhirTransform` | Use a Quantity with a UCUM unit, and two integers for the grid. | [OGC-1402](https://uwdigi.atlassian.net/browse/OGC-1402) |
| 20 | `shipment-non-conformity`does not say which item in the box it applies to. | `ShippingBoxFhirTransform` | Nest it in`shipment-content-item`. | [OGC-1397](https://uwdigi.atlassian.net/browse/OGC-1397) |
| 21 | Draft and ready-to-send boxes are written to the FHIR store as`in-progress`. A receiver imports any`in-progress`box as in transit, so it can receive a box that was never sent. | `ShippingBoxFhirTransform.mapBoxStateToFhirStatus`,`ShipmentFhirImportService` | Write the SupplyDelivery only once the box is sent, or map draft to a status receivers skip. | [OGC-1397](https://uwdigi.atlassian.net/browse/OGC-1397) |
| 23 | The referral Task requester is a copy of the provider written to the FHIR store with a new random id for each referral, so duplicate Practitioners accumulate and the reference never carries the provider UUID. On the completion, lost and rejected paths the owner can be empty when the reference lab's Organization is not in the FHIR store. | `FhirReferralServiceImpl` | Reference the provider's existing Practitioner. Fail loudly when the owner cannot be resolved. | [OGC-1394](https://uwdigi.atlassian.net/browse/OGC-1394) |
| 24 | The referring lab only polls for referral Tasks in requested, received or accepted status, so a Task the reference lab rejected is never seen. | `FhirApiWorkFlowServiceImpl.beginTaskCheckIfAcceptedPath` | Include rejected in the search and handle it. | [OGC-1395](https://uwdigi.atlassian.net/browse/OGC-1395) |
| 25 | QuestionnaireResponses have no`subject`,`basedOn`or`authored`. Generic Sample answers use`valueCoding`with no system. | `GenericSampleOrderServiceImpl`, order entry front end | Link the response to the patient and order, and send the answer option's system. | [OGC-1403](https://uwdigi.atlassian.net/browse/OGC-1403) |
| 26 | The questionnaire identifier system is misspelled:`{base}/notebook_questionare`. | `QuestionnaireConfigurationHandler` | Correct it, and keep reading the old spelling. | [OGC-1403](https://uwdigi.atlassian.net/browse/OGC-1403) |

### URLs and configuration

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| 27 | OpenELIS uses three URL bases for its own definitions (`http://openelis-global.org`,`http://openelis.org`,`https://openelis-global.org/fhir`), and none of them resolves. This guide defines the extensions under its own canonical, so live messages do not match its definitions until the code changes. | Various | Move every extension and profile URL to this guide's canonical (`https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/{id}`) and keep accepting the old URLs on import. | [OGC-1404](https://uwdigi.atlassian.net/browse/OGC-1404) |
| 29 | Analyzer`Device.id`falls back to the numeric database id when the analyzer has no UUID.`Device.owner`is an identifier-only reference. | `DeviceTransformServiceImpl` | Always assign a UUID. Add`owner.reference`to the site Organization. | [OGC-1404](https://uwdigi.atlassian.net/browse/OGC-1404) |

### REST API

| | | | |
| :--- | :--- | :--- | :--- |
| 30 | `POST /Patient`returns the database id in the Location header, not the FHIR UUID used by`GET /Patient/{id}`.`DELETE /Patient/{id}`does not change the OpenELIS patient: it only marks the FHIR store copy inactive. | `PatientProvider.create`/`delete` | [OGC-1405](https://uwdigi.atlassian.net/browse/OGC-1405) |
| 32 | Unauthenticated requests, including`GET /metadata`, get a redirect to the login page instead of 401 with an OperationOutcome. | `SecurityConfig` | [OGC-1405](https://uwdigi.atlassian.net/browse/OGC-1405) |
| 33 | The OpenELIS-generated CapabilityStatement at`/metadata`does not reference the profiles in this guide. | `FhirRestfulServer` | [OGC-1405](https://uwdigi.atlassian.net/browse/OGC-1405) |

### Not yet covered by this guide

* The inbound analyzer-bridge result bundle (`POST /analyzer/fhir`, profile `https://openelis-global.org/fhir/StructureDefinition/analyzer-normalized-bundle-v1`).
* External quality assessment (EQA) result submission (DiagnosticReport and Observation with `{base}/eqa/...` systems).
* Questionnaire and QuestionnaireResponse (programme questions and Generic Sample forms).
* Pathology, cytology and immunohistochemistry reports.

