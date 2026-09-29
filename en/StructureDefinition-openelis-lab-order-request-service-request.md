# Lab Order Request ServiceRequest (EMR to OpenELIS) - OpenELIS Global FHIR Implementation Guide v0.2.0

## Resource Profile: Lab Order Request ServiceRequest (EMR to OpenELIS) 

 
A test ordered by an external system. OpenELIS matches the test or panel by the LOINC coding in ServiceRequest.code (TaskInterpreterImpl.createTestFromFHIR / createPanelFromFHIR). The OpenELIS test must be configured with the same LOINC code. 

**Usages:**

* Refer to this Profile: [Lab Order Request Task (EMR to OpenELIS)](StructureDefinition-openelis-lab-order-request-task.md)
* Examples for this Profile: [ServiceRequest/24224471-e4bb-58c0-acbf-b6180b053e05](ServiceRequest-24224471-e4bb-58c0-acbf-b6180b053e05.md) and [ServiceRequest/35acd1d2-f076-5434-9105-683254702ff1](ServiceRequest-35acd1d2-f076-5434-9105-683254702ff1.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-openelis-lab-order-request-service-request.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-openelis-lab-order-request-service-request.csv), [Excel](../StructureDefinition-openelis-lab-order-request-service-request.xlsx), [Schematron](../StructureDefinition-openelis-lab-order-request-service-request.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "openelis-lab-order-request-service-request",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-lab-order-request-service-request",
  "version" : "0.2.0",
  "name" : "OpenELISLabOrderRequestServiceRequest",
  "title" : "Lab Order Request ServiceRequest (EMR to OpenELIS)",
  "status" : "draft",
  "date" : "2026-09-29T02:24:20+00:00",
  "publisher" : "OpenELIS Global (Digital Initiatives Group, University of Washington)",
  "contact" : [{
    "name" : "OpenELIS Global (Digital Initiatives Group, University of Washington)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://openelis-global.org"
    }]
  },
  {
    "name" : "OpenELIS Global community",
    "telecom" : [{
      "system" : "url",
      "value" : "https://uwdigi.atlassian.net/wiki/spaces/oeg/overview"
    }]
  }],
  "description" : "A test ordered by an external system. OpenELIS matches the test or panel by the LOINC coding in ServiceRequest.code (TaskInterpreterImpl.createTestFromFHIR / createPanelFromFHIR). The OpenELIS test must be configured with the same LOINC code.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "001",
      "display" : "World"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
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
    "identity" : "quick",
    "uri" : "http://siframework.org/cqf",
    "name" : "Quality Improvement and Clinical Knowledge (QUICK)"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "ServiceRequest",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/ServiceRequest",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "ServiceRequest",
      "path" : "ServiceRequest"
    },
    {
      "id" : "ServiceRequest.identifier",
      "path" : "ServiceRequest.identifier",
      "comment" : "The first identifier's value is stored as the external order number (the last 60 characters are kept). It is required: an order without it is refused, and an order number OpenELIS has already received is refused as a duplicate.",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.status",
      "path" : "ServiceRequest.status",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.intent",
      "path" : "ServiceRequest.intent",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.priority",
      "path" : "ServiceRequest.priority",
      "comment" : "Defaults to routine when absent.",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.code",
      "path" : "ServiceRequest.code",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.code.coding",
      "path" : "ServiceRequest.code.coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "system"
        }],
        "rules" : "open"
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.code.coding:loinc",
      "path" : "ServiceRequest.code.coding",
      "sliceName" : "loinc",
      "short" : "LOINC code of the ordered test or panel. OpenELIS uses the first match.",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.code.coding:loinc.system",
      "path" : "ServiceRequest.code.coding.system",
      "min" : 1,
      "patternUri" : "http://loinc.org"
    },
    {
      "id" : "ServiceRequest.code.coding:loinc.code",
      "path" : "ServiceRequest.code.coding.code",
      "min" : 1
    },
    {
      "id" : "ServiceRequest.subject",
      "path" : "ServiceRequest.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient",
        "http://hl7.org/fhir/StructureDefinition/Location",
        "http://hl7.org/fhir/StructureDefinition/Group",
        "http://hl7.org/fhir/StructureDefinition/Device"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.encounter",
      "path" : "ServiceRequest.encounter",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.requester",
      "path" : "ServiceRequest.requester",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.specimen",
      "path" : "ServiceRequest.specimen",
      "comment" : "Optional. If absent and the LOINC code matches several OpenELIS tests, or one test with several sample types, OpenELIS holds the order as Awaiting Specimen until the accessioner chooses the sample type.",
      "mustSupport" : true
    }]
  }
}

```
