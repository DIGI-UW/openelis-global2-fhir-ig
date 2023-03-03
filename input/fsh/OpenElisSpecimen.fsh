Profile: OpenElisSpecimen
Parent: Specimen
Id: open-elis-specimen
Title: "OpenElis Specimen"
Description: "A Specimen Resource used for FHIR Exchange"
* identifier 1..*
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains uuid 1..1
* identifier[uuid].system = "http://openelis-global.org/sampleItem_uuid"
* accessionIdentifier 1..1
* type 1..1
* status 1..1
* status from OpenElisSpecimenStatusVS
* receivedTime 1..1
* collection 1..1
* collection.collectedDateTime 1..1
* request 1..1
* request only Reference(OpenELISServiceRequest)
* subject 1..1
* subject only Reference(OpenELISPatient)

Mapping: OpenElisSpecimenMapping
Source: OpenElisSpecimen
Target: "http://i-tech-uw.github.io/openelis-global-ig/StructureDefinition/open-elis-specimen"
Id: oe-specimen-mapping
Title: "OpenELIS Vs FHIR"
Description: "Specimen Mapping shows how attributes of FHIR Specimen Resource maps to and from the attributes of OpenElis SampleItem Object."
* -> "OE Specimen" "This profile maps FHIR Specimen to OE DataExchange."
* id -> "SampleItem.fhirUuid"
* accessionIdentifier.value -> "SampleItem.sample.accessionNumber"
* type.coding.code -> "SampleItem.typeOfSample.localAbbreviation"
* type.coding.display -> "SampleItem.typeOfSample.localizedName"
* collection -> "SampleItem.collectionDate"
* request -> "Analysis"
* subject -> "Patient"


Instance: OpenElisSpecimenExample
InstanceOf: OpenElisSpecimen
Usage: #example
Title: "OpenElis Specimen Example"
Description: "OpenElis Specimen Example Resource"
* accessionIdentifier[0].system = "http://openelis-global.org/sampleItem_labNo"
* accessionIdentifier[0].value = "TESTA230000000001751"
* identifier[uuid].system = "http://openelis-global.org/sampleItem_uuid"
* identifier[uuid].value = "9df49e2d-57f7-4e7b-abb1-54d0a1933253"
* type.coding.system = "http://openelis-global.org/sampleType"
* type.coding.display = "Plasma"
* status = SpecimenStatusCodeSystem#available 
* receivedTime = "2023-03-03T07:03:00Z"
* collection.collectedDateTime = 2023-02-03
* request = Reference(OpenElisServiceRequestExample)
* subject = Reference(example-openelis-patient)