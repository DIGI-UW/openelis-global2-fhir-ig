# Analyzer Communication Mode - OpenELIS GLOBAL2 Implementation Guide v0.1.0



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "analyzer-communication-mode",
  "url" : "http://digi-uw.github.io/openelis-global-ig/StructureDefinition/analyzer-communication-mode",
  "version" : "0.1.0",
  "name" : "AnalyzerCommunicationMode",
  "title" : "Analyzer Communication Mode",
  "status" : "draft",
  "date" : "2026-05-12T16:33:42+00:00",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "Element"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Analyzer Communication Mode"
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://digi-uw.github.io/openelis-global-ig/StructureDefinition/analyzer-communication-mode"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    }]
  }
}

```
