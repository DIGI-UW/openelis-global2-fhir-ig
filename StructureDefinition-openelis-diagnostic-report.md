# OpenELIS Diagnostic Report - OpenELIS GLOBAL2 Implementation Guide v0.1.0



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "openelis-diagnostic-report",
  "url" : "http://digi-uw.github.io/openelis-global-ig/StructureDefinition/openelis-diagnostic-report",
  "version" : "0.1.0",
  "name" : "OpenELISDiagnosticReport",
  "title" : "OpenELIS Diagnostic Report",
  "status" : "draft",
  "date" : "2026-05-11T15:58:07+00:00",
  "description" : "DiagnosticReport resource created by a LIS",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "oe-diagnostic-report-mapping",
    "uri" : "DiagnosticReport",
    "name" : "OpenELIS Vs FHIR",
    "comment" : "DiagnosticReport Mapping shows how attributes of FHIR DiagnosticReport Resource maps to and from the attributes of OpenElis SampleItem Object."
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
        "identity" : "oe-diagnostic-report-mapping",
        "map" : "OE DiagnosticReport",
        "comment" : "This profile maps FHIR DiagnosticReport to OE DataExchange."
      }]
    },
    {
      "id" : "DiagnosticReport.id",
      "path" : "DiagnosticReport.id",
      "mapping" : [{
        "identity" : "oe-diagnostic-report-mapping",
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
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "DiagnosticReport.identifier:uuid",
      "path" : "DiagnosticReport.identifier",
      "sliceName" : "uuid",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "DiagnosticReport.identifier:uuid.system",
      "path" : "DiagnosticReport.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/analysisResult_uuid"
    },
    {
      "id" : "DiagnosticReport.basedOn",
      "path" : "DiagnosticReport.basedOn",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/openelis-service-request"]
      }],
      "mapping" : [{
        "identity" : "oe-diagnostic-report-mapping",
        "map" : "Analysis"
      }]
    },
    {
      "id" : "DiagnosticReport.status",
      "path" : "DiagnosticReport.status",
      "mapping" : [{
        "identity" : "oe-diagnostic-report-mapping",
        "map" : "status"
      }]
    },
    {
      "id" : "DiagnosticReport.code.coding",
      "path" : "DiagnosticReport.code.coding",
      "min" : 1
    },
    {
      "id" : "DiagnosticReport.subject",
      "path" : "DiagnosticReport.subject",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/openelis-patient"]
      }],
      "mapping" : [{
        "identity" : "oe-diagnostic-report-mapping",
        "map" : "patient"
      }]
    },
    {
      "id" : "DiagnosticReport.specimen",
      "path" : "DiagnosticReport.specimen",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/open-elis-specimen"]
      }],
      "mapping" : [{
        "identity" : "oe-diagnostic-report-mapping",
        "map" : "SampleItem"
      }]
    },
    {
      "id" : "DiagnosticReport.result",
      "path" : "DiagnosticReport.result",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/open-elis-observation"]
      }],
      "mapping" : [{
        "identity" : "oe-diagnostic-report-mapping",
        "map" : "Result"
      }]
    }]
  }
}

```
