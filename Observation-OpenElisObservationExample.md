# OpenElis Observation Example - OpenELIS GLOBAL2 Implementation Guide v0.1.0



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "OpenElisObservationExample",
  "meta" : {
    "profile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/open-elis-observation"]
  },
  "identifier" : [{
    "system" : "http://openelis-global.org/result_uuid",
    "value" : "158999b0-b295-4dfd-a5b0-81ed58733b5f"
  }],
  "basedOn" : [{
    "reference" : "ServiceRequest/OpenElisServiceRequestExample"
  }],
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "15074-8",
      "display" : "Glucose Bld-sCnc"
    }]
  },
  "subject" : {
    "reference" : "Patient/329f09da-0fc9-419d-9575-ace68954426A"
  },
  "effectiveDateTime" : "2025-09-03T11:30:00Z",
  "performer" : [{
    "reference" : "Practitioner/f185bb76-c298-4671-9be3-ccc94c0a9868"
  }],
  "valueQuantity" : {
    "value" : 55,
    "unit" : "UI/L"
  },
  "specimen" : {
    "reference" : "Specimen/OpenElisSpecimenExample"
  }
}

```
