# OpenElis Specimen - OpenELIS GLOBAL2 Implementation Guide v0.1.0



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "open-elis-specimen",
  "url" : "http://digi-uw.github.io/openelis-global-ig/StructureDefinition/open-elis-specimen",
  "version" : "0.1.0",
  "name" : "OpenElisSpecimen",
  "title" : "OpenElis Specimen",
  "status" : "draft",
  "date" : "2026-05-11T11:15:58+00:00",
  "description" : "A Specimen Resource used for FHIR Exchange",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "oe-specimen-mapping",
    "uri" : "Specimen",
    "name" : "OpenELIS Vs FHIR",
    "comment" : "Specimen Mapping shows how attributes of FHIR Specimen Resource maps to and from the attributes of OpenElis SampleItem Object."
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Specimen",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Specimen",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Specimen",
      "path" : "Specimen",
      "mapping" : [{
        "identity" : "oe-specimen-mapping",
        "map" : "OE Specimen",
        "comment" : "This profile maps FHIR Specimen to OE DataExchange."
      }]
    },
    {
      "id" : "Specimen.id",
      "path" : "Specimen.id",
      "mapping" : [{
        "identity" : "oe-specimen-mapping",
        "map" : "SampleItem.fhirUuid"
      }]
    },
    {
      "id" : "Specimen.identifier",
      "path" : "Specimen.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "system"
        }],
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "Specimen.identifier:uuid",
      "path" : "Specimen.identifier",
      "sliceName" : "uuid",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Specimen.identifier:uuid.system",
      "path" : "Specimen.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/sampleItem_uuid"
    },
    {
      "id" : "Specimen.accessionIdentifier",
      "path" : "Specimen.accessionIdentifier",
      "min" : 1
    },
    {
      "id" : "Specimen.accessionIdentifier.value",
      "path" : "Specimen.accessionIdentifier.value",
      "mapping" : [{
        "identity" : "oe-specimen-mapping",
        "map" : "SampleItem.sample.accessionNumber"
      }]
    },
    {
      "id" : "Specimen.status",
      "path" : "Specimen.status",
      "min" : 1
    },
    {
      "id" : "Specimen.type",
      "path" : "Specimen.type",
      "min" : 1
    },
    {
      "id" : "Specimen.type.coding.code",
      "path" : "Specimen.type.coding.code",
      "mapping" : [{
        "identity" : "oe-specimen-mapping",
        "map" : "SampleItem.typeOfSample.localAbbreviation"
      }]
    },
    {
      "id" : "Specimen.type.coding.display",
      "path" : "Specimen.type.coding.display",
      "mapping" : [{
        "identity" : "oe-specimen-mapping",
        "map" : "SampleItem.typeOfSample.localizedName"
      }]
    },
    {
      "id" : "Specimen.subject",
      "path" : "Specimen.subject",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/openelis-patient"]
      }],
      "mapping" : [{
        "identity" : "oe-specimen-mapping",
        "map" : "Patient"
      }]
    },
    {
      "id" : "Specimen.receivedTime",
      "path" : "Specimen.receivedTime",
      "min" : 1
    },
    {
      "id" : "Specimen.request",
      "path" : "Specimen.request",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/openelis-service-request"]
      }],
      "mapping" : [{
        "identity" : "oe-specimen-mapping",
        "map" : "Analysis"
      }]
    },
    {
      "id" : "Specimen.collection",
      "path" : "Specimen.collection",
      "min" : 1,
      "mapping" : [{
        "identity" : "oe-specimen-mapping",
        "map" : "SampleItem.collectionDate"
      }]
    },
    {
      "id" : "Specimen.collection.collected[x]",
      "path" : "Specimen.collection.collected[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "Specimen.collection.collected[x]:collectedDateTime",
      "path" : "Specimen.collection.collected[x]",
      "sliceName" : "collectedDateTime",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    }]
  }
}

```
