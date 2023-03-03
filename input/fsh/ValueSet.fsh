
ValueSet: OpenELISTaskStatusVS
Title: "Task Status Valueset"
Description:  "Task Status Valueset"
* TaskStatusCodeSystem#ready 
* TaskStatusCodeSystem#in-progress 
* TaskStatusCodeSystem#completed "The task has been completed."

ValueSet: OpenELISTaskIntentVS
Title: "Task Intent Valueset"
Description:  "Task Intent Valueset"
* TaskIntentCodeSystem#order 
* TaskIntentCodeSystem#original-order


ValueSet: OpenELISObservationVS
Title: "Observation Intent Valueset"
Description:  "Observation Intent Valueset"
* ObsStatusCS#unknown
* ObsStatusCS#final
* ObsStatusCS#preliminary

ValueSet: OpenElisServiceRequestIntentVs
Id: open-elis-service-request-intent-vs
Title: "Service Request Intent Valueset"
Description: "OpenElis Service Request Intent Valueset"
* TaskIntentCodeSystem#order 
* TaskIntentCodeSystem#original-order

ValueSet: OpenElisServiceRequestStatusVs
Id: open-elis-service-request-status-vs
Title: "Service Request Status Valueset"
Description: "OpenElis Service Request Status Valueset"
* ServiceRequestStatusCodeSystem#active 
* ServiceRequestStatusCodeSystem#completed
* ServiceRequestStatusCodeSystem#revoked

ValueSet: OpenElisServiceRequestPriorityVs
Id: open-elis-service-request-priority-vs
Title: "Service Request priority Valueset"
Description: "OpenElis Service Request Priority Valueset"
* ServiceRequestPriorityCodeSystem#routine

ValueSet: OpenElisDiagnosticReportStatusVs
Id: open-elis-diagnostic-report--status-vs
Title: "Diagnostic Report Status Valueset"
Description: "OpenElis Diagnostic Report Status Valueset"
* DiagnosticReportStatusCodeSystem#final 
* DiagnosticReportStatusCodeSystem#preliminary 
* DiagnosticReportStatusCodeSystem#registered 
* DiagnosticReportStatusCodeSystem#unknown 


ValueSet: OpenElisSpecimenStatusVS
Title: "Specimen status Valueset"
Description: "Specimen status Valueset"
* SpecimenStatusCodeSystem#available 