# OpenELIS Analyzer Device - OpenELIS Global FHIR Implementation Guide v0.2.0

## Resource Profile: OpenELIS Analyzer Device 

 
An analyzer as OpenELIS produces it (DeviceTransformServiceImpl), serves it from /fhir/Device, and includes it in result bundles when Observation.device references it. OpenELIS currently declares meta.profile = http://openelis.org/fhir/StructureDefinition/openelis-analyzer-device, which is not this profile's URL (see Known Issues). 

**Usages:**

* Refer to this Profile: [OpenELIS Observation](StructureDefinition-openelis-observation.md)
* Examples for this Profile: [Device/ff2b5d6a-ff46-5f20-b254-4eaa0615d555](Device-ff2b5d6a-ff46-5f20-b254-4eaa0615d555.md)
* CapabilityStatements using this Profile: [OpenELIS Global FHIR REST server](CapabilityStatement-OpenELISFhirServer.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-openelis-analyzer-device.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-openelis-analyzer-device.csv), [Excel](../StructureDefinition-openelis-analyzer-device.xlsx), [Schematron](../StructureDefinition-openelis-analyzer-device.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "openelis-analyzer-device",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-analyzer-device",
  "version" : "0.2.0",
  "name" : "OpenELISAnalyzerDevice",
  "title" : "OpenELIS Analyzer Device",
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
  "description" : "An analyzer as OpenELIS produces it (DeviceTransformServiceImpl), serves it from /fhir/Device, and includes it in result bundles when Observation.device references it. OpenELIS currently declares meta.profile = http://openelis.org/fhir/StructureDefinition/openelis-analyzer-device, which is not this profile's URL (see Known Issues).",
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
    "identity" : "udi",
    "uri" : "http://fda.gov/UDI",
    "name" : "UDI Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Device",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Device",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Device",
      "path" : "Device",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analyzer (DeviceTransformServiceImpl)"
      }]
    },
    {
      "id" : "Device.id",
      "path" : "Device.id",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analyzer.fhirUuid (Analyzer.id when no UUID)"
      }]
    },
    {
      "id" : "Device.extension",
      "path" : "Device.extension",
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
      "id" : "Device.extension:lastActivated",
      "path" : "Device.extension",
      "sliceName" : "lastActivated",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/analyzer-last-activated"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analyzer.lastActivatedDate"
      }]
    },
    {
      "id" : "Device.extension:testUnits",
      "path" : "Device.extension",
      "sliceName" : "testUnits",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/analyzer-test-units"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analyzer test units"
      }]
    },
    {
      "id" : "Device.extension:operationalStatus",
      "path" : "Device.extension",
      "sliceName" : "operationalStatus",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/analyzer-operational-status"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analyzer.status"
      }]
    },
    {
      "id" : "Device.identifier",
      "path" : "Device.identifier",
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
      "id" : "Device.identifier:analyzerUuid",
      "path" : "Device.identifier",
      "sliceName" : "analyzerUuid",
      "short" : "OpenELIS analyzer UUID (equals Device.id)",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analyzer.fhirUuid"
      }]
    },
    {
      "id" : "Device.identifier:analyzerUuid.system",
      "path" : "Device.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/analyzer_uuid"
    },
    {
      "id" : "Device.identifier:analyzerUuid.value",
      "path" : "Device.identifier.value",
      "min" : 1
    },
    {
      "id" : "Device.identifier:bridgeConnection",
      "path" : "Device.identifier",
      "sliceName" : "bridgeConnection",
      "short" : "Connection id in the OpenELIS analyzer bridge",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analyzer.bridgeConnectionId"
      }]
    },
    {
      "id" : "Device.identifier:bridgeConnection.system",
      "path" : "Device.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/analyzer_bridge_connection"
    },
    {
      "id" : "Device.identifier:bridgeConnection.value",
      "path" : "Device.identifier.value",
      "min" : 1
    },
    {
      "id" : "Device.status",
      "path" : "Device.status",
      "comment" : "Setup / validation / active = active. Error pending = entered-in-error. Inactive = inactive. Offline or other = unknown. The unmapped OpenELIS status is in the operationalStatus extension.",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analyzer.status"
      }]
    },
    {
      "id" : "Device.deviceName",
      "path" : "Device.deviceName",
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analyzer.name"
      }]
    },
    {
      "id" : "Device.deviceName.type",
      "path" : "Device.deviceName.type",
      "patternCode" : "user-friendly-name"
    },
    {
      "id" : "Device.type",
      "path" : "Device.type",
      "comment" : "text only: the analyzer bridge profile id pinned to this analyzer.",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analyzer pinned bridge profile id"
      }]
    },
    {
      "id" : "Device.owner",
      "path" : "Device.owner",
      "comment" : "Sent as a logical reference: owner.identifier with system {oe}/facility_id and the site Organization as assigner. owner.reference is not set.",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-organization"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Site facility"
      }]
    },
    {
      "id" : "Device.owner.identifier",
      "path" : "Device.owner.identifier",
      "mustSupport" : true
    }]
  }
}

```
