# OpenELIS Facility Location - OpenELIS GLOBAL2 Implementation Guide v0.1.0



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "open-elis-location",
  "url" : "http://digi-uw.github.io/openelis-global-ig/StructureDefinition/open-elis-location",
  "version" : "0.1.0",
  "name" : "OpenELISLocation",
  "title" : "OpenELIS Facility Location",
  "status" : "draft",
  "date" : "2026-05-11T11:15:58+00:00",
  "description" : "A Location Resource used for FHIR Exchange",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Location",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Location",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Location",
      "path" : "Location"
    }]
  }
}

```
