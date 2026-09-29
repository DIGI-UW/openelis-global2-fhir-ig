// Results produced by OpenELIS.

// ===========================================================================
// Observation (one per OpenELIS Result)
// ===========================================================================
Profile: OpenELISObservation
Parent: Observation
Id: openelis-observation
Title: "OpenELIS Observation"
Description: "One result value as OpenELIS produces it (ObservationTransformServiceImpl) and serves it from /fhir/Observation. A multi-component test produces one Observation per component."
* insert IdentifierSlicing
* identifier 1..* MS
* identifier contains
    resultUuid 1..1 MS and
    facility 0..1 MS
* identifier[resultUuid] ^short = "OpenELIS result UUID (equals Observation.id)"
* identifier[resultUuid].system = "http://openelis-global.org/result_uuid"
* identifier[resultUuid].value 1..1
* insert FacilityIdentifierSlice
* basedOn 1..1 MS
* basedOn only Reference(OpenELISServiceRequest)
* status MS
* status ^comment = "final when the test is finalized (validated). preliminary for results not yet validated. unknown when the test has not started. cancelled for results deleted at validation."
* code MS
* code ^comment = "The test's codings (see OpenELISServiceRequest.code). For a component of a multi-component test, also the component's own terminology codings and an {oe}/test_result_component coding. code.text is then the component label."
* code.coding MS
* subject MS
* subject only Reference(OpenELISPatient)
* subject ^comment = "Absent for environmental and vector samples."
* effective[x] only dateTime
* effective[x] MS
* effective[x] ^comment = "The release (validation) date when released. Otherwise the analysis start date."
* issued MS
* issued ^comment = "The release (validation) date."
* performer MS
* performer only Reference(OpenELISPractitioner)
* performer ^comment = "Currently the ordering provider of the sample, not the analyst (see Known Issues)."
* value[x] only Quantity or CodeableConcept or string
* value[x] MS
* value[x] ^comment = "Numeric results: valueQuantity with unit (the test's unit of measure as text). Dictionary (coded) and multi-select results: valueCodeableConcept with a LOINC answer coding when mapped plus an {oe}/dictionary_entry coding. Text results: valueString. Absent while no value is recorded."
* valueQuantity MS
* valueQuantity.unit MS
* specimen MS
* specimen only Reference(OpenELISSpecimen)
* device MS
* device only Reference(OpenELISAnalyzerDevice)
* device ^comment = "The analyzer that produced the result, when the analysis is linked to one. Only set in the bundles OpenELIS writes to its FHIR store, where the Device is included in the same transaction. Not set on Observations read from /fhir/Observation."

Mapping: OpenELISObservationToOE
Source: OpenELISObservation
Target: "https://github.com/DIGI-UW/OpenELIS-Global-2"
Id: oe-data-model
Title: "OpenELIS Global data model"
* -> "Result (ObservationTransformServiceImpl)"
* id -> "Result.fhirUuid"
* identifier[resultUuid] -> "Result.fhirUuid"
* basedOn -> "Result.analysis"
* status -> "Analysis.statusId"
* code -> "Analysis.test + TestResultComponent + TestTerminologyMapping"
* subject -> "SampleHuman.patient"
* effective[x] -> "Analysis.releasedDate (else Analysis.startedDate)"
* issued -> "Analysis.releasedDate"
* performer -> "SampleHuman.provider"
* value[x] -> "Result.value (+ Dictionary for coded results, + unit of measure)"
* specimen -> "Analysis.sampleItem"
* device -> "Analysis.analyzerId"

// ===========================================================================
// DiagnosticReport (one per OpenELIS Analysis)
// ===========================================================================
Profile: OpenELISDiagnosticReport
Parent: DiagnosticReport
Id: openelis-diagnostic-report
Title: "OpenELIS DiagnosticReport"
Description: "The report for one ordered test, grouping its results (DiagnosticReportTransformServiceImpl), served from /fhir/DiagnosticReport (read, search and delete only). The id is the Analysis UUID, the same as the matching ServiceRequest id."
* insert IdentifierSlicing
* identifier 1..* MS
* identifier contains
    analysisResultUuid 1..1 MS and
    facility 0..1 MS
* identifier[analysisResultUuid] ^short = "Analysis UUID (equals DiagnosticReport.id and ServiceRequest.id)"
* identifier[analysisResultUuid].system = "http://openelis-global.org/analysisResult_uuid"
* identifier[analysisResultUuid].value 1..1
* insert FacilityIdentifierSlice
* basedOn 1..1 MS
* basedOn only Reference(OpenELISServiceRequest)
* status MS
* status ^comment = "Finalized = final. Technical acceptance = preliminary. Technical rejection = partial. Not started = registered. Otherwise unknown."
* code MS
* code ^comment = "Same codings as the ServiceRequest.code for the test."
* subject MS
* subject only Reference(OpenELISPatient)
* subject ^comment = "Absent for environmental and vector samples."
* specimen MS
* specimen only Reference(OpenELISSpecimen)
* result MS
* result only Reference(OpenELISObservation)
* result ^short = "Every result recorded for the test (one per component)"

Mapping: OpenELISDiagnosticReportToOE
Source: OpenELISDiagnosticReport
Target: "https://github.com/DIGI-UW/OpenELIS-Global-2"
Id: oe-data-model
Title: "OpenELIS Global data model"
* -> "Analysis (DiagnosticReportTransformServiceImpl)"
* id -> "Analysis.fhirUuid"
* identifier[analysisResultUuid] -> "Analysis.fhirUuid"
* basedOn -> "Analysis"
* status -> "Analysis.statusId"
* code -> "Analysis.test + TestTerminologyMapping"
* subject -> "SampleHuman.patient"
* specimen -> "Analysis.sampleItem"
* result -> "Result (all results of the analysis)"
