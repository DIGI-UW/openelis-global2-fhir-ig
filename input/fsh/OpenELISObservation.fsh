Profile: OpenELISObservation
Parent: Observation
Id: open-elis-observation
Title: "OpenELIS Observation"
Description: "A Observation Resource used for FHIR Exchange"
* identifier 1..*
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains uuid 1..1
* status 1..1
* code 1..1
* status from OpenELISObservationVS
* value[x] 1..1
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


Instance: OpenElisObservationExample
InstanceOf: OpenELISObservation
Usage: #example
Title: "OpenElis Observation Example"
Description: "OpenElis Observation Example Resource"
* identifier[uuid].system = "http://openelis-global.org/result_uuid"
* identifier[uuid].value = "158999b0-b295-4dfd-a5b0-81ed58733b5f"
* status = ObsStatusCS#final
* valueQuantity.value = 55
* valueQuantity.unit = "UI/L"
* basedOn = Reference(OpenElisServiceRequestExample)
* specimen = Reference(OpenElisSpecimenExample)
* subject = Reference(example-openelis-patient)
* code.coding.code = #15074-8
* code.coding.display = "Glucose [Moles/volume] in Blood"
* code.coding.system = "http://loinc.org"