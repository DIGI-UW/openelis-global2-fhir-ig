This page lists every URL OpenELIS puts on the wire: identifier systems, local code systems, extension URLs,
and `meta.profile` / `meta.tag` values. Each identifier system also has a
NamingSystem (see [Artifacts](artifacts.html)) in this guide.

`{base}` is the `org.openelisglobal.oe.fhir.system` property, `http://openelis-global.org` by default.

### Identifier systems

| System | Used on | Value |
|---|---|---|
| `{base}/pat_uuid` | Patient.identifier | OpenELIS patient UUID (equals Patient.id) |
| `{base}/pat_nationalId` | Patient.identifier (use = official) | National id |
| `{base}/pat_subjectNumber` | Patient.identifier | Subject / programme number |
| `{base}/pat_stNumber` | Patient.identifier | ST number |
| `{base}/pat_guid` | Patient.identifier | Patient GUID. Read as the external patient id on import. |
| `{base}/facility_id` | Most resources (use = official, assigner = site Organization). Device.owner.identifier. | The site's facility id (`facility.id`) |
| `{base}/order_uuid` | Task.identifier | Order (Sample) UUID |
| `{base}/order_accessionNumber` | Task.identifier | Order lab number |
| `{base}/analysis_uuid` | ServiceRequest.identifier | Analysis UUID |
| `{base}/samp_labNo` | ServiceRequest.requisition | Order lab number |
| `{base}/sampleItem_uuid` | Specimen.identifier | Sample item UUID |
| `{base}/sampleItem_labNo` | Specimen.accessionIdentifier | `{lab number}-{sort order}` |
| `{base}/result_uuid` | Observation.identifier | Result UUID |
| `{base}/analysisResult_uuid` | DiagnosticReport.identifier | Analysis UUID |
| `{base}/provider_uuid` | Practitioner.identifier | Provider UUID |
| `{base}/org_uuid`, `{base}/org_code`, `{base}/org_shortName`, `{base}/org_cliaNum` | Organization.identifier | Organization UUID, code, short name, CLIA number |
| `{base}/analyzer_uuid` | Device.identifier | Analyzer UUID |
| `{base}/analyzer_bridge_connection` | Device.identifier | Analyzer bridge connection id |
| `{base}/notebook_questionare` (sic) | Questionnaire.identifier | Title of a questionnaire loaded from configuration |
| `http://openelis.org/storage-location-code` | Location.identifier (storage) | Hierarchical storage code |
| `http://openelis.org/shipment/box-id` | SupplyDelivery.identifier | Shipping box id |
{:.grid}

### Code systems

| System | Used in | Content |
|---|---|---|
| `http://loinc.org` | ServiceRequest.code, DiagnosticReport.code, Observation.code, Observation.valueCodeableConcept | Test and answer codes from the test catalog's terminology mappings |
| `http://snomed.info/sct` | Specimen.type, Specimen.container.type, SupplyDelivery | Sample type mappings, container type (434711009), shipment non-conformities |
| `https://openconceptlab.org/orgs/CIEL/sources/CIEL`, `https://openconceptlab.org` | Test codings | CIEL and OCL mappings |
| `{base}/sampleType` | Specimen.type (always first) | Site sample types. Code = local abbreviation, display = localized name. |
| `{base}/dictionary_entry` | Observation.valueCodeableConcept | Site dictionary (coded result) entries |
| `{base}/test_result_component` | Observation.code | Result components of multi-component tests (non-primary components only) |
| `{base}/samp_domain` | ServiceRequest.category | Order domain (clinical / environmental / vector) |
| `{base}/sample_program` | ServiceRequest.category | Programme the order was entered under |
| `{base}/sample_condition` | Specimen condition | Sample condition on receipt |
| `{base}/orgType` | Organization.type | Site organization types (read back on import) |
| `{base}/task_output` | Referral Task.output.type | `DiagnosticReport` |
| `{base}/refer_reason` | Referral Task.reasonCode | Referral reason (currently sent with no code) |
| `{base}/genIdType` | Identifier.type | `externalId`: an identifier assigned by an external system |
| `http://openelis.org/fhir/tag/storage-hierarchy` | Location.meta.tag | `room`, `device`, `shelf`, `rack`, `box` |
| `http://openelis.org/fhir/CodeSystem/storage-device-type` | Location.type (device) | `freezer`, `refrigerator`, `cabinet`, `other` |
| `http://openelis.org/fhir/CodeSystem/storage-box-type` | Location.type (box) | Free-text box type |
{:.grid}

### Extensions

| URL OpenELIS sends | Context | Definition in this guide |
|---|---|---|
| `http://openelis-global.org/fhir/StructureDefinition/collection-location-gps` | Specimen.collection | [Collection location (GPS)](StructureDefinition-collection-location-gps.html) |
| `http://openelis.org/fhir/StructureDefinition/analyzer-last-activated` | Device | [Analyzer last activated](StructureDefinition-analyzer-last-activated.html) |
| `http://openelis.org/fhir/StructureDefinition/analyzer-test-units` | Device | [Analyzer test units](StructureDefinition-analyzer-test-units.html) |
| `http://openelis.org/fhir/StructureDefinition/analyzer-operational-status` | Device | [Analyzer operational status](StructureDefinition-analyzer-operational-status.html) |
| `http://openelis.org/fhir/extension/storage-temperature` | Location | [Storage temperature](StructureDefinition-storage-temperature.html) |
| `http://openelis.org/fhir/extension/storage-capacity` | Location | [Storage capacity](StructureDefinition-storage-capacity.html) |
| `http://openelis.org/fhir/extension/rack-grid-dimensions` | Location | [Grid dimensions](StructureDefinition-rack-grid-dimensions.html) |
| `http://openelis.org/fhir/extension/rack-position-schema-hint` | Location | [Position schema hint](StructureDefinition-rack-position-schema-hint.html) |
| `http://openelis.org/fhir/extension/position-occupancy` | Location | [Position occupancy](StructureDefinition-position-occupancy.html) |
| `http://openelis.org/fhir/extension/device-ip-address` | Location | [Storage device IP address](StructureDefinition-device-ip-address.html) |
| `http://openelis.org/fhir/extension/device-port` | Location | [Storage device port](StructureDefinition-device-port.html) |
| `http://openelis.org/fhir/extension/device-communication-protocol` | Location | [Storage device protocol](StructureDefinition-device-communication-protocol.html) |
| `http://openelis.org/fhir/extension/shipment-destination-org` | SupplyDelivery | [Destination organization id](StructureDefinition-shipment-destination-org.html) |
| `http://openelis.org/fhir/extension/shipment-source-org` | SupplyDelivery | [Source laboratory](StructureDefinition-shipment-source-org.html) |
| `http://openelis.org/fhir/extension/shipment-temperature` | SupplyDelivery | [Temperature requirement](StructureDefinition-shipment-temperature.html) |
| `http://openelis.org/fhir/extension/shipment-capacity` | SupplyDelivery | [Box capacity](StructureDefinition-shipment-capacity.html) |
| `http://openelis.org/fhir/extension/shipment-notes` | SupplyDelivery | [Notes](StructureDefinition-shipment-notes.html) |
| `http://openelis.org/fhir/extension/shipment-content-item` | SupplyDelivery | [Content item](StructureDefinition-shipment-content-item.html) |
| `http://openelis.org/fhir/extension/shipment-non-conformity` | SupplyDelivery | [Non-conformity](StructureDefinition-shipment-non-conformity.html) |
| `http://openelis.org/fhir/extension/shipment-specimen` | SupplyDelivery | [Shipped specimen](StructureDefinition-shipment-specimen.html) |
| `http://openelis.org/fhir/extension/shipment-specimen-type-summary` | SupplyDelivery | [Specimen type summary](StructureDefinition-shipment-specimen-type-summary.html) |
| `http://openelis.org/fhir/extension/eqa-cycle` | SupplyDelivery | [EQA cycle](StructureDefinition-eqa-cycle.html) |
{:.grid}

### Profile and tag URLs sent in `meta`

| Value | Where | Resolves to |
|---|---|---|
| `meta.profile` = `http://openelis.org/fhir/StructureDefinition/openelis-analyzer-device` | Device | Nothing. The matching profile in this guide is [OpenELIS Analyzer Device](StructureDefinition-openelis-analyzer-device.html). |
| `meta.profile` = `http://ihe.net/fhir/StructureDefinition/IHE.mCSD.Location` | Storage Location | Nothing (see [Known Issues](known-issues.html)) |
| `meta.tag` system `http://openelis.org/fhir/tag/storage-hierarchy` | Storage Location | Codes `room`, `device`, `shelf`, `rack`, `box` |
{:.grid}

### Three URL bases

OpenELIS currently uses three different bases for its own URLs:

* `{base}` = `http://openelis-global.org` (configurable) for identifier systems and local code systems
* `http://openelis.org/...` (hard-coded) for storage, shipment and Device definitions
* `https://openelis-global.org/fhir/...` for the inbound analyzer-bridge result contract, which this guide does not
  yet profile

None of them is the canonical base of this guide, and none of them resolves. The extensions and profiles in this guide
are defined under the guide's canonical, `https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/{id}`.
The tables above map each URL OpenELIS sends to its definition here. The guide is intended as an API reference. A
validator checking live OpenELIS messages against this guide will report the extension URLs above as unknown until
OpenELIS adopts the canonical URLs ([Known Issues](known-issues.html)).
