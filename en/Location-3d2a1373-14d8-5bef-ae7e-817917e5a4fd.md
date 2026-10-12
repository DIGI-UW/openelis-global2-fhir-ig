# Storage level: device (freezer) - OpenELIS Global FHIR Implementation Guide v0.2.1

## Example Location: Storage level: device (freezer)

Profiles: [OpenELIS Storage Location](StructureDefinition-openelis-storage-location.md), `http://ihe.net/fhir/StructureDefinition/IHE.mCSD.Location`

Tag: 

Freezer 01 (-80) (Freezer) (http://openelis.org/storage-location-code#OEStorageLocationCode#MAIN-FRZ01)

-------

| | | | |
| :--- | :--- | :--- | :--- |
| Status: | Active | Mode: | Instance |
| Form: | Storage Equipment | | |
| Type: | Freezer | | |
| Part Of: | [Main laboratory storage (http://openelis.org/storage-location-code#OEStorageLocationCode#MAIN)](Location-1fa151e6-afa2-531c-b70c-fd63b88c10f0.md) | | |
| [Storage temperature](StructureDefinition-storage-temperature.md) | -80 | | |
| [Storage device communication protocol](StructureDefinition-device-communication-protocol.md) | Modbus TCP | | |
| [Storage device port](StructureDefinition-device-port.md) | 502 | | |
| [Storage device IP address](StructureDefinition-device-ip-address.md) | 10.20.0.41 | | |
| [Storage capacity](StructureDefinition-storage-capacity.md) | 5 | | |



## Resource Content

```json
{
  "resourceType" : "Location",
  "id" : "3d2a1373-14d8-5bef-ae7e-817917e5a4fd",
  "meta" : {
    "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-storage-location",
    "http://ihe.net/fhir/StructureDefinition/IHE.mCSD.Location"],
    "tag" : [{
      "system" : "http://openelis.org/fhir/tag/storage-hierarchy",
      "code" : "device",
      "display" : "Device"
    }]
  },
  "extension" : [{
    "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/storage-temperature",
    "valueDecimal" : -80
  },
  {
    "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/storage-capacity",
    "valueInteger" : 5
  },
  {
    "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/device-ip-address",
    "valueString" : "10.20.0.41"
  },
  {
    "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/device-port",
    "valueInteger" : 502
  },
  {
    "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/device-communication-protocol",
    "valueString" : "Modbus TCP"
  }],
  "identifier" : [{
    "system" : "http://openelis.org/storage-location-code",
    "value" : "MAIN-FRZ01"
  }],
  "status" : "active",
  "name" : "Freezer 01 (-80)",
  "mode" : "instance",
  "type" : [{
    "coding" : [{
      "system" : "http://openelis.org/fhir/CodeSystem/storage-device-type",
      "code" : "freezer",
      "display" : "Freezer"
    }]
  }],
  "physicalType" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
      "code" : "ca",
      "display" : "Cabinet"
    }],
    "text" : "Storage Equipment"
  },
  "partOf" : {
    "reference" : "Location/1fa151e6-afa2-531c-b70c-fd63b88c10f0"
  }
}

```
