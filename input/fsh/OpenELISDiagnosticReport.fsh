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

Instance: OpenElisDiagnosticReportExample  
InstanceOf: OpenELISDiagnosticReport
Usage: #example
Title: "OpenElis DiagnosticReport Example"
Description: "OpenElis DiagnosticReport Example Resource"
* identifier[uuid].system = "http://openelis-global.org/analysisResult_uuid"
* identifier[uuid].value = "f3c9cf5e-7d41-4a7d-a77b-8c0f4323a0bd"
* status = DiagnosticReportStatusCodeSystem#final
* code.coding[0].system = "http://loinc.org"
* code.coding[0].code = #58410-2
* code.coding[0].display = "Complete blood count (hemogram) panel - Blood by Automated count"
* basedOn = Reference(OpenElisServiceRequestExample)
* specimen = Reference(OpenElisSpecimenExample)
* subject = Reference(example-openelis-patient)
* result = Reference(OpenElisObservationExample)

Mapping: OpenELISDiagnosticReportMapping
Source: OpenELISDiagnosticReport
Target: "http://i-tech-uw.github.io/openelis-global-ig/StructureDefinition/open-elis-diagnostic-report"
Id: oe-diagnostic-report-mapping
Title: "OpenELIS Vs FHIR"
Description: "DiagnosticReport Mapping shows how attributes of FHIR DiagnosticReport Resource maps to and from the attributes of OpenElis SampleItem Object."
* -> "OE DiagnosticReport" "This profile maps FHIR DiagnosticReport to OE DataExchange."
* id -> "Analysis.fhirUuid"
* status -> "status"
* basedOn -> "Analysis"
* specimen -> "SampleItem"
* subject -> "patient"
* result -> "Result"

