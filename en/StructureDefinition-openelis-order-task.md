# OpenELIS Order Task - OpenELIS Global FHIR Implementation Guide v0.2.0

## Resource Profile: OpenELIS Order Task 

 
The Task OpenELIS writes for each order (Sample) to track its state (TaskTransformServiceImpl). When the order came from an EMR Task, partOf points at that Task. When the order is finished, one output per test references its DiagnosticReport. 

**Usages:**

* Examples for this Profile: [Task/ed860000-5fab-5072-a257-83bbe38c27f4](Task-ed860000-5fab-5072-a257-83bbe38c27f4.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-openelis-order-task.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-openelis-order-task.csv), [Excel](../StructureDefinition-openelis-order-task.xlsx), [Schematron](../StructureDefinition-openelis-order-task.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "openelis-order-task",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-order-task",
  "version" : "0.2.0",
  "name" : "OpenELISOrderTask",
  "title" : "OpenELIS Order Task",
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
  "description" : "The Task OpenELIS writes for each order (Sample) to track its state (TaskTransformServiceImpl). When the order came from an EMR Task, partOf points at that Task. When the order is finished, one output per test references its DiagnosticReport.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "001",
      "display" : "World"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "oe-data-model",
    "uri" : "https://github.com/DIGI-UW/OpenELIS-Global-2",
    "name" : "OpenELIS Global data model"
  },
  {
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
      "path" : "Task",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Sample (TaskTransformServiceImpl)"
      }]
    },
    {
      "id" : "Task.id",
      "path" : "Task.id",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Sample.fhirUuid"
      }]
    },
    {
      "id" : "Task.identifier",
      "path" : "Task.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "system"
        }],
        "description" : "Sliced by identifier system",
        "rules" : "open"
      },
      "min" : 2,
      "mustSupport" : true
    },
    {
      "id" : "Task.identifier:orderUuid",
      "path" : "Task.identifier",
      "sliceName" : "orderUuid",
      "short" : "OpenELIS order (Sample) UUID (equals Task.id)",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Sample.fhirUuid"
      }]
    },
    {
      "id" : "Task.identifier:orderUuid.system",
      "path" : "Task.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/order_uuid"
    },
    {
      "id" : "Task.identifier:orderUuid.value",
      "path" : "Task.identifier.value",
      "min" : 1
    },
    {
      "id" : "Task.identifier:accessionNumber",
      "path" : "Task.identifier",
      "sliceName" : "accessionNumber",
      "short" : "Order lab (accession) number",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Sample.accessionNumber"
      }]
    },
    {
      "id" : "Task.identifier:accessionNumber.system",
      "path" : "Task.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/order_accessionNumber"
    },
    {
      "id" : "Task.identifier:accessionNumber.value",
      "path" : "Task.identifier.value",
      "min" : 1
    },
    {
      "id" : "Task.basedOn",
      "path" : "Task.basedOn",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-service-request"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analysis (all analyses on the sample)"
      }]
    },
    {
      "id" : "Task.partOf",
      "path" : "Task.partOf",
      "short" : "The EMR Task the order was received from",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Referring Task in the FHIR store (Sample.referringId)"
      }]
    },
    {
      "id" : "Task.status",
      "path" : "Task.status",
      "comment" : "Entered = ready. Started or technical acceptance = in-progress. Technical rejection = failed. Non-conforming or biologist rejected = rejected. Finished = completed.",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Sample.statusId"
      }]
    },
    {
      "id" : "Task.intent",
      "path" : "Task.intent",
      "comment" : "original-order when entered in OpenELIS. order when received from another system.",
      "mustSupport" : true
    },
    {
      "id" : "Task.priority",
      "path" : "Task.priority",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Sample.priority"
      }]
    },
    {
      "id" : "Task.for",
      "path" : "Task.for",
      "comment" : "Absent for environmental and vector samples.",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-patient"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "SampleHuman.patient"
      }]
    },
    {
      "id" : "Task.authoredOn",
      "path" : "Task.authoredOn",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Sample.enteredDate"
      }]
    },
    {
      "id" : "Task.output",
      "path" : "Task.output",
      "short" : "One per test, once the order is finished",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analysis.fhirUuid (DiagnosticReport per analysis)"
      }]
    },
    {
      "id" : "Task.output.type",
      "path" : "Task.output.type",
      "comment" : "Currently a bare code 'reference' with no system."
    },
    {
      "id" : "Task.output.type.coding.code",
      "path" : "Task.output.type.coding.code",
      "patternCode" : "reference"
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
