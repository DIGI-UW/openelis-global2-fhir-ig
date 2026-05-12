# OpenELIS Device - OpenELIS GLOBAL2 Implementation Guide v0.1.0



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "open-elis-device",
  "url" : "http://digi-uw.github.io/openelis-global-ig/StructureDefinition/open-elis-device",
  "version" : "0.1.0",
  "name" : "OpenELISDevice",
  "title" : "OpenELIS Device",
  "status" : "draft",
  "date" : "2026-05-12T16:33:42+00:00",
  "description" : "FHIR Device representing OpenELIS Analyzer",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "oe-device-mapping",
    "uri" : "Analyzer",
    "name" : "Device to Analyzer Mapping"
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
      "path" : "Device"
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
      "id" : "Device.extension:communicationMode",
      "path" : "Device.extension",
      "sliceName" : "communicationMode",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/analyzer-communication-mode"]
      }],
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.communicationMode"
      }]
    },
    {
      "id" : "Device.extension:protocolVersion",
      "path" : "Device.extension",
      "sliceName" : "protocolVersion",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/analyzer-protocol-version"]
      }],
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.protocolVersion"
      }]
    },
    {
      "id" : "Device.extension:transport",
      "path" : "Device.extension",
      "sliceName" : "transport",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/analyzer-transport-details"]
      }]
    },
    {
      "id" : "Device.extension:transport.extension:ipAddress",
      "path" : "Device.extension.extension",
      "sliceName" : "ipAddress",
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.ipAddress"
      }]
    },
    {
      "id" : "Device.extension:transport.extension:port",
      "path" : "Device.extension.extension",
      "sliceName" : "port",
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.port"
      }]
    },
    {
      "id" : "Device.extension:transport.extension:importDirectory",
      "path" : "Device.extension.extension",
      "sliceName" : "importDirectory",
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.importDirectory"
      }]
    },
    {
      "id" : "Device.extension:transport.extension:filePattern",
      "path" : "Device.extension.extension",
      "sliceName" : "filePattern",
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.filePattern"
      }]
    },
    {
      "id" : "Device.extension:transport.extension:fileFormat",
      "path" : "Device.extension.extension",
      "sliceName" : "fileFormat",
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.fileFormat"
      }]
    },
    {
      "id" : "Device.extension:transport.extension:delimiter",
      "path" : "Device.extension.extension",
      "sliceName" : "delimiter",
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.delimiter"
      }]
    },
    {
      "id" : "Device.extension:transport.extension:hasHeader",
      "path" : "Device.extension.extension",
      "sliceName" : "hasHeader",
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.hasHeader"
      }]
    },
    {
      "id" : "Device.extension:transport.extension:skipRows",
      "path" : "Device.extension.extension",
      "sliceName" : "skipRows",
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.skipRows"
      }]
    },
    {
      "id" : "Device.extension:location",
      "path" : "Device.extension",
      "sliceName" : "location",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/analyzer-location"]
      }],
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.location"
      }]
    },
    {
      "id" : "Device.extension:identifierPattern",
      "path" : "Device.extension",
      "sliceName" : "identifierPattern",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/analyzer-identifier-pattern"]
      }],
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.identifierPattern"
      }]
    },
    {
      "id" : "Device.extension:lastActivated",
      "path" : "Device.extension",
      "sliceName" : "lastActivated",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/analyzer-last-activated"]
      }],
      "mapping" : [{
        "identity" : "oe-device-mapping",
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
        "profile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/analyzer-test-units"]
      }]
    },
    {
      "id" : "Device.extension:testUnits.extension:testUnitId",
      "path" : "Device.extension.extension",
      "sliceName" : "testUnitId",
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.testUnitIds"
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
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "Device.identifier:uuid",
      "path" : "Device.identifier",
      "sliceName" : "uuid",
      "min" : 1,
      "max" : "1",
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.fhirUuid"
      }]
    },
    {
      "id" : "Device.identifier:uuid.system",
      "path" : "Device.identifier.system",
      "min" : 1
    },
    {
      "id" : "Device.identifier:uuid.value",
      "path" : "Device.identifier.value",
      "min" : 1
    },
    {
      "id" : "Device.identifier:machineId",
      "path" : "Device.identifier",
      "sliceName" : "machineId",
      "min" : 0,
      "max" : "1",
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.machineId"
      }]
    },
    {
      "id" : "Device.identifier:sourceId",
      "path" : "Device.identifier",
      "sliceName" : "sourceId",
      "min" : 0,
      "max" : "1",
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.discoveredSourceId"
      }]
    },
    {
      "id" : "Device.status",
      "path" : "Device.status",
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.AnalyzerStatus"
      }]
    },
    {
      "id" : "Device.serialNumber",
      "path" : "Device.serialNumber",
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.machineId"
      }]
    },
    {
      "id" : "Device.deviceName",
      "path" : "Device.deviceName",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Device.deviceName.name",
      "path" : "Device.deviceName.name",
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.name"
      }]
    },
    {
      "id" : "Device.deviceName.type",
      "path" : "Device.deviceName.type",
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.nameType"
      }]
    },
    {
      "id" : "Device.type",
      "path" : "Device.type",
      "min" : 1,
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.AnalyzerType.name"
      }]
    },
    {
      "id" : "Device.owner",
      "path" : "Device.owner",
      "min" : 1,
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.Organization"
      }]
    },
    {
      "id" : "Device.note",
      "path" : "Device.note",
      "mapping" : [{
        "identity" : "oe-device-mapping",
        "map" : "Analyzer.description"
      }]
    }]
  }
}

```
