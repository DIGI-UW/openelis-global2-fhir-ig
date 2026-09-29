# Shipment specimen type summary - OpenELIS Global FHIR Implementation Guide v0.2.0

## Extension: Shipment specimen type summary 

Count of items in the box per sample type. One repetition per distinct type, in no guaranteed order. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/shipment-specimen-type-summary (see Known Issues).

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [OpenELIS Shipment Box](StructureDefinition-openelis-shipment-box.md)
* Examples for this Extension: [SupplyDelivery/0e8e2c05-d198-51b0-8fa2-ac80c118c73e](SupplyDelivery-0e8e2c05-d198-51b0-8fa2-ac80c118c73e.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-shipment-specimen-type-summary.json)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-shipment-specimen-type-summary.csv), [Excel](../StructureDefinition-shipment-specimen-type-summary.xlsx), [Schematron](../StructureDefinition-shipment-specimen-type-summary.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "shipment-specimen-type-summary",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-specimen-type-summary",
  "version" : "0.2.0",
  "name" : "OEShipmentSpecimenTypeSummary",
  "title" : "Shipment specimen type summary",
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
  "description" : "Count of items in the box per sample type. One repetition per distinct type, in no guaranteed order. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/shipment-specimen-type-summary (see Known Issues).",
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
    "expression" : "SupplyDelivery"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Shipment specimen type summary",
      "definition" : "Count of items in the box per sample type. One repetition per distinct type, in no guaranteed order. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/shipment-specimen-type-summary (see Known Issues)."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "min" : 2
    },
    {
      "id" : "Extension.extension:type",
      "path" : "Extension.extension",
      "sliceName" : "type",
      "short" : "Sample type description (\"Unknown\" if none)",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:type.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:type.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "type"
    },
    {
      "id" : "Extension.extension:type.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "Extension.extension:count",
      "path" : "Extension.extension",
      "sliceName" : "count",
      "short" : "Number of items of that type",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:count.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:count.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "count"
    },
    {
      "id" : "Extension.extension:count.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-specimen-type-summary"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
