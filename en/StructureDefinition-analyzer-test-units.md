# Analyzer test units - OpenELIS Global FHIR Implementation Guide v0.2.0

## Extension: Analyzer test units 

The OpenELIS test units (lab sections) the analyzer serves. OpenELIS currently sends this extension with url http://openelis.org/fhir/StructureDefinition/analyzer-test-units (see Known Issues).

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [OpenELIS Analyzer Device](StructureDefinition-openelis-analyzer-device.md)
* Examples for this Extension: [Device/ff2b5d6a-ff46-5f20-b254-4eaa0615d555](Device-ff2b5d6a-ff46-5f20-b254-4eaa0615d555.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-analyzer-test-units.json)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-analyzer-test-units.csv), [Excel](../StructureDefinition-analyzer-test-units.xlsx), [Schematron](../StructureDefinition-analyzer-test-units.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "analyzer-test-units",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/analyzer-test-units",
  "version" : "0.2.0",
  "name" : "OEAnalyzerTestUnits",
  "title" : "Analyzer test units",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-09-29T02:24:20+00:00",
  "publisher" : "OpenELIS Global (Digital Initiatives Group, University of Washington)",
  "contact" : [{
    "name" : "OpenELIS Global (Digital Initiatives Group, University of Washington)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://openelis-global.org"
    }]
  },
  {
    "name" : "OpenELIS Global community",
    "telecom" : [{
      "system" : "url",
      "value" : "https://uwdigi.atlassian.net/wiki/spaces/oeg/overview"
    }]
  }],
  "description" : "The OpenELIS test units (lab sections) the analyzer serves. OpenELIS currently sends this extension with url http://openelis.org/fhir/StructureDefinition/analyzer-test-units (see Known Issues).",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "001",
      "display" : "World"
    }]
  }],
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
    "expression" : "Device"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Analyzer test units",
      "definition" : "The OpenELIS test units (lab sections) the analyzer serves. OpenELIS currently sends this extension with url http://openelis.org/fhir/StructureDefinition/analyzer-test-units (see Known Issues)."
    },
    {
      "id" : "Extension.extension:testUnitId",
      "path" : "Extension.extension",
      "sliceName" : "testUnitId",
      "short" : "OpenELIS test unit id",
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
      "fixedUri" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/analyzer-test-units"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
