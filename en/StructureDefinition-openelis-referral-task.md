# OpenELIS Referral Task - OpenELIS Global FHIR Implementation Guide v0.2.0

## Resource Profile: OpenELIS Referral Task 

 
The Task a referring OpenELIS writes when it refers a test to another laboratory (FhirReferralServiceImpl.createReferralTask). The reference lab polls for it with the same mechanism as EMR orders. When results are entered at the referring lab from a paper report, it publishes the Task as completed with an output referencing the DiagnosticReport. A referral marked lost sets the Task to cancelled. A referral rejected at the referring lab sets it to rejected. 

**Usages:**

* Examples for this Profile: [Task/1adff0e3-109a-55fe-b3b7-74736ef4ff6d](Task-1adff0e3-109a-55fe-b3b7-74736ef4ff6d.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-openelis-referral-task.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-openelis-referral-task.csv), [Excel](../StructureDefinition-openelis-referral-task.xlsx), [Schematron](../StructureDefinition-openelis-referral-task.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "openelis-referral-task",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-referral-task",
  "version" : "0.2.0",
  "name" : "OpenELISReferralTask",
  "title" : "OpenELIS Referral Task",
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
  "description" : "The Task a referring OpenELIS writes when it refers a test to another laboratory (FhirReferralServiceImpl.createReferralTask). The reference lab polls for it with the same mechanism as EMR orders. When results are entered at the referring lab from a paper report, it publishes the Task as completed with an output referencing the DiagnosticReport. A referral marked lost sets the Task to cancelled. A referral rejected at the referring lab sets it to rejected.",
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
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Task",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Task",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Task",
      "path" : "Task"
    },
    {
      "id" : "Task.basedOn",
      "path" : "Task.basedOn",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-service-request"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Task.status",
      "path" : "Task.status",
      "comment" : "requested when sent. accepted or rejected by the reference lab. completed, cancelled (lost) or rejected when published by the referring lab.",
      "mustSupport" : true
    },
    {
      "id" : "Task.intent",
      "path" : "Task.intent",
      "comment" : "OpenELIS does not set intent on referral Tasks today, which base FHIR requires (see Known Issues). Receivers should expect order.",
      "mustSupport" : true
    },
    {
      "id" : "Task.description",
      "path" : "Task.description",
      "comment" : "referring accession number {labNo} from {requester} to {owner}",
      "mustSupport" : true
    },
    {
      "id" : "Task.focus",
      "path" : "Task.focus",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-service-request"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Task.for",
      "path" : "Task.for",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Task.authoredOn",
      "path" : "Task.authoredOn",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Task.requester",
      "path" : "Task.requester",
      "comment" : "A copy of the ordering provider written to the FHIR store with a new random id for each referral (see Known Issues).",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-practitioner"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Task.owner",
      "path" : "Task.owner",
      "short" : "The reference laboratory",
      "comment" : "Can be empty on the completion, lost and rejected paths when the reference lab's Organization is not found in the FHIR store (see Known Issues).",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-organization"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Task.reasonCode",
      "path" : "Task.reasonCode",
      "comment" : "Currently only the system is sent (see Known Issues).",
      "mustSupport" : true
    },
    {
      "id" : "Task.reasonCode.coding.system",
      "path" : "Task.reasonCode.coding.system",
      "patternUri" : "http://openelis-global.org/refer_reason"
    },
    {
      "id" : "Task.restriction.recipient",
      "path" : "Task.restriction.recipient",
      "comment" : "The first value of org.openelisglobal.remote.source.identifier. With the shipped value Practitioner/* this is the first Practitioner found on the remote servers.",
      "mustSupport" : true
    },
    {
      "id" : "Task.output",
      "path" : "Task.output",
      "mustSupport" : true
    },
    {
      "id" : "Task.output.type.coding.system",
      "path" : "Task.output.type.coding.system",
      "patternUri" : "http://openelis-global.org/task_output"
    },
    {
      "id" : "Task.output.type.coding.code",
      "path" : "Task.output.type.coding.code",
      "patternCode" : "DiagnosticReport"
    },
    {
      "id" : "Task.output.value[x]",
      "path" : "Task.output.value[x]",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-diagnostic-report"]
      }]
    }]
  }
}

```
