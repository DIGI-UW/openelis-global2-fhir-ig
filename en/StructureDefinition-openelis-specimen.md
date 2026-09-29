# OpenELIS Specimen - OpenELIS Global FHIR Implementation Guide v0.2.0

## Resource Profile: OpenELIS Specimen 

 
A sample item as OpenELIS produces it (SpecimenTransformServiceImpl) and serves it from /fhir/Specimen. 

**Usages:**

* Refer to this Profile: [OpenELIS DiagnosticReport](StructureDefinition-openelis-diagnostic-report.md), [OpenELIS Observation](StructureDefinition-openelis-observation.md), [OpenELIS ServiceRequest](StructureDefinition-openelis-service-request.md) and [Shipped specimen](StructureDefinition-shipment-specimen.md)
* Examples for this Profile: [Specimen/97b37d86-fd55-529b-bbd7-4766f3988fab](Specimen-97b37d86-fd55-529b-bbd7-4766f3988fab.md)
* CapabilityStatements using this Profile: [OpenELIS Global FHIR REST server](CapabilityStatement-OpenELISFhirServer.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-openelis-specimen.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-openelis-specimen.csv), [Excel](../StructureDefinition-openelis-specimen.xlsx), [Schematron](../StructureDefinition-openelis-specimen.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "openelis-specimen",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-specimen",
  "version" : "0.2.0",
  "name" : "OpenELISSpecimen",
  "title" : "OpenELIS Specimen",
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
  "description" : "A sample item as OpenELIS produces it (SpecimenTransformServiceImpl) and serves it from /fhir/Specimen.",
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
        "identity" : "oe-data-model",
        "map" : "SampleItem (SpecimenTransformServiceImpl)"
      }]
    },
    {
      "id" : "Specimen.id",
      "path" : "Specimen.id",
      "mapping" : [{
        "identity" : "oe-data-model",
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
        "description" : "Sliced by identifier system",
        "rules" : "open"
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Specimen.identifier:sampleItemUuid",
      "path" : "Specimen.identifier",
      "sliceName" : "sampleItemUuid",
      "short" : "OpenELIS sample item UUID (equals Specimen.id)",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "SampleItem.fhirUuid"
      }]
    },
    {
      "id" : "Specimen.identifier:sampleItemUuid.system",
      "path" : "Specimen.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/sampleItem_uuid"
    },
    {
      "id" : "Specimen.identifier:sampleItemUuid.value",
      "path" : "Specimen.identifier.value",
      "min" : 1
    },
    {
      "id" : "Specimen.identifier:facility",
      "path" : "Specimen.identifier",
      "sliceName" : "facility",
      "short" : "Identifier of the OpenELIS site that produced this resource",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Specimen.identifier:facility.use",
      "path" : "Specimen.identifier.use",
      "patternCode" : "official"
    },
    {
      "id" : "Specimen.identifier:facility.system",
      "path" : "Specimen.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/facility_id"
    },
    {
      "id" : "Specimen.identifier:facility.value",
      "path" : "Specimen.identifier.value",
      "min" : 1
    },
    {
      "id" : "Specimen.identifier:facility.assigner",
      "path" : "Specimen.identifier.assigner",
      "short" : "The site Organization",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-organization"]
      }]
    },
    {
      "id" : "Specimen.accessionIdentifier",
      "path" : "Specimen.accessionIdentifier",
      "short" : "Order lab number, followed by -{sortOrder} when the item has one",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Sample.accessionNumber + '-' + SampleItem.sortOrder"
      }]
    },
    {
      "id" : "Specimen.accessionIdentifier.system",
      "path" : "Specimen.accessionIdentifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/sampleItem_labNo"
    },
    {
      "id" : "Specimen.accessionIdentifier.value",
      "path" : "Specimen.accessionIdentifier.value",
      "min" : 1
    },
    {
      "id" : "Specimen.status",
      "path" : "Specimen.status",
      "comment" : "Cancelled = unsatisfactory. Disposed = unavailable. Otherwise available.",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "SampleItem.statusId"
      }]
    },
    {
      "id" : "Specimen.type",
      "path" : "Specimen.type",
      "comment" : "Always carries the OpenELIS sample type, plus the sample type's terminology mappings (for example SNOMED CT).",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "SampleItem.typeOfSample (+ terminology mappings)"
      }]
    },
    {
      "id" : "Specimen.type.coding",
      "path" : "Specimen.type.coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "system"
        }],
        "rules" : "open"
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Specimen.type.coding:oeSampleType",
      "path" : "Specimen.type.coding",
      "sliceName" : "oeSampleType",
      "short" : "OpenELIS sample type (local abbreviation)",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Specimen.type.coding:oeSampleType.system",
      "path" : "Specimen.type.coding.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/sampleType"
    },
    {
      "id" : "Specimen.type.coding:oeSampleType.code",
      "path" : "Specimen.type.coding.code",
      "min" : 1
    },
    {
      "id" : "Specimen.subject",
      "path" : "Specimen.subject",
      "comment" : "Absent for environmental and vector samples.",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-patient"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "SampleHuman.patient"
      }]
    },
    {
      "id" : "Specimen.receivedTime",
      "path" : "Specimen.receivedTime",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "SampleItem.receivedDate"
      }]
    },
    {
      "id" : "Specimen.request",
      "path" : "Specimen.request",
      "short" : "Every test ordered on this sample item",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-service-request"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analysis (all analyses on the sample item)"
      }]
    },
    {
      "id" : "Specimen.collection",
      "path" : "Specimen.collection",
      "comment" : "Omitted when the sample item has no collection date, GPS, source or collection conditions.",
      "mustSupport" : true
    },
    {
      "id" : "Specimen.collection.extension",
      "path" : "Specimen.collection.extension",
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
      "id" : "Specimen.collection.extension:gps",
      "path" : "Specimen.collection.extension",
      "sliceName" : "gps",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/collection-location-gps"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Sample.gpsLatitude / gpsLongitude / gpsAccuracyMeters / gpsCaptureMethod / gpsCaptureTimestamp"
      }]
    },
    {
      "id" : "Specimen.collection.collector",
      "path" : "Specimen.collection.collector",
      "comment" : "Not populated by OpenELIS today (see Known Issues)."
    },
    {
      "id" : "Specimen.collection.collected[x]",
      "path" : "Specimen.collection.collected[x]",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "SampleItem.collectionDate"
      }]
    },
    {
      "id" : "Specimen.collection.method",
      "path" : "Specimen.collection.method",
      "comment" : "text only: the collection conditions.",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "SampleItem.collectionConditions"
      }]
    },
    {
      "id" : "Specimen.collection.bodySite",
      "path" : "Specimen.collection.bodySite",
      "comment" : "text only: the configured source of sample, or the free-text other source.",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "SampleItem.sourceOfSample / sourceOther"
      }]
    },
    {
      "id" : "Specimen.container",
      "path" : "Specimen.container",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Specimen.container.type",
      "path" : "Specimen.container.type",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "434711009",
          "display" : "Specimen container (physical object)"
        }]
      }
    },
    {
      "id" : "Specimen.container.specimenQuantity",
      "path" : "Specimen.container.specimenQuantity",
      "comment" : "code is the OpenELIS unit-of-measure name with system UCUM. Not every OpenELIS unit name is a valid UCUM code (see Known Issues).",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "SampleItem.quantity + unitOfMeasure"
      }]
    },
    {
      "id" : "Specimen.condition",
      "path" : "Specimen.condition",
      "comment" : "On order entry: the sample's condition on receipt, coded with {oe}/sample_condition.",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "ObservationHistory SAMPLE_CONDITION"
      }]
    },
    {
      "id" : "Specimen.note",
      "path" : "Specimen.note",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "SampleItem.collectionConditions"
      }]
    }]
  }
}

```
