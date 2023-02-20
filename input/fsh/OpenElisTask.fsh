Profile: OpenELISTask
Parent: Task
Id:  openelis-task
Title: "A Task used for OpenELIS FHIR Exchange"
Description: "A Task resource for tracking order state"
* identifier 1..*
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
