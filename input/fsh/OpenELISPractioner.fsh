Profile: OpenELISPractitioner
Parent: Practitioner
Id: open-elispractitioner
Title: "OpenELIS Practitioner"
Description: "A Practitioner Resource used for FHIR Exchange"
* id 1..1
* name 1..1
* telecom 1..1


Instance: OpenELISPractitionerExample
InstanceOf: OpenELISPractitioner
Usage: #example
Title: "OpenELIS Practitioner Example"
Description: "OpenELIS Practitioner Example"
* id = "f185bb76-c298-4671-9be3-ccc94c0a9868"
* name.family = "Mutesasira"
* name.given = "Moses"
* telecom[0].value = "+256-83434121"


Mapping: OpenELISPractitionerMapping
Source: OpenELISPractitioner
Target: "http://i-tech-uw.github.io/openelis-global-ig/StructureDefinition/open-elis-practitioner"
Id: open-elispractitioner-mapping
Title: "OpenELIS Vs FHIR"
Description: "Practitioner Mapping shows how attributes of FHIR Practitioner Resource maps to and from the attributes of OpenElis Provider Object."
* -> "OE Practitioner" "This profile maps FHIR Practitioner to OE DataExchange."
* id -> "Provider.fhirUuid"
* name.given -> "Provider.person.firstName"
* name.family -> "Provider.person.lastName"
* telecom -> "Provider.person.primaryPhone"