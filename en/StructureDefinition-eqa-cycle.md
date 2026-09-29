# EQA cycle - OpenELIS Global FHIR Implementation Guide v0.2.0

## Extension: EQA cycle 

External quality assessment cycle the consignment belongs to. Only sent for EQA boxes. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/eqa-cycle (see Known Issues).

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [OpenELIS Shipment Box](StructureDefinition-openelis-shipment-box.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-eqa-cycle.json)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-eqa-cycle.csv), [Excel](../StructureDefinition-eqa-cycle.xlsx), [Schematron](../StructureDefinition-eqa-cycle.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "eqa-cycle",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/eqa-cycle",
  "version" : "0.2.0",
  "name" : "OEEQACycle",
  "title" : "EQA cycle",
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
  "description" : "External quality assessment cycle the consignment belongs to. Only sent for EQA boxes. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/eqa-cycle (see Known Issues).",
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
      "short" : "EQA cycle",
      "definition" : "External quality assessment cycle the consignment belongs to. Only sent for EQA boxes. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/eqa-cycle (see Known Issues)."
    },
    {
      "id" : "Extension.extension:scheme",
      "path" : "Extension.extension",
      "sliceName" : "scheme",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:scheme.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:scheme.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "scheme"
    },
    {
      "id" : "Extension.extension:scheme.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "Extension.extension:number",
      "path" : "Extension.extension",
      "sliceName" : "number",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:number.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:number.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "number"
    },
    {
      "id" : "Extension.extension:number.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "Extension.extension:name",
      "path" : "Extension.extension",
      "sliceName" : "name",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:name.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:name.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "name"
    },
    {
      "id" : "Extension.extension:name.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "Extension.extension:distributionDate",
      "path" : "Extension.extension",
      "sliceName" : "distributionDate",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:distributionDate.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:distributionDate.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "distributionDate"
    },
    {
      "id" : "Extension.extension:distributionDate.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "Extension.extension:submissionDeadline",
      "path" : "Extension.extension",
      "sliceName" : "submissionDeadline",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:submissionDeadline.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:submissionDeadline.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "submissionDeadline"
    },
    {
      "id" : "Extension.extension:submissionDeadline.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/eqa-cycle"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
