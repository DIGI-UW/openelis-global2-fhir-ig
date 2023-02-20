Profile: OpenELISDiagnosticReport
Parent: DiagnosticReport
Id: openelis-diagnostic-report
Title: "OpenELIS Diagnostic Report"
Description: "DiagnosticReport resource created by a LIS"
* identifier 1..*
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains uuid 1..1
* identifier[uuid].system = "http://openelis-global.org/analysisResult_uuid" 
* status from OpenElisDiagnosticReportStatusVs
* code.coding 1..*
* basedOn 1..1
* basedOn only Reference(OpenELISServiceRequest)
* specimen 1..1
* specimen only Reference(OpenElisSpecimen)
* subject 1..1
* subject only Reference(OpenELISPatient)
* result 1..1
* result only Reference(OpenELISObservation)

