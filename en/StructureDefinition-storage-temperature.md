# Storage temperature - OpenELIS Global FHIR Implementation Guide v0.2.0

## Extension: Storage temperature 

Temperature setting of a storage device. The unit is not carried on the wire (see Known Issues). OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/storage-temperature (see Known Issues).

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [OpenELIS Storage Location](StructureDefinition-openelis-storage-location.md)
* Examples for this Extension: [Freezer 01 (-80)](Location-3d2a1373-14d8-5bef-ae7e-817917e5a4fd.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-storage-temperature.json)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-storage-temperature.csv), [Excel](../StructureDefinition-storage-temperature.xlsx), [Schematron](../StructureDefinition-storage-temperature.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "storage-temperature",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/storage-temperature",
  "version" : "0.2.0",
  "name" : "OEStorageTemperature",
  "title" : "Storage temperature",
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
  "description" : "Temperature setting of a storage device. The unit is not carried on the wire (see Known Issues). OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/storage-temperature (see Known Issues).",
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
      "short" : "Storage temperature",
      "definition" : "Temperature setting of a storage device. The unit is not carried on the wire (see Known Issues). OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/storage-temperature (see Known Issues)."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/storage-temperature"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "decimal"
      }]
    }]
  }
}

```
