# Analyzer operational status - OpenELIS Global FHIR Implementation Guide v0.2.0

## Extension: Analyzer operational status 

OpenELIS's own analyzer lifecycle status, unmapped. Device.status carries the mapped FHIR value. Ignored on import. OpenELIS currently sends this extension with url http://openelis.org/fhir/StructureDefinition/analyzer-operational-status (see Known Issues).

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [OpenELIS Analyzer Device](StructureDefinition-openelis-analyzer-device.md)
* Examples for this Extension: [Device/ff2b5d6a-ff46-5f20-b254-4eaa0615d555](Device-ff2b5d6a-ff46-5f20-b254-4eaa0615d555.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-analyzer-operational-status.json)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-analyzer-operational-status.csv), [Excel](../StructureDefinition-analyzer-operational-status.xlsx), [Schematron](../StructureDefinition-analyzer-operational-status.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "analyzer-operational-status",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/analyzer-operational-status",
  "version" : "0.2.0",
  "name" : "OEAnalyzerOperationalStatusExt",
  "title" : "Analyzer operational status",
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
  "description" : "OpenELIS's own analyzer lifecycle status, unmapped. Device.status carries the mapped FHIR value. Ignored on import. OpenELIS currently sends this extension with url http://openelis.org/fhir/StructureDefinition/analyzer-operational-status (see Known Issues).",
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
      "short" : "Analyzer operational status",
      "definition" : "OpenELIS's own analyzer lifecycle status, unmapped. Device.status carries the mapped FHIR value. Ignored on import. OpenELIS currently sends this extension with url http://openelis.org/fhir/StructureDefinition/analyzer-operational-status (see Known Issues)."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/analyzer-operational-status"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "code"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://digi-uw.github.io/openelis-global2-fhir-ig/ValueSet/oe-analyzer-operational-status"
      }
    }]
  }
}

```
