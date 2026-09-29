// Orders: what an EMR sends to OpenELIS, and what OpenELIS produces.

// ===========================================================================
// Incoming lab order (EMR -> OpenELIS)
// ===========================================================================
Profile: OpenELISLabOrderRequestTask
Parent: Task
Id: openelis-lab-order-request-task
Title: "Lab Order Request Task (EMR to OpenELIS)"
Description: "The Task an ordering system (for example OpenMRS with the Lab on FHIR module) writes to the shared FHIR server so OpenELIS picks the order up. OpenELIS polls each org.openelisglobal.remote.source.uri for Task?status=requested&owner={one of org.openelisglobal.remote.source.identifier} (FhirApiWorkFlowServiceImpl.beginTaskImportOrderPath)."
* status 1..1 MS
* status ^comment = "Must be requested for OpenELIS to import the order. When org.openelisglobal.remote.source.updateStatus=true, OpenELIS writes accepted or rejected back to this Task once the order has been processed."
* intent 1..1 MS
* intent ^comment = "order"
* owner 1..1 MS
* owner ^short = "The OpenELIS instance, as named in org.openelisglobal.remote.source.identifier"
* owner ^comment = "Usually Practitioner/{uuid of the OpenELIS service user in the EMR}. With the property value Practitioner/* OpenELIS accepts every Practitioner on the remote server."
* basedOn 1..* MS
* basedOn only Reference(OpenELISLabOrderRequestServiceRequest)
* basedOn ^short = "The ordered tests"
* for 0..1 MS
* for only Reference(Patient)
* for ^comment = "The patient. When absent OpenELIS falls back to the ServiceRequest subject. Omitted for environmental and vector samples."
* encounter MS
* authoredOn MS
* location MS
* location ^comment = "When present OpenELIS reads the referenced Location, matches it to an OpenELIS Organization with the same FHIR id (creating one if none exists) and uses it as the referring site."

Profile: OpenELISLabOrderRequestServiceRequest
Parent: ServiceRequest
Id: openelis-lab-order-request-service-request
Title: "Lab Order Request ServiceRequest (EMR to OpenELIS)"
Description: "A test ordered by an external system. OpenELIS matches the test or panel by the LOINC coding in ServiceRequest.code (TaskInterpreterImpl.createTestFromFHIR / createPanelFromFHIR). The OpenELIS test must be configured with the same LOINC code."
* identifier 1..* MS
* identifier ^comment = "The first identifier's value is stored as the external order number (the last 60 characters are kept). It is required: an order without it is refused, and an order number OpenELIS has already received is refused as a duplicate."
* status 1..1 MS
* intent 1..1 MS
* code 1..1 MS
* code.coding 1..* MS
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains loinc 1..1 MS
* code.coding[loinc].system = "http://loinc.org"
* code.coding[loinc].code 1..1
* code.coding[loinc] ^short = "LOINC code of the ordered test or panel. OpenELIS uses the first match."
* priority MS
* priority ^comment = "Defaults to routine when absent."
* subject 1..1 MS
* subject only Reference(Patient or Location or Group or Device)
* specimen MS
* specimen ^comment = "Optional. If absent and the LOINC code matches several OpenELIS tests, or one test with several sample types, OpenELIS holds the order as Awaiting Specimen until the accessioner chooses the sample type."
* requester MS
* encounter MS

// ===========================================================================
// ServiceRequest produced by OpenELIS (one per ordered test / Analysis)
// ===========================================================================
Profile: OpenELISServiceRequest
Parent: ServiceRequest
Id: openelis-service-request
Title: "OpenELIS ServiceRequest"
Description: "One ordered test (an OpenELIS Analysis) as OpenELIS produces it (ServiceRequestTransformServiceImpl) and serves it from /fhir/ServiceRequest. The id is the Analysis UUID. The DiagnosticReport for the same test has the same id."
* insert IdentifierSlicing
* identifier 1..* MS
* identifier contains
    analysisUuid 1..1 MS and
    facility 0..1
* identifier[analysisUuid] ^short = "OpenELIS Analysis UUID (equals ServiceRequest.id)"
* identifier[analysisUuid].system = "http://openelis-global.org/analysis_uuid"
* identifier[analysisUuid].value 1..1
* insert FacilityIdentifierSlice
* basedOn MS
* basedOn only Reference(ServiceRequest)
* basedOn ^short = "The external order (FHIR electronic orders only)"
* basedOn ^comment = "Written as ServiceRequest/{external order number}: the order number (the first identifier value of the incoming ServiceRequest), not the incoming ServiceRequest's id. All tests of the order carry the same value (see Known Issues)."
* requisition 1..1 MS
* requisition ^short = "Lab (accession) number of the order"
* requisition.system 1..1
* requisition.system = "http://openelis-global.org/samp_labNo"
* requisition.value 1..1
* status MS
* status ^comment = "Not started, technical acceptance and biologist rejected = active. Finalized = completed. Technical rejection and cancelled = revoked. Sample rejected = entered-in-error. Otherwise unknown. On result entry a completed or revoked status already in the FHIR store is not downgraded. Other paths (validation, bulk transform) do not apply this guard."
* intent MS
* intent ^comment = "original-order when entered in OpenELIS. order when received as an electronic order (FHIR or HL7 v2)."
* category MS
* category ^comment = "Carries the order's programme ({oe}/sample_program) and domain ({oe}/samp_domain) when set."
* priority 1..1 MS
* priority ^comment = "routine / asap / stat (stat and future stat) / urgent (timed)."
* code 1..1 MS
* code ^comment = "Codings from the test's active terminology mappings (LOINC / SNOMED CT / CIEL / OCL) for the specimen's sample type, grouped by system. A SAME_AS mapping wins within a system. The test's legacy LOINC is included. code.text is the test name."
* code.coding MS
* code.text MS
* subject MS
* subject only Reference(OpenELISPatient)
* subject ^comment = "OpenELIS omits subject for environmental and vector samples, although R4 requires it (see Known Issues)."
* authoredOn 1..1 MS
* authoredOn ^comment = "Currently the time the resource was generated, not the order entry time (see Known Issues)."
* requester MS
* requester only Reference(OpenELISPractitioner)
* locationReference MS
* locationReference ^comment = "Referring site and referring department. The reference id is the OpenELIS Organization UUID written as Location/{id} (see Known Issues)."
* specimen MS
* specimen only Reference(OpenELISSpecimen)
* specimen ^comment = "The sample item the test runs on. Absent for pool-level vector analyses."
* note MS

Mapping: OpenELISServiceRequestToOE
Source: OpenELISServiceRequest
Target: "https://github.com/DIGI-UW/OpenELIS-Global-2"
Id: oe-data-model
Title: "OpenELIS Global data model"
* -> "Analysis (ServiceRequestTransformServiceImpl)"
* id -> "Analysis.fhirUuid"
* identifier[analysisUuid] -> "Analysis.fhirUuid"
* basedOn -> "Sample.referringId (external order number)"
* requisition -> "Sample.accessionNumber"
* status -> "Analysis.statusId"
* intent -> "ElectronicOrder.type for Sample.referringId"
* category -> "ObservationHistory PROGRAM / Sample.domain"
* priority -> "Sample.priority"
* code -> "Analysis.test + TestTerminologyMapping"
* subject -> "SampleHuman.patient"
* requester -> "SampleHuman.provider"
* locationReference -> "Sample requester organizations (referring org / referring department)"
* specimen -> "Analysis.sampleItem"
* note -> "Note (analysis notes)"

// ===========================================================================
// Specimen produced by OpenELIS (one per sample item)
// ===========================================================================
Profile: OpenELISSpecimen
Parent: Specimen
Id: openelis-specimen
Title: "OpenELIS Specimen"
Description: "A sample item as OpenELIS produces it (SpecimenTransformServiceImpl) and serves it from /fhir/Specimen."
* insert IdentifierSlicing
* identifier 1..* MS
* identifier contains
    sampleItemUuid 1..1 MS and
    facility 0..1
* identifier[sampleItemUuid] ^short = "OpenELIS sample item UUID (equals Specimen.id)"
* identifier[sampleItemUuid].system = "http://openelis-global.org/sampleItem_uuid"
* identifier[sampleItemUuid].value 1..1
* insert FacilityIdentifierSlice
* accessionIdentifier 1..1 MS
* accessionIdentifier ^short = "Order lab number, followed by -{sortOrder} when the item has one"
* accessionIdentifier.system 1..1
* accessionIdentifier.system = "http://openelis-global.org/sampleItem_labNo"
* accessionIdentifier.value 1..1
* status 1..1 MS
* status ^comment = "Cancelled = unsatisfactory. Disposed = unavailable. Otherwise available."
* type 1..1 MS
* type.coding 1..* MS
* type.coding ^slicing.discriminator.type = #value
* type.coding ^slicing.discriminator.path = "system"
* type.coding ^slicing.rules = #open
* type.coding contains oeSampleType 1..1 MS
* type.coding[oeSampleType] ^short = "OpenELIS sample type (local abbreviation)"
* type.coding[oeSampleType].system = "http://openelis-global.org/sampleType"
* type.coding[oeSampleType].code 1..1
* type ^comment = "Always carries the OpenELIS sample type, plus the sample type's terminology mappings (for example SNOMED CT)."
* subject 0..1 MS
* subject only Reference(OpenELISPatient)
* subject ^comment = "Absent for environmental and vector samples."
* receivedTime MS
* request MS
* request only Reference(OpenELISServiceRequest)
* request ^short = "Every test ordered on this sample item"
* collection 0..1 MS
* collection ^comment = "Omitted when the sample item has no collection date, GPS, source or collection conditions."
* collection.collected[x] only dateTime
* collection.collected[x] MS
* collection.extension contains OECollectionLocationGPS named gps 0..1 MS
* collection.bodySite MS
* collection.bodySite ^comment = "text only: the configured source of sample, or the free-text other source."
* collection.method MS
* collection.method ^comment = "text only: the collection conditions."
* collection.collector ^comment = "Not populated by OpenELIS today (see Known Issues)."
* condition MS
* condition ^comment = "On order entry: the sample's condition on receipt, coded with {oe}/sample_condition."
* container 1..1 MS
* container.type 1..1
* container.type = $SCT#434711009 "Specimen container (physical object)"
* container.specimenQuantity MS
* container.specimenQuantity ^comment = "code is the OpenELIS unit-of-measure name with system UCUM. Not every OpenELIS unit name is a valid UCUM code (see Known Issues)."
* note MS

Mapping: OpenELISSpecimenToOE
Source: OpenELISSpecimen
Target: "https://github.com/DIGI-UW/OpenELIS-Global-2"
Id: oe-data-model
Title: "OpenELIS Global data model"
* -> "SampleItem (SpecimenTransformServiceImpl)"
* id -> "SampleItem.fhirUuid"
* identifier[sampleItemUuid] -> "SampleItem.fhirUuid"
* accessionIdentifier -> "Sample.accessionNumber + '-' + SampleItem.sortOrder"
* status -> "SampleItem.statusId"
* type -> "SampleItem.typeOfSample (+ terminology mappings)"
* subject -> "SampleHuman.patient"
* receivedTime -> "SampleItem.receivedDate"
* request -> "Analysis (all analyses on the sample item)"
* collection.collected[x] -> "SampleItem.collectionDate"
* collection.extension[gps] -> "Sample.gpsLatitude / gpsLongitude / gpsAccuracyMeters / gpsCaptureMethod / gpsCaptureTimestamp"
* collection.bodySite -> "SampleItem.sourceOfSample / sourceOther"
* collection.method -> "SampleItem.collectionConditions"
* condition -> "ObservationHistory SAMPLE_CONDITION"
* container.specimenQuantity -> "SampleItem.quantity + unitOfMeasure"
* note -> "SampleItem.collectionConditions"

// ===========================================================================
// Task produced by OpenELIS for an order
// ===========================================================================
Profile: OpenELISOrderTask
Parent: Task
Id: openelis-order-task
Title: "OpenELIS Order Task"
Description: "The Task OpenELIS writes for each order (Sample) to track its state (TaskTransformServiceImpl). When the order came from an EMR Task, partOf points at that Task. When the order is finished, one output per test references its DiagnosticReport."
* insert IdentifierSlicing
* identifier 2..* MS
* identifier contains
    orderUuid 1..1 MS and
    accessionNumber 1..1 MS
* identifier[orderUuid] ^short = "OpenELIS order (Sample) UUID (equals Task.id)"
* identifier[orderUuid].system = "http://openelis-global.org/order_uuid"
* identifier[orderUuid].value 1..1
* identifier[accessionNumber] ^short = "Order lab (accession) number"
* identifier[accessionNumber].system = "http://openelis-global.org/order_accessionNumber"
* identifier[accessionNumber].value 1..1
* basedOn 1..* MS
* basedOn only Reference(OpenELISServiceRequest)
* partOf MS
* partOf only Reference(Task)
* partOf ^short = "The EMR Task the order was received from"
* status 1..1 MS
* status ^comment = "Entered = ready. Started or technical acceptance = in-progress. Technical rejection = failed. Non-conforming or biologist rejected = rejected. Finished = completed."
* intent MS
* intent ^comment = "original-order when entered in OpenELIS. order when received from another system."
* priority MS
* for MS
* for only Reference(OpenELISPatient)
* for ^comment = "Absent for environmental and vector samples."
* authoredOn 1..1 MS
* output MS
* output ^short = "One per test, once the order is finished"
* output.type.coding.code = #reference
* output.type ^comment = "Currently a bare code 'reference' with no system."
* output.value[x] only Reference(OpenELISDiagnosticReport)

Mapping: OpenELISOrderTaskToOE
Source: OpenELISOrderTask
Target: "https://github.com/DIGI-UW/OpenELIS-Global-2"
Id: oe-data-model
Title: "OpenELIS Global data model"
* -> "Sample (TaskTransformServiceImpl)"
* id -> "Sample.fhirUuid"
* identifier[orderUuid] -> "Sample.fhirUuid"
* identifier[accessionNumber] -> "Sample.accessionNumber"
* basedOn -> "Analysis (all analyses on the sample)"
* partOf -> "Referring Task in the FHIR store (Sample.referringId)"
* status -> "Sample.statusId"
* priority -> "Sample.priority"
* for -> "SampleHuman.patient"
* authoredOn -> "Sample.enteredDate"
* output -> "Analysis.fhirUuid (DiagnosticReport per analysis)"

// ===========================================================================
// Referral Task (OpenELIS referring lab -> OpenELIS reference lab)
// ===========================================================================
Profile: OpenELISReferralTask
Parent: Task
Id: openelis-referral-task
Title: "OpenELIS Referral Task"
Description: "The Task a referring OpenELIS writes when it refers a test to another laboratory (FhirReferralServiceImpl.createReferralTask). The reference lab polls for it with the same mechanism as EMR orders. When results are entered at the referring lab from a paper report, it publishes the Task as completed with an output referencing the DiagnosticReport. A referral marked lost sets the Task to cancelled. A referral rejected at the referring lab sets it to rejected."
* status 1..1 MS
* status ^comment = "requested when sent. accepted or rejected by the reference lab. completed, cancelled (lost) or rejected when published by the referring lab."
* intent MS
* intent ^comment = "OpenELIS does not set intent on referral Tasks today, which base FHIR requires (see Known Issues). Receivers should expect order."
* owner MS
* owner only Reference(OpenELISOrganization)
* owner ^short = "The reference laboratory"
* owner ^comment = "Can be empty on the completion, lost and rejected paths when the reference lab's Organization is not found in the FHIR store (see Known Issues)."
* requester MS
* requester only Reference(OpenELISPractitioner)
* requester ^comment = "A copy of the ordering provider written to the FHIR store with a new random id for each referral (see Known Issues)."
* restriction.recipient MS
* restriction.recipient ^comment = "The first value of org.openelisglobal.remote.source.identifier. With the shipped value Practitioner/* this is the first Practitioner found on the remote servers."
* reasonCode MS
* reasonCode.coding.system = "http://openelis-global.org/refer_reason"
* reasonCode ^comment = "Currently only the system is sent (see Known Issues)."
* for MS
* for only Reference(OpenELISPatient)
* basedOn 1..* MS
* basedOn only Reference(OpenELISServiceRequest)
* focus 1..1 MS
* focus only Reference(OpenELISServiceRequest)
* description MS
* description ^comment = "referring accession number {labNo} from {requester} to {owner}"
* authoredOn 1..1 MS
* output MS
* output.type.coding.system = "http://openelis-global.org/task_output"
* output.type.coding.code = #DiagnosticReport
* output.value[x] only Reference(OpenELISDiagnosticReport)
