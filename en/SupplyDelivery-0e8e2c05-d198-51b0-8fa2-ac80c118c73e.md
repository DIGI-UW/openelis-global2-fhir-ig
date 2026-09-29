# Shipment box (sent) - OpenELIS Global FHIR Implementation Guide v0.2.0

## Example SupplyDelivery: Shipment box (sent)



## Resource Content

```json
{
  "resourceType" : "SupplyDelivery",
  "id" : "0e8e2c05-d198-51b0-8fa2-ac80c118c73e",
  "meta" : {
    "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-shipment-box"]
  },
  "contained" : [{
    "resourceType" : "Location",
    "id" : "destination-facility",
    "name" : "National Reference Laboratory",
    "managingOrganization" : {
      "reference" : "Organization/32a104cd-6337-5d1b-b1a9-6849e98b2200",
      "display" : "National Reference Laboratory"
    }
  }],
  "extension" : [{
    "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-destination-org",
    "valueString" : "32a104cd-6337-5d1b-b1a9-6849e98b2200"
  },
  {
    "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-source-org",
    "valueString" : "Example District Hospital Laboratory"
  },
  {
    "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-temperature",
    "valueString" : "2-8 °C"
  },
  {
    "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-capacity",
    "valueInteger" : 50
  },
  {
    "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-notes",
    "valueString" : "Confirmatory testing"
  },
  {
    "extension" : [{
      "url" : "label",
      "valueString" : "EDH26000000417"
    },
    {
      "url" : "type",
      "valueString" : "Serum"
    }],
    "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-content-item"
  },
  {
    "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-specimen",
    "valueReference" : {
      "reference" : "Specimen/97b37d86-fd55-529b-bbd7-4766f3988fab",
      "display" : "Serum"
    }
  },
  {
    "extension" : [{
      "url" : "type",
      "valueString" : "Serum"
    },
    {
      "url" : "count",
      "valueInteger" : 1
    }],
    "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/shipment-specimen-type-summary"
  }],
  "identifier" : [{
    "system" : "http://openelis.org/shipment/box-id",
    "value" : "BOX-2026-0091"
  }],
  "status" : "in-progress",
  "suppliedItem" : {
    "quantity" : {
      "value" : 1,
      "unit" : "specimens",
      "system" : "http://unitsofmeasure.org",
      "code" : "{specimens}"
    },
    "itemCodeableConcept" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "434711009",
        "display" : "Specimen container"
      }]
    }
  },
  "occurrenceDateTime" : "2026-09-28T15:10:00+10:00",
  "supplier" : {
    "reference" : "Organization/a845f2db-10e5-5117-ac75-553f615e301a"
  },
  "destination" : {
    "reference" : "#destination-facility",
    "display" : "National Reference Laboratory"
  }
}

```
