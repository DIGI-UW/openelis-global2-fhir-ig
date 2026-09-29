# OpenELIS Observation - OpenELIS Global FHIR Implementation Guide v0.2.0

## Resource Profile: OpenELIS Observation 

 
One result value as OpenELIS produces it (ObservationTransformServiceImpl) and serves it from /fhir/Observation. A multi-component test produces one Observation per component. 

**Usages:**

* Refer to this Profile: [OpenELIS DiagnosticReport](StructureDefinition-openelis-diagnostic-report.md)
* Examples for this Profile: [Observation/8330c79d-ccd9-5ef4-876d-2b176e5e86a5](Observation-8330c79d-ccd9-5ef4-876d-2b176e5e86a5.md) and [Observation/b73bf11f-06ff-55ad-935d-476bc270350a](Observation-b73bf11f-06ff-55ad-935d-476bc270350a.md)
* CapabilityStatements using this Profile: [OpenELIS Global FHIR REST server](CapabilityStatement-OpenELISFhirServer.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-openelis-observation.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-openelis-observation.csv), [Excel](../StructureDefinition-openelis-observation.xlsx), [Schematron](../StructureDefinition-openelis-observation.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "openelis-observation",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-observation",
  "version" : "0.2.0",
  "name" : "OpenELISObservation",
  "title" : "OpenELIS Observation",
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
  "description" : "One result value as OpenELIS produces it (ObservationTransformServiceImpl) and serves it from /fhir/Observation. A multi-component test produces one Observation per component.",
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
    "identity" : "sct-concept",
    "uri" : "http://snomed.info/conceptdomain",
    "name" : "SNOMED CT Concept Domain Binding"
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
    "identity" : "sct-attr",
    "uri" : "http://snomed.org/attributebinding",
    "name" : "SNOMED CT Attribute Binding"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Observation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Result (ObservationTransformServiceImpl)"
      }]
    },
    {
      "id" : "Observation.id",
      "path" : "Observation.id",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Result.fhirUuid"
      }]
    },
    {
      "id" : "Observation.identifier",
      "path" : "Observation.identifier",
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
      "id" : "Observation.identifier:resultUuid",
      "path" : "Observation.identifier",
      "sliceName" : "resultUuid",
      "short" : "OpenELIS result UUID (equals Observation.id)",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Result.fhirUuid"
      }]
    },
    {
      "id" : "Observation.identifier:resultUuid.system",
      "path" : "Observation.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/result_uuid"
    },
    {
      "id" : "Observation.identifier:resultUuid.value",
      "path" : "Observation.identifier.value",
      "min" : 1
    },
    {
      "id" : "Observation.identifier:facility",
      "path" : "Observation.identifier",
      "sliceName" : "facility",
      "short" : "Identifier of the OpenELIS site that produced this resource",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Observation.identifier:facility.use",
      "path" : "Observation.identifier.use",
      "patternCode" : "official"
    },
    {
      "id" : "Observation.identifier:facility.system",
      "path" : "Observation.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/facility_id"
    },
    {
      "id" : "Observation.identifier:facility.value",
      "path" : "Observation.identifier.value",
      "min" : 1
    },
    {
      "id" : "Observation.identifier:facility.assigner",
      "path" : "Observation.identifier.assigner",
      "short" : "The site Organization",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-organization"]
      }]
    },
    {
      "id" : "Observation.basedOn",
      "path" : "Observation.basedOn",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-service-request"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Result.analysis"
      }]
    },
    {
      "id" : "Observation.status",
      "path" : "Observation.status",
      "comment" : "final when the test is finalized (validated). preliminary for results not yet validated. unknown when the test has not started. cancelled for results deleted at validation.",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analysis.statusId"
      }]
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "comment" : "The test's codings (see OpenELISServiceRequest.code). For a component of a multi-component test, also the component's own terminology codings and an {oe}/test_result_component coding. code.text is then the component label.",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analysis.test + TestResultComponent + TestTerminologyMapping"
      }]
    },
    {
      "id" : "Observation.code.coding",
      "path" : "Observation.code.coding",
      "mustSupport" : true
    },
    {
      "id" : "Observation.subject",
      "path" : "Observation.subject",
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
      "id" : "Observation.effective[x]",
      "path" : "Observation.effective[x]",
      "comment" : "The release (validation) date when released. Otherwise the analysis start date.",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analysis.releasedDate (else Analysis.startedDate)"
      }]
    },
    {
      "id" : "Observation.issued",
      "path" : "Observation.issued",
      "comment" : "The release (validation) date.",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analysis.releasedDate"
      }]
    },
    {
      "id" : "Observation.performer",
      "path" : "Observation.performer",
      "comment" : "Currently the ordering provider of the sample, not the analyst (see Known Issues).",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-practitioner"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "SampleHuman.provider"
      }]
    },
    {
      "id" : "Observation.value[x]",
      "path" : "Observation.value[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      },
      "comment" : "Numeric results: valueQuantity with unit (the test's unit of measure as text). Dictionary (coded) and multi-select results: valueCodeableConcept with a LOINC answer coding when mapped plus an {oe}/dictionary_entry coding. Text results: valueString. Absent while no value is recorded.",
      "type" : [{
        "code" : "Quantity"
      },
      {
        "code" : "CodeableConcept"
      },
      {
        "code" : "string"
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Result.value (+ Dictionary for coded results, + unit of measure)"
      }]
    },
    {
      "id" : "Observation.value[x]:valueQuantity",
      "path" : "Observation.value[x]",
      "sliceName" : "valueQuantity",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Quantity"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.value[x]:valueQuantity.unit",
      "path" : "Observation.value[x].unit",
      "mustSupport" : true
    },
    {
      "id" : "Observation.specimen",
      "path" : "Observation.specimen",
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
      "id" : "Observation.device",
      "path" : "Observation.device",
      "comment" : "The analyzer that produced the result, when the analysis is linked to one. Only set in the bundles OpenELIS writes to its FHIR store, where the Device is included in the same transaction. Not set on Observations read from /fhir/Observation.",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-analyzer-device"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analysis.analyzerId"
      }]
    }]
  }
}

```
