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