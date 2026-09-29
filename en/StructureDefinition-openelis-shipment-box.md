# OpenELIS Shipment Box - OpenELIS Global FHIR Implementation Guide v0.2.0

## Resource Profile: OpenELIS Shipment Box 

 
A box of specimens shipped from one OpenELIS site to another (ShippingBoxFhirTransform). Written to the sender's FHIR store on creation and on every status change. The receiving OpenELIS polls each remote source for SupplyDelivery?status=in-progress (ShipmentFhirImportService). SupplyDelivery is not served from /fhir. 

**Usages:**

* Examples for this Profile: [SupplyDelivery/0e8e2c05-d198-51b0-8fa2-ac80c118c73e](SupplyDelivery-0e8e2c05-d198-51b0-8fa2-ac80c118c73e.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-openelis-shipment-box.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-openelis-shipment-box.csv), [Excel](../StructureDefinition-openelis-shipment-box.xlsx), [Schematron](../StructureDefinition-openelis-shipment-box.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "openelis-shipment-box",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-shipment-box",
  "version" : "0.2.0",
  "name" : "OpenELISShipmentBox",
  "title" : "OpenELIS Shipment Box",
  "status" : "draft",
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
  "description" : "A box of specimens shipped from one OpenELIS site to another (ShippingBoxFhirTransform). Written to the sender's FHIR store on creation and on every status change. The receiving OpenELIS polls each remote source for SupplyDelivery?status=in-progress (ShipmentFhirImportService). SupplyDelivery is not served from /fhir.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "001",
      "display" : "World"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "oe-data-model",
    "uri" : "https://github.com/DIGI-UW/OpenELIS-Global-2",
    "name" : "OpenELIS Global data model"
  },
  {
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "SupplyDelivery",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/SupplyDelivery",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "SupplyDelivery",
      "path" : "SupplyDelivery",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "ShippingBox (ShippingBoxFhirTransform)"
      }]
    },
    {
      "id" : "SupplyDelivery.id",
      "path" : "SupplyDelivery.id",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "ShippingBox.fhirUuid"
      }]
    },
    {
      "id" : "SupplyDelivery.extension",
      "path" : "SupplyDelivery.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "SupplyDelivery.extension:destinationOrg",
      "path" : "SupplyDelivery.extension",
      "sliceName" : "destinationOrg",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-destination-org"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "SupplyDelivery.extension:sourceOrg",
      "path" : "SupplyDelivery.extension",
      "sliceName" : "sourceOrg",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-source-org"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "SupplyDelivery.extension:temperature",
      "path" : "SupplyDelivery.extension",
      "sliceName" : "temperature",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-temperature"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "ShippingBox.temperatureRequirement"
      }]
    },
    {
      "id" : "SupplyDelivery.extension:capacity",
      "path" : "SupplyDelivery.extension",
      "sliceName" : "capacity",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-capacity"]
      }],
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "ShippingBox.capacity"
      }]
    },
    {
      "id" : "SupplyDelivery.extension:notes",
      "path" : "SupplyDelivery.extension",
      "sliceName" : "notes",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-notes"]
      }],
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "ShippingBox.notes"
      }]
    },
    {
      "id" : "SupplyDelivery.extension:contentItem",
      "path" : "SupplyDelivery.extension",
      "sliceName" : "contentItem",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-content-item"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "BoxSampleItem (accession number / sample type)"
      }]
    },
    {
      "id" : "SupplyDelivery.extension:nonConformity",
      "path" : "SupplyDelivery.extension",
      "sliceName" : "nonConformity",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-non-conformity"]
      }],
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "BoxSampleItem.receptionStatus"
      }]
    },
    {
      "id" : "SupplyDelivery.extension:specimen",
      "path" : "SupplyDelivery.extension",
      "sliceName" : "specimen",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-specimen"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "BoxSampleItem.sampleItem"
      }]
    },
    {
      "id" : "SupplyDelivery.extension:typeSummary",
      "path" : "SupplyDelivery.extension",
      "sliceName" : "typeSummary",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-specimen-type-summary"]
      }]
    },
    {
      "id" : "SupplyDelivery.extension:eqaCycle",
      "path" : "SupplyDelivery.extension",
      "sliceName" : "eqaCycle",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/eqa-cycle"]
      }],
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "ShippingBox.eqaCycleId"
      }]
    },
    {
      "id" : "SupplyDelivery.identifier",
      "path" : "SupplyDelivery.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "system"
        }],
        "description" : "Sliced by identifier system",
        "rules" : "open"
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "SupplyDelivery.identifier:boxId",
      "path" : "SupplyDelivery.identifier",
      "sliceName" : "boxId",
      "short" : "Shipping box id",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "ShippingBox.boxId"
      }]
    },
    {
      "id" : "SupplyDelivery.identifier:boxId.system",
      "path" : "SupplyDelivery.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis.org/shipment/box-id"
    },
    {
      "id" : "SupplyDelivery.identifier:boxId.value",
      "path" : "SupplyDelivery.identifier.value",
      "min" : 1
    },
    {
      "id" : "SupplyDelivery.status",
      "path" : "SupplyDelivery.status",
      "comment" : "Draft, ready to send, sent and in transit = in-progress. Received, partially received and reconciled = completed. Cancelled and lost in transit = abandoned. On reception the receiver sets the sender's copy to completed when org.openelisglobal.remote.source.updateStatus=true.",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "ShippingBox.status"
      }]
    },
    {
      "id" : "SupplyDelivery.type",
      "path" : "SupplyDelivery.type",
      "comment" : "Recommended: omit (see Known Issues). Currently http://terminology.hl7.org/CodeSystem/supply-item-type#medication with display 'Specimen Shipment' and text 'Specimen Shipment Box' (see Known Issues).",
      "mustSupport" : true
    },
    {
      "id" : "SupplyDelivery.suppliedItem",
      "path" : "SupplyDelivery.suppliedItem",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "SupplyDelivery.suppliedItem.quantity",
      "path" : "SupplyDelivery.suppliedItem.quantity",
      "comment" : "Number of items in the box, as {specimens} (UCUM).",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "count of BoxSampleItem"
      }]
    },
    {
      "id" : "SupplyDelivery.suppliedItem.quantity.system",
      "path" : "SupplyDelivery.suppliedItem.quantity.system",
      "patternUri" : "http://unitsofmeasure.org"
    },
    {
      "id" : "SupplyDelivery.suppliedItem.quantity.code",
      "path" : "SupplyDelivery.suppliedItem.quantity.code",
      "patternCode" : "{specimens}"
    },
    {
      "id" : "SupplyDelivery.suppliedItem.item[x]",
      "path" : "SupplyDelivery.suppliedItem.item[x]",
      "comment" : "SNOMED CT container type: site setting fhirContainerTypeCode, default 434711009 Specimen container.",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "mustSupport" : true
    },
    {
      "id" : "SupplyDelivery.occurrence[x]",
      "path" : "SupplyDelivery.occurrence[x]",
      "comment" : "Sent date, else created date. The receiver ignores boxes older than org.openelisglobal.shipment.import.maxAgeDays (default 30).",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "ShippingBox.sentDate (else createdDate)"
      }]
    },
    {
      "id" : "SupplyDelivery.supplier",
      "path" : "SupplyDelivery.supplier",
      "short" : "The sending site's Organization",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-organization"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Site Organization (SiteInformation siteOrganizationFhirUuid)"
      }]
    },
    {
      "id" : "SupplyDelivery.destination",
      "path" : "SupplyDelivery.destination",
      "comment" : "A reference to a contained Location (#destination-facility) whose managingOrganization is the destination Organization.",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Shipment destination Organization"
      }]
    },
    {
      "id" : "SupplyDelivery.receiver",
      "path" : "SupplyDelivery.receiver",
      "comment" : "Not set. The receiver falls back to receiver.display when looking up the destination by name."
    }]
  }
}

```
