Profile: OpenELISServiceRequest
Parent: ServiceRequest
Id: openelis-service-request
Title: "OpenELIS Service Request"
Description: "OpenELIS service request"
* identifier 1..*
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains uuid 1..1 and labNo 1..1
* identifier[uuid].system = "https://demo.openelis-global.org/analysis_uuid"
* identifier[labNo].system = "https://demo.openelis-global.org/samp_labNo"
* intent 1..1
* status 1..1
* code 1..1
* subject only Reference(OpenELISPatient)
* encounter only Reference(Encounter)
* locationReference 0..*
* locationReference only Reference(Location)
* priority  1..1
* category 0..1
* authoredOn 0..1
* note 0..1
* specimen 1..1
* specimen only Reference(OpenElisSpecimen)
* subject 1..1
* subject only Reference(OpenELISPatient)
* requester 1..1
* requester only Reference(OpenELISPractitioner)

Instance: OpenElisServiceRequestExample
InstanceOf: OpenELISServiceRequest
Usage: #example
Title: "OpenElis Service Request Example"
Description: "OpenElis ServiceRequest Example Resource"
* identifier[uuid].system = "https://demo.openelis-global.org/analysis_uuid"
* identifier[uuid].value = "0a65ab46-179e-4506-9fa3-09d342268576"
* identifier[labNo].system = "https://demo.openelis-global.org/samp_labNo"
* identifier[labNo].value = "TESTA230000000001749"
* intent = #original-order
* status = #active
* specimen = Reference(OpenElisSpecimenExample)
* code.coding[0].system = "http://loinc.org"
* code.coding[0].code = #24627-2
* subject = Reference(example-openelis-patient)
* locationReference = Reference(LocationExample)
* priority = #routine
// * category[0].coding.system = "https://demo.openelis-global.org/sample_program"
* authoredOn =  2023-02-03
* requester = Reference(OpenELISPractitionerExample)

Mapping: OpenELISServiceRequestMapping
Source: OpenELISServiceRequest
Target: "http://digi-uw.github.io/openelis-global-ig/StructureDefinition/open-elis-service-request"
Id: oe-service-request-mapping
Title: "OpenELIS Vs FHIR"
Description: "ServiceRequest Mapping shows how attributes of FHIR ServiceRequest Resource maps to and from the attributes of OpenElis SampleItem Object."
* -> "OE ServiceRequest" "This profile maps FHIR ServiceRequest to OE DataExchange."
* id -> "Analysis.fhirUuid"
* locationReference -> "Organisation"
* intent -> "Analysis.intent"
* status -> "Analysis.status"
* category -> "ObservationHistory.value"
* priority -> "Analysis.priority"
* code.coding.code -> "Analysis.test.loinc"
* code.coding.display -> "Analysis.test.localizedTestName"
* note -> "note"
* specimen -> "SampleItem"
* subject -> "Patient"
* requester -> "Provider"
