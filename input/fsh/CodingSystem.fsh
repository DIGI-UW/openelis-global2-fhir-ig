CodeSystem: ObsStatusCS
Id: obs-status-cs
Title: "ObservationStatus"
Description: "Observation Status Code system"
* ^url = https://i-tech-uw.github.io/openelis-global2-fhir-ig/codesystem-observation-status
* #unknown "Unknown" "The authoring/source system does not know which of the status values currently applies for this observation. Note: This concept is not to be used for \"other\" - one of the listed statuses is presumed to apply, but the authoring/source system does not know which."
* #final "Final" "The observation is complete and there are no further actions needed. Additional information such \"released\", \"signed\", etc would be represented using [Provenance](provenance.html) which provides not only the act but also the actors and dates and other related data. These act states would be associated with an observation status of `preliminary` until they are all completed and then a status of `final` would be applied."
* #preliminary "Preliminary" "This is an initial or interim observation: data may be incomplete or unverified."   

CodeSystem: TaskStatusCodeSystem
Id: task-status-code-system
Title: "Task Status"
Description:  "Task Status Code System"
* ^url = https://i-tech-uw.github.io/openelis-global2-fhir-ig/codesystem-task-status
* #ready "Ready" "The task is ready to be performed, but no action has yet been taken"
* #in-progress "In Pregress" "The task has been started but is not yet complete."
* #completed "Completed" "The task has been completed."

CodeSystem: TaskIntentCodeSystem
Id: task-intent-code-system
Title: "Task Intent"
Description: "Task Intent Code System"
* ^url = https://i-tech-uw.github.io/openelis-global2-fhir-ig/codesystem-task-intent 
* #order "Order" "The request represents a request/demand and authorization for action by a Practitioner."
* #original-order "Original-Order" "The request represents an original authorization for action."


CodeSystem: ServiceRequestStatusCodeSystem
Id: service-request-status-code-system
Title: "Service Request Status"
Description: "ServiceRequest Status Code System"
* ^url = https://i-tech-uw.github.io/openelis-global2-fhir-ig/codesystem-service-request-status 
* #active "Active" "The request is in force and ready to be acted upon."
* #completed "Completed" "	The activity described by the request has been fully performed. No further activity will occur."
* #revoked "Revoked" "The request (and any implicit authorization to act) has been terminated prior to the known full completion of the intended actions. No further activity should occur."

CodeSystem: ServiceRequestPriorityCodeSystem
Id: service-request-priority-code-system
Title: "Service Request priority"
Description: "ServiceRequest Priority Code System"
* ^url = https://i-tech-uw.github.io/openelis-global2-fhir-ig/codesystem-service-request-priority 
* #routine "Routine" "The request has normal priority."


CodeSystem: DiagnosticReportStatusCodeSystem
Id: diagnostic-report--status-code-system
Title: "Diagnostic Report Status"
Description: "DiagnosticReport Status Code System"
* ^url = https://i-tech-uw.github.io/openelis-global2-fhir-ig/codesystem-diagnostic-report-status
* #final "Final" "The report is complete and verified by an authorized person."
* #preliminary "Preliminary" "Verified early results are available, but not all results are final."
* #registered "Registered" "The existence of the report is registered, but there is nothing yet available."
* #unknown "Unknown" "The authoring/source system does not know which of the status values currently applies for this observation. Note: This concept is not to be used for \"other\" - one of the listed statuses is presumed to apply, but the authoring/source system does not know which."
