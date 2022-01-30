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

Alias: OE_TASK_STATUS = http://hl7.org/fhir/ValueSet/task-status
Alias: OE_TASK_INTENT = http://hl7.org/fhir/ValueSet/task-intent

ValueSet: OpenELISTaskStatusVS
Title: "Task Status Valueset"
Description:  "Task Status Valueset"
* OE_TASK_STATUS#ready "The task is ready to be performed, but no action has yet been taken"
* OE_TASK_STATUS#in-progress "The task has been started but is not yet complete."
* OE_TASK_STATUS#completed "The task has been completed."

ValueSet: OpenELISTaskIntentVS
Title: "Task Intent Valueset"
Description:  "Task Intent Valueset"
* OE_TASK_STATUS#order "The request represents a request/demand and authorization for action by a Practitioner."
* OE_TASK_STATUS#original-order "The request represents an original authorization for action."


