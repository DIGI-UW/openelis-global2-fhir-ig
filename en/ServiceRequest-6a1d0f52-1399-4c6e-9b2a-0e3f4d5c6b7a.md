# OpenELIS ServiceRequest: environmental sample - OpenELIS Global FHIR Implementation Guide v0.2.2

## Example ServiceRequest: OpenELIS ServiceRequest: environmental sample

pH on a water sample (lab number EDH26000000418), requested 2026-10-12. The sampling site, Well 7, stands for no organization, so the subject is a contained Group (substance). Referring site: Riverside Health Centre.



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "6a1d0f52-1399-4c6e-9b2a-0e3f4d5c6b7a",
  "meta" : {
    "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-service-request"]
  },
  "contained" : [{
    "resourceType" : "Group",
    "id" : "subject",
    "type" : "substance",
    "actual" : false,
    "name" : "Well 7"
  }],
  "identifier" : [{
    "use" : "usual",
    "system" : "http://openelis-global.org/analysis_uuid",
    "value" : "6a1d0f52-1399-4c6e-9b2a-0e3f4d5c6b7a"
  }],
  "requisition" : {
    "use" : "usual",
    "system" : "http://openelis-global.org/samp_labNo",
    "value" : "EDH26000000418"
  },
  "status" : "active",
  "intent" : "original-order",
  "category" : [{
    "coding" : [{
      "system" : "http://openelis-global.org/samp_domain",
      "code" : "E",
      "display" : "E"
    }]
  }],
  "priority" : "routine",
  "code" : {
    "text" : "pH"
  },
  "subject" : {
    "reference" : "#subject"
  },
  "authoredOn" : "2026-10-12",
  "locationReference" : [{
    "reference" : "Location/d3619aef-5abf-5b4f-a76c-06f378deca13"
  }]
}

```
