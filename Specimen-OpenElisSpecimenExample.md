# OpenElis Specimen Example - OpenELIS GLOBAL2 Implementation Guide v0.1.0



## Resource Content

```json
{
  "resourceType" : "Specimen",
  "id" : "OpenElisSpecimenExample",
  "meta" : {
    "profile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/open-elis-specimen"]
  },
  "identifier" : [{
    "system" : "http://openelis-global.org/sampleItem_uuid",
    "value" : "9df49e2d-57f7-4e7b-abb1-54d0a1933253"
  }],
  "accessionIdentifier" : {
    "system" : "http://openelis-global.org/sampleItem_labNo",
    "value" : "TESTA230000000001751"
  },
  "status" : "available",
  "type" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "119361006",
      "display" : "Plasma specimen"
    }]
  },
  "subject" : {
    "reference" : "Patient/329f09da-0fc9-419d-9575-ace68954426A"
  },
  "receivedTime" : "2023-03-03T07:03:00Z",
  "request" : [{
    "reference" : "ServiceRequest/OpenElisServiceRequestExample"
  }],
  "collection" : {
    "collectedDateTime" : "2023-02-03"
  }
}

```
