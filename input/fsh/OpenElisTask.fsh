Profile: OpenELISTask
Parent: Task
Id:  openelis-task
Title: "OpenElis Task"
Description: "A Task resource for tracking order state"
* identifier 0..*
* basedOn 1..*
* basedOn only Reference(OpenELISServiceRequest)
* for only Reference(OpenELISPatient)
* encounter only Reference(Encounter)
* owner only Reference(Practitioner or Organization or HealthcareService)
* authoredOn 1..1
* status from OpenELISTaskStatusVS 
* intent from OpenELISTaskIntentVS
* output.type.text = "DiagnosticReport"
* output.value[x] only Reference(OpenELISDiagnosticReport)

Mapping: OpenElisTaskMapping
Source: OpenELISTask
Target: "http://i-tech-uw.github.io/openelis-global-ig/StructureDefinition/open-elis-task"
Id: eo-task-mapping
Title: "OpenELIS Vs FHIR"
Description: "Task Mapping shows how attributes of FHIR Task Resource maps to and from the attributes of OpenElis Sample Object."
* -> "OE Specimen" "This profile maps FHIR Task to OE DataExchange."
* id -> "Sample.fhirUuid"
* intent -> "intent"
* status -> "Sample.status"
* authoredOn -> "Sample.enteredDate"
* priority -> "priority"
* identifier -> "Sample.accessionNumber"
* basedOn -> "Analysis"
* for -> "Patient"

Instance: OpenELISTaskExample
InstanceOf: OpenELISTask
Usage: #example
Title: "OpenElis Task Example"
Description: "OpenElis Task Example Resource"
* id = "49ef249a-3a8b-49e3-9e16-7e56e92d0c77"
* intent = TaskIntentCodeSystem#order 
* status = TaskStatusCodeSystem#in-progress
* basedOn = Reference(OpenElisServiceRequestExample)
* for = Reference(example-openelis-patient)
* owner = Reference(OpenELISPractitionerExample)
* authoredOn = 2023-02-03
* output.type.text = "DiagnosticReport"
* output.valueReference = Reference(OpenElisDiagnosticReportExample)
