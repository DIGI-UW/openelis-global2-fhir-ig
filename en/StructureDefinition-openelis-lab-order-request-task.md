# Lab Order Request Task (EMR to OpenELIS) - OpenELIS Global FHIR Implementation Guide v0.2.0

## Resource Profile: Lab Order Request Task (EMR to OpenELIS) 

 
The Task an ordering system (for example OpenMRS with the Lab on FHIR module) writes to the shared FHIR server so OpenELIS picks the order up. OpenELIS polls each org.openelisglobal.remote.source.uri for Task?status=requested&owner={one of org.openelisglobal.remote.source.identifier} (FhirApiWorkFlowServiceImpl.beginTaskImportOrderPath). 

**Usages:**

* Examples for this Profile: [Task/07ed1bd1-1bdf-58ae-a661-ee0703fcab70](Task-07ed1bd1-1bdf-58ae-a661-ee0703fcab70.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-openelis-lab-order-request-task.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-openelis-lab-order-request-task.csv), [Excel](../StructureDefinition-openelis-lab-order-request-task.xlsx), [Schematron](../StructureDefinition-openelis-lab-order-request-task.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "openelis-lab-order-request-task",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-lab-order-request-task",
  "version" : "0.2.0",
  "name" : "OpenELISLabOrderRequestTask",
  "title" : "Lab Order Request Task (EMR to OpenELIS)",
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
  "description" : "The Task an ordering system (for example OpenMRS with the Lab on FHIR module) writes to the shared FHIR server so OpenELIS picks the order up. OpenELIS polls each org.openelisglobal.remote.source.uri for Task?status=requested&owner={one of org.openelisglobal.remote.source.identifier} (FhirApiWorkFlowServiceImpl.beginTaskImportOrderPath).",
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
      "short" : "The ordered tests",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-lab-order-request-service-request"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Task.status",
      "path" : "Task.status",
      "comment" : "Must be requested for OpenELIS to import the order. When org.openelisglobal.remote.source.updateStatus=true, OpenELIS writes accepted or rejected back to this Task once the order has been processed.",
      "mustSupport" : true
    },
    {
      "id" : "Task.intent",
      "path" : "Task.intent",
      "comment" : "order",
      "mustSupport" : true
    },
    {
      "id" : "Task.for",
      "path" : "Task.for",
      "comment" : "The patient. When absent OpenELIS falls back to the ServiceRequest subject. Omitted for environmental and vector samples.",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Task.encounter",
      "path" : "Task.encounter",
      "mustSupport" : true
    },
    {
      "id" : "Task.authoredOn",
      "path" : "Task.authoredOn",
      "mustSupport" : true
    },
    {
      "id" : "Task.owner",
      "path" : "Task.owner",
      "short" : "The OpenELIS instance, as named in org.openelisglobal.remote.source.identifier",
      "comment" : "Usually Practitioner/{uuid of the OpenELIS service user in the EMR}. With the property value Practitioner/* OpenELIS accepts every Practitioner on the remote server.",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Task.location",
      "path" : "Task.location",
      "comment" : "When present OpenELIS reads the referenced Location, matches it to an OpenELIS Organization with the same FHIR id (creating one if none exists) and uses it as the referring site.",
      "mustSupport" : true
    }]
  }
}

```
