# OpenELIS DiagnosticReport - OpenELIS Global FHIR Implementation Guide v0.2.0

## Resource Profile: OpenELIS DiagnosticReport 

 
The report for one ordered test, grouping its results (DiagnosticReportTransformServiceImpl), served from /fhir/DiagnosticReport (read, search and delete only). The id is the Analysis UUID, the same as the matching ServiceRequest id. 

**Usages:**

* Refer to this Profile: [OpenELIS Order Task](StructureDefinition-openelis-order-task.md) and [OpenELIS Referral Task](StructureDefinition-openelis-referral-task.md)
* Examples for this Profile: [DiagnosticReport/3b2c3407-5430-5878-9c61-c4c9b9c013c4](DiagnosticReport-3b2c3407-5430-5878-9c61-c4c9b9c013c4.md) and [DiagnosticReport/48549f60-c400-5510-97da-2e2497627e81](DiagnosticReport-48549f60-c400-5510-97da-2e2497627e81.md)
* CapabilityStatements using this Profile: [OpenELIS Global FHIR REST server](CapabilityStatement-OpenELISFhirServer.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-openelis-diagnostic-report.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-openelis-diagnostic-report.csv), [Excel](../StructureDefinition-openelis-diagnostic-report.xlsx), [Schematron](../StructureDefinition-openelis-diagnostic-report.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "openelis-diagnostic-report",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-diagnostic-report",
  "version" : "0.2.0",
  "name" : "OpenELISDiagnosticReport",
  "title" : "OpenELIS DiagnosticReport",
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
  "description" : "The report for one ordered test, grouping its results (DiagnosticReportTransformServiceImpl), served from /fhir/DiagnosticReport (read, search and delete only). The id is the Analysis UUID, the same as the matching ServiceRequest id.",
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
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "DiagnosticReport",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/DiagnosticReport",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "DiagnosticReport",
      "path" : "DiagnosticReport",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analysis (DiagnosticReportTransformServiceImpl)"
      }]
    },
    {
      "id" : "DiagnosticReport.id",
      "path" : "DiagnosticReport.id",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analysis.fhirUuid"
      }]
    },
    {
      "id" : "DiagnosticReport.identifier",
      "path" : "DiagnosticReport.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "system"
        }],
        "description" : "Sliced by identifier system",
        "rules" : "open"
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.identifier:analysisResultUuid",
      "path" : "DiagnosticReport.identifier",
      "sliceName" : "analysisResultUuid",
      "short" : "Analysis UUID (equals DiagnosticReport.id and ServiceRequest.id)",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analysis.fhirUuid"
      }]
    },
    {
      "id" : "DiagnosticReport.identifier:analysisResultUuid.system",
      "path" : "DiagnosticReport.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/analysisResult_uuid"
    },
    {
      "id" : "DiagnosticReport.identifier:analysisResultUuid.value",
      "path" : "DiagnosticReport.identifier.value",
      "min" : 1
    },
    {
      "id" : "DiagnosticReport.identifier:facility",
      "path" : "DiagnosticReport.identifier",
      "sliceName" : "facility",
      "short" : "Identifier of the OpenELIS site that produced this resource",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.identifier:facility.use",
      "path" : "DiagnosticReport.identifier.use",
      "patternCode" : "official"
    },
    {
      "id" : "DiagnosticReport.identifier:facility.system",
      "path" : "DiagnosticReport.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/facility_id"
    },
    {
      "id" : "DiagnosticReport.identifier:facility.value",
      "path" : "DiagnosticReport.identifier.value",
      "min" : 1
    },
    {
      "id" : "DiagnosticReport.identifier:facility.assigner",
      "path" : "DiagnosticReport.identifier.assigner",
      "short" : "The site Organization",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-organization"]
      }]
    },
    {
      "id" : "DiagnosticReport.basedOn",
      "path" : "DiagnosticReport.basedOn",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-service-request"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analysis"
      }]
    },
    {
      "id" : "DiagnosticReport.status",
      "path" : "DiagnosticReport.status",
      "comment" : "Finalized = final. Technical acceptance = preliminary. Technical rejection = partial. Not started = registered. Otherwise unknown.",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analysis.statusId"
      }]
    },
    {
      "id" : "DiagnosticReport.code",
      "path" : "DiagnosticReport.code",
      "comment" : "Same codings as the ServiceRequest.code for the test.",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analysis.test + TestTerminologyMapping"
      }]
    },
    {
      "id" : "DiagnosticReport.subject",
      "path" : "DiagnosticReport.subject",
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
      "id" : "DiagnosticReport.specimen",
      "path" : "DiagnosticReport.specimen",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-specimen"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analysis.sampleItem"
      }]
    },
    {
      "id" : "DiagnosticReport.result",
      "path" : "DiagnosticReport.result",
      "short" : "Every result recorded for the test (one per component)",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-observation"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Result (all results of the analysis)"
      }]
    }]
  }
}

```
