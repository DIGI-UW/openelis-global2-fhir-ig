# Shipment non-conformity - OpenELIS Global FHIR Implementation Guide v0.2.0

## Extension: Shipment non-conformity 

A problem recorded when the box was received (damaged, leaked, missing, rejected). SNOMED CT by default. Codes can be overridden per site. Only sent after reception. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/shipment-non-conformity (see Known Issues).

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [OpenELIS Shipment Box](StructureDefinition-openelis-shipment-box.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-shipment-non-conformity.json)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-shipment-non-conformity.csv), [Excel](../StructureDefinition-shipment-non-conformity.xlsx), [Schematron](../StructureDefinition-shipment-non-conformity.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "shipment-non-conformity",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-non-conformity",
  "version" : "0.2.0",
  "name" : "OEShipmentNonConformity",
  "title" : "Shipment non-conformity",
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
  "description" : "A problem recorded when the box was received (damaged, leaked, missing, rejected). SNOMED CT by default. Codes can be overridden per site. Only sent after reception. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/shipment-non-conformity (see Known Issues).",
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
      "short" : "Shipment non-conformity",
      "definition" : "A problem recorded when the box was received (damaged, leaked, missing, rejected). SNOMED CT by default. Codes can be overridden per site. Only sent after reception. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/shipment-non-conformity (see Known Issues)."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-non-conformity"
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
