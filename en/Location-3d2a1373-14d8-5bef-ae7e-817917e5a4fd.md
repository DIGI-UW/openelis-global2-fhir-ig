# Storage level: device (freezer) - OpenELIS Global FHIR Implementation Guide v0.2.0

## Example Location: Storage level: device (freezer)

Profiles: [OpenELIS Storage Location](StructureDefinition-openelis-storage-location.md), `http://ihe.net/fhir/StructureDefinition/IHE.mCSD.Location`

Tag: 

**Storage temperature**: -80

**Storage capacity**: 5

**Storage device IP address**: 10.20.0.41

**Storage device port**: 502

**Storage device communication protocol**: Modbus TCP

**identifier**: [OEStorageLocationCode](NamingSystem-oe-ns-storage-location-code.md)/MAIN-FRZ01

**status**: Active

**name**: Freezer 01 (-80)

**mode**: Instance

**type**: Freezer

**physicalType**: Storage Equipment

**partOf**: [Location Main laboratory storage](Location-1fa151e6-afa2-531c-b70c-fd63b88c10f0.md)



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
