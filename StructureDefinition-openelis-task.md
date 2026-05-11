# OpenElis Task - OpenELIS GLOBAL2 Implementation Guide v0.1.0



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "openelis-task",
  "url" : "http://digi-uw.github.io/openelis-global-ig/StructureDefinition/openelis-task",
  "version" : "0.1.0",
  "name" : "OpenELISTask",
  "title" : "OpenElis Task",
  "status" : "draft",
  "date" : "2026-05-11T15:58:07+00:00",
  "description" : "A Task resource for tracking order state",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "eo-task-mapping",
    "uri" : "Task",
    "name" : "OpenELIS Vs FHIR",
    "comment" : "Task Mapping shows how attributes of FHIR Task Resource maps to and from the attributes of OpenElis Sample Object."
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
        "identity" : "eo-task-mapping",
        "map" : "OE Specimen",
        "comment" : "This profile maps FHIR Task to OE DataExchange."
      }]
    },
    {
      "id" : "Task.id",
      "path" : "Task.id",
      "mapping" : [{
        "identity" : "eo-task-mapping",
        "map" : "Sample.fhirUuid"
      }]
    },
    {
      "id" : "Task.identifier",
      "path" : "Task.identifier",
      "mapping" : [{
        "identity" : "eo-task-mapping",
        "map" : "Sample.accessionNumber"
      }]
    },
    {
      "id" : "Task.basedOn",
      "path" : "Task.basedOn",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/openelis-service-request"]
      }],
      "mapping" : [{
        "identity" : "eo-task-mapping",
        "map" : "Analysis"
      }]
    },
    {
      "id" : "Task.status",
      "path" : "Task.status",
      "mapping" : [{
        "identity" : "eo-task-mapping",
        "map" : "Sample.status"
      }]
    },
    {
      "id" : "Task.intent",
      "path" : "Task.intent",
      "mapping" : [{
        "identity" : "eo-task-mapping",
        "map" : "intent"
      }]
    },
    {
      "id" : "Task.priority",
      "path" : "Task.priority",
      "mapping" : [{
        "identity" : "eo-task-mapping",
        "map" : "priority"
      }]
    },
    {
      "id" : "Task.for",
      "path" : "Task.for",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/openelis-patient"]
      }],
      "mapping" : [{
        "identity" : "eo-task-mapping",
        "map" : "Patient"
      }]
    },
    {
      "id" : "Task.authoredOn",
      "path" : "Task.authoredOn",
      "min" : 1,
      "mapping" : [{
        "identity" : "eo-task-mapping",
        "map" : "Sample.enteredDate"
      }]
    },
    {
      "id" : "Task.owner",
      "path" : "Task.owner",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Practitioner",
        "http://hl7.org/fhir/StructureDefinition/Organization",
        "http://hl7.org/fhir/StructureDefinition/HealthcareService"]
      }]
    },
    {
      "id" : "Task.output.type.text",
      "path" : "Task.output.type.text",
      "patternString" : "DiagnosticReport"
    },
    {
      "id" : "Task.output.value[x]",
      "path" : "Task.output.value[x]",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/openelis-diagnostic-report"]
      }]
    }]
  }
}

```
