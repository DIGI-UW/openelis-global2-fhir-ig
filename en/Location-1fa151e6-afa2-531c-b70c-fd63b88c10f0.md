# Storage level: room - OpenELIS Global FHIR Implementation Guide v0.2.2

## Example Location: Storage level: room

Profiles: [OpenELIS Storage Location](StructureDefinition-openelis-storage-location.md), `http://ihe.net/fhir/StructureDefinition/IHE.mCSD.Location`

Tag: 

Main laboratory storage (http://openelis.org/storage-location-code#OEStorageLocationCode#MAIN)

-------

| | | | |
| :--- | :--- | :--- | :--- |
| Status: | Active | Mode: | Instance |
| Form: | Storage Room | | |
| Description: | Ground floor, room 014 | | |



## Resource Content

```json
{
  "resourceType" : "Location",
  "id" : "1fa151e6-afa2-531c-b70c-fd63b88c10f0",
  "meta" : {
    "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-storage-location",
    "http://ihe.net/fhir/StructureDefinition/IHE.mCSD.Location"],
    "tag" : [{
      "system" : "http://openelis.org/fhir/tag/storage-hierarchy",
      "code" : "room",
      "display" : "Room"
    }]
  },
  "identifier" : [{
    "system" : "http://openelis.org/storage-location-code",
    "value" : "MAIN"
  }],
  "status" : "active",
  "name" : "Main laboratory storage",
  "description" : "Ground floor, room 014",
  "mode" : "instance",
  "physicalType" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
      "code" : "ro",
      "display" : "Room"
    }],
    "text" : "Storage Room"
  }
}

```
