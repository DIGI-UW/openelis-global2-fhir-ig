# OpenElis DiagnosticReport Example - OpenELIS GLOBAL2 Implementation Guide v0.1.0



## Resource Content

```json
{
  "resourceType" : "DiagnosticReport",
  "id" : "OpenElisDiagnosticReportExample",
  "meta" : {
    "profile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/openelis-diagnostic-report"]
  },
  "identifier" : [{
    "system" : "http://openelis-global.org/analysisResult_uuid",
    "value" : "f3c9cf5e-7d41-4a7d-a77b-8c0f4323a0bd"
  }],
  "basedOn" : [{
    "reference" : "ServiceRequest/OpenElisServiceRequestExample"
  }],
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "58410-2",
      "display" : "CBC panel - Blood by Automated count"
    }]
  },
  "subject" : {
    "reference" : "Patient/329f09da-0fc9-419d-9575-ace68954426A"
  },
  "specimen" : [{
    "reference" : "Specimen/OpenElisSpecimenExample"
  }],
  "result" : [{
    "reference" : "Observation/OpenElisObservationExample"
  }]
}

```
