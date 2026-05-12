# AnalyzerTestUnits - OpenELIS GLOBAL2 Implementation Guide v0.1.0



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "analyzer-test-units",
  "url" : "http://digi-uw.github.io/openelis-global-ig/StructureDefinition/analyzer-test-units",
  "version" : "0.1.0",
  "name" : "AnalyzerTestUnits",
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
      "path" : "Extension"
    },
    {
      "id" : "Extension.extension:testUnitId",
      "path" : "Extension.extension",
      "sliceName" : "testUnitId",
      "min" : 0,
      "max" : "*"
    },
    {
      "id" : "Extension.extension:testUnitId.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:testUnitId.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "testUnitId"
    },
    {
      "id" : "Extension.extension:testUnitId.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://digi-uw.github.io/openelis-global-ig/StructureDefinition/analyzer-test-units"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
