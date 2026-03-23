# OpenElis Service Request Example - OpenELIS GLOBAL2 Implementation Guide v0.1.0



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "OpenElisServiceRequestExample",
  "meta" : {
    "profile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/openelis-service-request"]
  },
  "identifier" : [{
    "system" : "http://openelis-global.org/analysis_uuid",
    "value" : "0a65ab46-179e-4506-9fa3-09d342268576"
  },
  {
    "system" : "http://openelis-global.org/samp_labNo",
    "value" : "TESTA230000000001749"
  }],
  "status" : "active",
  "intent" : "original-order",
  "priority" : "routine",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "24627-2"
    }]
  },
  "subject" : {
    "reference" : "Patient/329f09da-0fc9-419d-9575-ace68954426A"
  },
  "authoredOn" : "2023-02-03",
  "requester" : {
    "reference" : "Practitioner/f185bb76-c298-4671-9be3-ccc94c0a9868"
  },
  "locationReference" : [{
    "reference" : "Location/LocationExample"
  }],
  "specimen" : [{
    "reference" : "Specimen/OpenElisSpecimenExample"
  }]
}

```
