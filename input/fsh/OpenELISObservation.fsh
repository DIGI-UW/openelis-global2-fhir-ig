Profile: OpenELISObservation
Parent: Observation
Id: open-elis-observation
Title: "Open ELIS Observation"
Description: "A Observation Resource used for FHIR Exchange"
* identifier 1..*
* status 1..1
* status from OpenELISObservationVS
* value[x] 1..1
* basedOn 1..1
* basedOn 1..1
* basedOn only Reference(OpenELISServiceRequest)
* specimen 1..1
* specimen only Reference(Specimen)
* subject 1..1 
* subject only Reference(OpenELISPatient)


Mapping: ObservationMapping 
Source: OpenELISObservation
Target: "http://i-tech-uw.github.io/openelis-global-ig/StructureDefinition/open-elis-observation"
Id: oe-observation-mapping
Title: "OpenELIS Vs FHIR"
Description: "Observation Mapping shows how attributes of FHIR Observation Resource maps to and from the attributes of OpenElis Results Object."
* -> "OE Observation" "This profile maps FHIR Observation to OE DataExchange."
* id -> "Result.fhirUuid"
* identifier -> "Result.fhirUuid"
* status -> "Result.analysis.status"
* value[x] -> "Result.value"
* basedOn -> "Analysis"
* specimen -> "SampleItem"
* subject -> "Patient"
