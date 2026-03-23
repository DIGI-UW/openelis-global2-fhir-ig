# OpenELIS Practitioner - OpenELIS GLOBAL2 Implementation Guide v0.1.0



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "open-elispractitioner",
  "url" : "http://digi-uw.github.io/openelis-global-ig/StructureDefinition/open-elispractitioner",
  "version" : "0.1.0",
  "name" : "OpenELISPractitioner",
  "title" : "OpenELIS Practitioner",
  "status" : "draft",
  "date" : "2026-03-23T16:02:58+00:00",
  "description" : "A Practitioner Resource used for FHIR Exchange",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "open-elispractitioner-mapping",
    "uri" : "http://digi-uw.github.io/openelis-global-ig/StructureDefinition/open-elis-practitioner",
    "name" : "OpenELIS Vs FHIR",
    "comment" : "Practitioner Mapping shows how attributes of FHIR Practitioner Resource maps to and from the attributes of OpenElis Provider Object."
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "servd",
    "uri" : "http://www.omg.org/spec/ServD/1.0/",
    "name" : "ServD"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Practitioner",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Practitioner",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Practitioner",
      "path" : "Practitioner",
      "mapping" : [{
        "identity" : "open-elispractitioner-mapping",
        "map" : "OE Practitioner",
        "comment" : "This profile maps FHIR Practitioner to OE DataExchange."
      }]
    },
    {
      "id" : "Practitioner.id",
      "path" : "Practitioner.id",
      "min" : 1,
      "mapping" : [{
        "identity" : "open-elispractitioner-mapping",
        "map" : "Provider.fhirUuid"
      }]
    },
    {
      "id" : "Practitioner.name",
      "path" : "Practitioner.name",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Practitioner.name.family",
      "path" : "Practitioner.name.family",
      "mapping" : [{
        "identity" : "open-elispractitioner-mapping",
        "map" : "Provider.person.lastName"
      }]
    },
    {
      "id" : "Practitioner.name.given",
      "path" : "Practitioner.name.given",
      "mapping" : [{
        "identity" : "open-elispractitioner-mapping",
        "map" : "Provider.person.firstName"
      }]
    },
    {
      "id" : "Practitioner.telecom",
      "path" : "Practitioner.telecom",
      "min" : 1,
      "max" : "1",
      "mapping" : [{
        "identity" : "open-elispractitioner-mapping",
        "map" : "Provider.person.primaryPhone"
      }]
    }]
  }
}

```
