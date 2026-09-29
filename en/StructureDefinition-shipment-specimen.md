# Shipped specimen - OpenELIS Global FHIR Implementation Guide v0.2.0

## Extension: Shipped specimen 

A Specimen in the box. Repeats once per sample item with a FHIR id. The receiving site uses these references at reception. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/shipment-specimen (see Known Issues).

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [OpenELIS Shipment Box](StructureDefinition-openelis-shipment-box.md)
* Examples for this Extension: [SupplyDelivery/0e8e2c05-d198-51b0-8fa2-ac80c118c73e](SupplyDelivery-0e8e2c05-d198-51b0-8fa2-ac80c118c73e.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-shipment-specimen.json)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-shipment-specimen.csv), [Excel](../StructureDefinition-shipment-specimen.xlsx), [Schematron](../StructureDefinition-shipment-specimen.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "shipment-specimen",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-specimen",
  "version" : "0.2.0",
  "name" : "OEShipmentSpecimen",
  "title" : "Shipped specimen",
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
  "description" : "A Specimen in the box. Repeats once per sample item with a FHIR id. The receiving site uses these references at reception. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/shipment-specimen (see Known Issues).",
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
      "short" : "Shipped specimen",
      "definition" : "A Specimen in the box. Repeats once per sample item with a FHIR id. The receiving site uses these references at reception. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/shipment-specimen (see Known Issues)."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-specimen"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-specimen"]
      }]
    }]
  }
}

```
