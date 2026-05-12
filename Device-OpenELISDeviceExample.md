# OpenELISDeviceExample - OpenELIS GLOBAL2 Implementation Guide v0.1.0



## Resource Content

```json
{
  "resourceType" : "Device",
  "id" : "OpenELISDeviceExample",
  "meta" : {
    "profile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/open-elis-device"]
  },
  "identifier" : [{
    "system" : "http://openelis-global.org/analyzer_uuid",
    "value" : "6f5f7a6b-89b2-4a7d-a2c2-77ef66a9f1b2"
  },
  {
    "system" : "http://openelis-global.org/analyzer_machineId",
    "value" : "XN-1000-4589"
  },
  {
    "system" : "http://openelis-global.org/analyzer_sourceId",
    "value" : "DISCOVERY-192.168.1.10"
  }],
  "status" : "active",
  "serialNumber" : "XN-1000-4589",
  "deviceName" : [{
    "name" : "Sysmex XN-1000",
    "type" : "user-friendly-name"
  }],
  "type" : {
    "text" : "Hematology Analyzer"
  },
  "owner" : {
    "identifier" : {
      "system" : "http://openelis-global.org/facility",
      "value" : "TEST LIMS"
    }
  },
  "note" : [{
    "text" : "Primary hematology analyzer"
  }]
}

```
