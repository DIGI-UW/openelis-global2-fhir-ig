# Grid dimensions - OpenELIS Global FHIR Implementation Guide v0.2.0

## Extension: Grid dimensions 

Grid of a storage box as the string "{rows} × {columns}" (U+00D7 multiplication sign, with spaces), for example "9 × 9". Parsed on import. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/rack-grid-dimensions (see Known Issues).

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [OpenELIS Storage Location](StructureDefinition-openelis-storage-location.md)
* Examples for this Extension: [B3](Location-613ff118-ceeb-5472-9793-dc241d0d032c.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-rack-grid-dimensions.json)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-rack-grid-dimensions.csv), [Excel](../StructureDefinition-rack-grid-dimensions.xlsx), [Schematron](../StructureDefinition-rack-grid-dimensions.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "rack-grid-dimensions",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/rack-grid-dimensions",
  "version" : "0.2.0",
  "name" : "OERackGridDimensions",
  "title" : "Grid dimensions",
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
  "description" : "Grid of a storage box as the string \"{rows} × {columns}\" (U+00D7 multiplication sign, with spaces), for example \"9 × 9\". Parsed on import. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/rack-grid-dimensions (see Known Issues).",
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
    "expression" : "Location"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Grid dimensions",
      "definition" : "Grid of a storage box as the string \"{rows} × {columns}\" (U+00D7 multiplication sign, with spaces), for example \"9 × 9\". Parsed on import. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/rack-grid-dimensions (see Known Issues)."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/rack-grid-dimensions"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
