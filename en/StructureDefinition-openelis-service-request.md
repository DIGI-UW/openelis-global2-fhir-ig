# OpenELIS ServiceRequest - OpenELIS Global FHIR Implementation Guide v0.2.1

## Resource Profile: OpenELIS ServiceRequest 

**Usages:**

* Refer to this Profile: [OpenELIS DiagnosticReport](StructureDefinition-openelis-diagnostic-report.md), [OpenELIS Observation](StructureDefinition-openelis-observation.md), [OpenELIS Order Task](StructureDefinition-openelis-order-task.md), [OpenELIS Referral Task](StructureDefinition-openelis-referral-task.md) and [OpenELIS Specimen](StructureDefinition-openelis-specimen.md)
* Examples for this Profile: [ServiceRequest/3b2c3407-5430-5878-9c61-c4c9b9c013c4](ServiceRequest-3b2c3407-5430-5878-9c61-c4c9b9c013c4.md), [ServiceRequest/48549f60-c400-5510-97da-2e2497627e81](ServiceRequest-48549f60-c400-5510-97da-2e2497627e81.md) and [ServiceRequest/6a1d0f52-1399-4c6e-9b2a-0e3f4d5c6b7a](ServiceRequest-6a1d0f52-1399-4c6e-9b2a-0e3f4d5c6b7a.md)
* CapabilityStatements using this Profile: [OpenELIS Global FHIR REST server](CapabilityStatement-OpenELISFhirServer.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-openelis-service-request.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-openelis-service-request.csv), [Excel](../StructureDefinition-openelis-service-request.xlsx), [Schematron](../StructureDefinition-openelis-service-request.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "openelis-service-request",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-service-request",
  "version" : "0.2.1",
  "name" : "OpenELISServiceRequest",
  "title" : "OpenELIS ServiceRequest",
  "status" : "draft",
  "date" : "2026-10-12T15:07:11+00:00",
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
  "description" : "One ordered test (an OpenELIS Analysis) as OpenELIS produces it (ServiceRequestTransformServiceImpl) and serves it from /fhir/ServiceRequest. The id is the Analysis UUID. The DiagnosticReport for the same test has the same id.",
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
      "path" : "ServiceRequest",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analysis (ServiceRequestTransformServiceImpl)"
      }]
    },
    {
      "id" : "ServiceRequest.id",
      "path" : "ServiceRequest.id",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analysis.fhirUuid"
      }]
    },
    {
      "id" : "ServiceRequest.identifier",
      "path" : "ServiceRequest.identifier",
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
      "id" : "ServiceRequest.identifier:analysisUuid",
      "path" : "ServiceRequest.identifier",
      "sliceName" : "analysisUuid",
      "short" : "OpenELIS Analysis UUID (equals ServiceRequest.id)",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analysis.fhirUuid"
      }]
    },
    {
      "id" : "ServiceRequest.identifier:analysisUuid.system",
      "path" : "ServiceRequest.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/analysis_uuid"
    },
    {
      "id" : "ServiceRequest.identifier:analysisUuid.value",
      "path" : "ServiceRequest.identifier.value",
      "min" : 1
    },
    {
      "id" : "ServiceRequest.identifier:facility",
      "path" : "ServiceRequest.identifier",
      "sliceName" : "facility",
      "short" : "Identifier of the OpenELIS site that produced this resource",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.identifier:facility.use",
      "path" : "ServiceRequest.identifier.use",
      "patternCode" : "official"
    },
    {
      "id" : "ServiceRequest.identifier:facility.system",
      "path" : "ServiceRequest.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/facility_id"
    },
    {
      "id" : "ServiceRequest.identifier:facility.value",
      "path" : "ServiceRequest.identifier.value",
      "min" : 1
    },
    {
      "id" : "ServiceRequest.identifier:facility.assigner",
      "path" : "ServiceRequest.identifier.assigner",
      "short" : "The site Organization",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-organization"]
      }]
    },
    {
      "id" : "ServiceRequest.basedOn",
      "path" : "ServiceRequest.basedOn",
      "short" : "The external order (FHIR electronic orders only)",
      "comment" : "The incoming ServiceRequest by id, found through OpenELIS's local copy of it. When that copy cannot be read, a logical reference: type ServiceRequest with the order number (the incoming ServiceRequest's first identifier value) as identifier.value.",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/ServiceRequest"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Sample.referringId (external order number)"
      }]
    },
    {
      "id" : "ServiceRequest.requisition",
      "path" : "ServiceRequest.requisition",
      "short" : "Lab (accession) number of the order",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Sample.accessionNumber"
      }]
    },
    {
      "id" : "ServiceRequest.requisition.system",
      "path" : "ServiceRequest.requisition.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/samp_labNo"
    },
    {
      "id" : "ServiceRequest.requisition.value",
      "path" : "ServiceRequest.requisition.value",
      "min" : 1
    },
    {
      "id" : "ServiceRequest.status",
      "path" : "ServiceRequest.status",
      "comment" : "Not started, technical acceptance and biologist rejected = active. Finalized = completed. Technical rejection and cancelled = revoked. Sample rejected = entered-in-error. Otherwise unknown. On result entry a completed or revoked status already in the FHIR store is not downgraded. Other paths (validation, bulk transform) do not apply this guard.",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analysis.statusId"
      }]
    },
    {
      "id" : "ServiceRequest.intent",
      "path" : "ServiceRequest.intent",
      "comment" : "original-order when entered in OpenELIS. order when received as an electronic order (FHIR or HL7 v2).",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "ElectronicOrder.type for Sample.referringId"
      }]
    },
    {
      "id" : "ServiceRequest.category",
      "path" : "ServiceRequest.category",
      "comment" : "Carries the order's programme ({oe}/sample_program) and domain ({oe}/samp_domain) when set.",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "ObservationHistory PROGRAM / Sample.domain"
      }]
    },
    {
      "id" : "ServiceRequest.priority",
      "path" : "ServiceRequest.priority",
      "comment" : "routine / asap / stat (stat and future stat) / urgent (timed).",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Sample.priority"
      }]
    },
    {
      "id" : "ServiceRequest.code",
      "path" : "ServiceRequest.code",
      "comment" : "Codings from the test's active terminology mappings (LOINC / SNOMED CT / CIEL / OCL) for the specimen's sample type, grouped by system. A SAME_AS mapping wins within a system. The test's legacy LOINC is included. code.text is the test name.",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Analysis.test + TestTerminologyMapping"
      }]
    },
    {
      "id" : "ServiceRequest.code.coding",
      "path" : "ServiceRequest.code.coding",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.code.text",
      "path" : "ServiceRequest.code.text",
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.subject",
      "path" : "ServiceRequest.subject",
      "comment" : "The Patient. An order without a patient (environmental, vector, or clinical entered without one) has the sampling site's Location (the sample item's collection site, else the order's environmental or vector site) when the site stands for an organization, else a contained Group (#subject: type substance for environmental, animal for vector, person otherwise; actual false; name = the site name when known).",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-patient",
        "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-site-location",
        "http://hl7.org/fhir/StructureDefinition/Group"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "SampleHuman.patient, else ObservationHistory envSamplingSiteId / vecCollectionSiteId (VectorSamplingSite.organizationId)"
      }]
    },
    {
      "id" : "ServiceRequest.authoredOn",
      "path" : "ServiceRequest.authoredOn",
      "comment" : "The order's request date (day precision) when recorded, else when the order was entered. The same order is published with the same value every time.",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "ServiceRequest.requester",
      "path" : "ServiceRequest.requester",
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
      "id" : "ServiceRequest.locationReference",
      "path" : "ServiceRequest.locationReference",
      "comment" : "Referring site, then referring department: the site Location of each organization (same id as the Organization). OpenELIS writes those Locations to the FHIR store with the ServiceRequest and serves them from /fhir/Location/{id}.",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-site-location"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Sample requester organizations (referring org / referring department)"
      }]
    },
    {
      "id" : "ServiceRequest.specimen",
      "path" : "ServiceRequest.specimen",
      "comment" : "The sample item the test runs on. Absent for pool-level vector analyses.",
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
      "id" : "ServiceRequest.note",
      "path" : "ServiceRequest.note",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Note (analysis notes)"
      }]
    }]
  }
}

```
