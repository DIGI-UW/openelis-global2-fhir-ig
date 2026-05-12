# Analyzer Transport Details - OpenELIS GLOBAL2 Implementation Guide v0.1.0



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "analyzer-transport-details",
  "url" : "http://digi-uw.github.io/openelis-global-ig/StructureDefinition/analyzer-transport-details",
  "version" : "0.1.0",
  "name" : "AnalyzerTransportDetails",
  "title" : "Analyzer Transport Details",
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
      "short" : "Analyzer Transport Details"
    },
    {
      "id" : "Extension.extension:ipAddress",
      "path" : "Extension.extension",
      "sliceName" : "ipAddress",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:ipAddress.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "ipAddress"
    },
    {
      "id" : "Extension.extension:port",
      "path" : "Extension.extension",
      "sliceName" : "port",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:port.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "port"
    },
    {
      "id" : "Extension.extension:importDirectory",
      "path" : "Extension.extension",
      "sliceName" : "importDirectory",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:importDirectory.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "importDirectory"
    },
    {
      "id" : "Extension.extension:filePattern",
      "path" : "Extension.extension",
      "sliceName" : "filePattern",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:filePattern.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "filePattern"
    },
    {
      "id" : "Extension.extension:fileFormat",
      "path" : "Extension.extension",
      "sliceName" : "fileFormat",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:fileFormat.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "fileFormat"
    },
    {
      "id" : "Extension.extension:delimiter",
      "path" : "Extension.extension",
      "sliceName" : "delimiter",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:delimiter.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "delimiter"
    },
    {
      "id" : "Extension.extension:hasHeader",
      "path" : "Extension.extension",
      "sliceName" : "hasHeader",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:hasHeader.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "hasHeader"
    },
    {
      "id" : "Extension.extension:skipRows",
      "path" : "Extension.extension",
      "sliceName" : "skipRows",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:skipRows.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "skipRows"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://digi-uw.github.io/openelis-global-ig/StructureDefinition/analyzer-transport-details"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
