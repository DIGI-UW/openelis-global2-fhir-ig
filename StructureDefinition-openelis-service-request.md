# OpenELIS Service Request - OpenELIS GLOBAL2 Implementation Guide v0.1.0



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "openelis-service-request",
  "url" : "http://digi-uw.github.io/openelis-global-ig/StructureDefinition/openelis-service-request",
  "version" : "0.1.0",
  "name" : "OpenELISServiceRequest",
  "title" : "OpenELIS Service Request",
  "status" : "draft",
  "date" : "2026-05-11T11:15:58+00:00",
  "description" : "OpenELIS service request",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "oe-service-request-mapping",
    "uri" : "ServiceRequest",
    "name" : "OpenELIS Vs FHIR",
    "comment" : "ServiceRequest Mapping shows how attributes of FHIR ServiceRequest Resource maps to and from the attributes of OpenElis SampleItem Object."
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
        "identity" : "oe-service-request-mapping",
        "map" : "OE ServiceRequest",
        "comment" : "This profile maps FHIR ServiceRequest to OE DataExchange."
      }]
    },
    {
      "id" : "ServiceRequest.id",
      "path" : "ServiceRequest.id",
      "mapping" : [{
        "identity" : "oe-service-request-mapping",
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
        "rules" : "open"
      },
      "min" : 2
    },
    {
      "id" : "ServiceRequest.identifier:uuid",
      "path" : "ServiceRequest.identifier",
      "sliceName" : "uuid",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "ServiceRequest.identifier:uuid.system",
      "path" : "ServiceRequest.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/analysis_uuid"
    },
    {
      "id" : "ServiceRequest.identifier:labNo",
      "path" : "ServiceRequest.identifier",
      "sliceName" : "labNo",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "ServiceRequest.identifier:labNo.system",
      "path" : "ServiceRequest.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/samp_labNo"
    },
    {
      "id" : "ServiceRequest.status",
      "path" : "ServiceRequest.status",
      "mapping" : [{
        "identity" : "oe-service-request-mapping",
        "map" : "Analysis.status"
      }]
    },
    {
      "id" : "ServiceRequest.intent",
      "path" : "ServiceRequest.intent",
      "mapping" : [{
        "identity" : "oe-service-request-mapping",
        "map" : "Analysis.intent"
      }]
    },
    {
      "id" : "ServiceRequest.category",
      "path" : "ServiceRequest.category",
      "max" : "1",
      "mapping" : [{
        "identity" : "oe-service-request-mapping",
        "map" : "ObservationHistory.value"
      }]
    },
    {
      "id" : "ServiceRequest.priority",
      "path" : "ServiceRequest.priority",
      "min" : 1,
      "mapping" : [{
        "identity" : "oe-service-request-mapping",
        "map" : "Analysis.priority"
      }]
    },
    {
      "id" : "ServiceRequest.code",
      "path" : "ServiceRequest.code",
      "min" : 1
    },
    {
      "id" : "ServiceRequest.code.coding.code",
      "path" : "ServiceRequest.code.coding.code",
      "mapping" : [{
        "identity" : "oe-service-request-mapping",
        "map" : "Analysis.test.loinc"
      }]
    },
    {
      "id" : "ServiceRequest.code.coding.display",
      "path" : "ServiceRequest.code.coding.display",
      "mapping" : [{
        "identity" : "oe-service-request-mapping",
        "map" : "Analysis.test.localizedTestName"
      }]
    },
    {
      "id" : "ServiceRequest.subject",
      "path" : "ServiceRequest.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/openelis-patient"]
      }],
      "mapping" : [{
        "identity" : "oe-service-request-mapping",
        "map" : "Patient"
      }]
    },
    {
      "id" : "ServiceRequest.requester",
      "path" : "ServiceRequest.requester",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/open-elispractitioner"]
      }],
      "mapping" : [{
        "identity" : "oe-service-request-mapping",
        "map" : "Provider"
      }]
    },
    {
      "id" : "ServiceRequest.locationReference",
      "path" : "ServiceRequest.locationReference",
      "mapping" : [{
        "identity" : "oe-service-request-mapping",
        "map" : "Organisation"
      }]
    },
    {
      "id" : "ServiceRequest.specimen",
      "path" : "ServiceRequest.specimen",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/open-elis-specimen"]
      }],
      "mapping" : [{
        "identity" : "oe-service-request-mapping",
        "map" : "SampleItem"
      }]
    },
    {
      "id" : "ServiceRequest.note",
      "path" : "ServiceRequest.note",
      "max" : "1",
      "mapping" : [{
        "identity" : "oe-service-request-mapping",
        "map" : "note"
      }]
    }]
  }
}

```
