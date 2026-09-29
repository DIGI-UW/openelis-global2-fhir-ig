# OpenELIS Storage Location - OpenELIS Global FHIR Implementation Guide v0.2.0

## Resource Profile: OpenELIS Storage Location 

 
A level of the OpenELIS sample storage hierarchy: room, storage device (equipment), shelf, rack or box (StorageLocationFhirTransform). Served from /fhir/Location with read, create, update, delete and search (including _tag and _include=Location:partof). Every change is also mirrored to the FHIR store. The level is carried in meta.tag. 

**Usages:**

* Refer to this Profile: [OpenELIS Storage Location](StructureDefinition-openelis-storage-location.md)
* Examples for this Profile: [Main laboratory storage](Location-1fa151e6-afa2-531c-b70c-fd63b88c10f0.md), [Freezer 01 (-80)](Location-3d2a1373-14d8-5bef-ae7e-817917e5a4fd.md), [Rack 2](Location-5a9cc354-9495-5090-91d7-b67b0d2ef5dc.md), [B3](Location-613ff118-ceeb-5472-9793-dc241d0d032c.md) and [Shelf 1](Location-8264f454-03c2-597b-996d-b9ea0998f326.md)
* CapabilityStatements using this Profile: [OpenELIS Global FHIR REST server](CapabilityStatement-OpenELISFhirServer.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-openelis-storage-location.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-openelis-storage-location.csv), [Excel](../StructureDefinition-openelis-storage-location.xlsx), [Schematron](../StructureDefinition-openelis-storage-location.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "openelis-storage-location",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-storage-location",
  "version" : "0.2.0",
  "name" : "OpenELISStorageLocation",
  "title" : "OpenELIS Storage Location",
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
  "description" : "A level of the OpenELIS sample storage hierarchy: room, storage device (equipment), shelf, rack or box (StorageLocationFhirTransform). Served from /fhir/Location with read, create, update, delete and search (including _tag and _include=Location:partof). Every change is also mirrored to the FHIR store. The level is carried in meta.tag.",
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
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Location",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Location",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Location",
      "path" : "Location",
      "constraint" : [{
        "key" : "oe-storage-partof",
        "severity" : "error",
        "human" : "Every storage level except room has a parent (partOf).",
        "expression" : "meta.tag.where(system = 'http://openelis.org/fhir/tag/storage-hierarchy' and code = 'room').exists() or partOf.exists()",
        "source" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-storage-location"
      }],
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "StorageRoom / StorageDevice / StorageShelf / StorageRack / StorageBox (StorageLocationFhirTransform)"
      }]
    },
    {
      "id" : "Location.id",
      "path" : "Location.id",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "fhirUuid of the storage entity"
      }]
    },
    {
      "id" : "Location.meta.profile",
      "path" : "Location.meta.profile",
      "comment" : "OpenELIS sends http://ihe.net/fhir/StructureDefinition/IHE.mCSD.Location, which does not resolve to the published IHE mCSD profile (see Known Issues)."
    },
    {
      "id" : "Location.meta.tag",
      "path" : "Location.meta.tag",
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
      "id" : "Location.meta.tag:level",
      "path" : "Location.meta.tag",
      "sliceName" : "level",
      "short" : "Storage hierarchy level",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Location.meta.tag:level.system",
      "path" : "Location.meta.tag.system",
      "min" : 1,
      "patternUri" : "http://openelis.org/fhir/tag/storage-hierarchy"
    },
    {
      "id" : "Location.meta.tag:level.code",
      "path" : "Location.meta.tag.code",
      "short" : "room | device | shelf | rack | box",
      "min" : 1
    },
    {
      "id" : "Location.extension",
      "path" : "Location.extension",
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
      "id" : "Location.extension:temperature",
      "path" : "Location.extension",
      "sliceName" : "temperature",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/storage-temperature"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "StorageDevice.temperatureSetting"
      }]
    },
    {
      "id" : "Location.extension:capacity",
      "path" : "Location.extension",
      "sliceName" : "capacity",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/storage-capacity"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "StorageDevice.capacityLimit / StorageShelf capacity / StorageBox rows x columns"
      }]
    },
    {
      "id" : "Location.extension:ipAddress",
      "path" : "Location.extension",
      "sliceName" : "ipAddress",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/device-ip-address"]
      }],
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "StorageDevice.ipAddress"
      }]
    },
    {
      "id" : "Location.extension:port",
      "path" : "Location.extension",
      "sliceName" : "port",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/device-port"]
      }],
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "StorageDevice.port"
      }]
    },
    {
      "id" : "Location.extension:protocol",
      "path" : "Location.extension",
      "sliceName" : "protocol",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/device-communication-protocol"]
      }],
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "StorageDevice.communicationProtocol"
      }]
    },
    {
      "id" : "Location.extension:gridDimensions",
      "path" : "Location.extension",
      "sliceName" : "gridDimensions",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/rack-grid-dimensions"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "StorageBox.rows / columns"
      }]
    },
    {
      "id" : "Location.extension:positionSchemaHint",
      "path" : "Location.extension",
      "sliceName" : "positionSchemaHint",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/rack-position-schema-hint"]
      }],
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "StorageBox.positionSchemaHint"
      }]
    },
    {
      "id" : "Location.extension:occupied",
      "path" : "Location.extension",
      "sliceName" : "occupied",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/position-occupancy"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "StorageBox occupancy"
      }]
    },
    {
      "id" : "Location.identifier",
      "path" : "Location.identifier",
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
      "id" : "Location.identifier:code",
      "path" : "Location.identifier",
      "sliceName" : "code",
      "short" : "Hierarchical location path, for example MAIN-FRZ01-Shelf 1-Rack 2-B3",
      "comment" : "Room code, device code, then shelf, rack and box labels, joined with hyphens. A box without a label is BOX.",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "code / label path"
      }]
    },
    {
      "id" : "Location.identifier:code.system",
      "path" : "Location.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis.org/storage-location-code"
    },
    {
      "id" : "Location.identifier:code.value",
      "path" : "Location.identifier.value",
      "min" : 1
    },
    {
      "id" : "Location.status",
      "path" : "Location.status",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "active"
      }]
    },
    {
      "id" : "Location.name",
      "path" : "Location.name",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "name / label"
      }]
    },
    {
      "id" : "Location.description",
      "path" : "Location.description",
      "mustSupport" : true
    },
    {
      "id" : "Location.mode",
      "path" : "Location.mode",
      "min" : 1,
      "patternCode" : "instance"
    },
    {
      "id" : "Location.type",
      "path" : "Location.type",
      "comment" : "Device: the device type, system http://openelis.org/fhir/CodeSystem/storage-device-type, code freezer / refrigerator / cabinet / other. Box: the free-text box type with system http://openelis.org/fhir/CodeSystem/storage-box-type.",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "StorageDevice.deviceType / StorageBox.type"
      }]
    },
    {
      "id" : "Location.physicalType",
      "path" : "Location.physicalType",
      "comment" : "Room = ro. Device = ve (Vehicle). Shelf, rack and box = co (Corridor in FHIR, displayed by OpenELIS as Container). See Known Issues. physicalType.text names the level and is used on import when the tag is missing.",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Location.partOf",
      "path" : "Location.partOf",
      "comment" : "Device -> room, shelf -> device, rack -> shelf, box -> rack.",
      "type" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-hierarchy",
          "valueBoolean" : true
        }],
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-storage-location"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "parent entity"
      }]
    }]
  }
}

```
