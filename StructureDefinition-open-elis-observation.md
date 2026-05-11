# OpenELIS Observation - OpenELIS GLOBAL2 Implementation Guide v0.1.0



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "open-elis-observation",
  "url" : "http://digi-uw.github.io/openelis-global-ig/StructureDefinition/open-elis-observation",
  "version" : "0.1.0",
  "name" : "OpenELISObservation",
  "title" : "OpenELIS Observation",
  "status" : "draft",
  "date" : "2026-05-11T11:15:58+00:00",
  "description" : "An Observation Resource used for FHIR Exchange",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "oe-observation-mapping",
    "uri" : "Observation",
    "name" : "OpenELIS Vs FHIR",
    "comment" : "Observation Mapping shows how attributes of FHIR Observation Resource maps to and from the attributes of OpenElis Results Object."
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
        "identity" : "oe-observation-mapping",
        "map" : "OE Observation",
        "comment" : "This profile maps FHIR Observation to OE DataExchange."
      }]
    },
    {
      "id" : "Observation.id",
      "path" : "Observation.id",
      "mapping" : [{
        "identity" : "oe-observation-mapping",
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
        "rules" : "open"
      },
      "min" : 1,
      "mapping" : [{
        "identity" : "oe-observation-mapping",
        "map" : "Result.fhirUuid"
      }]
    },
    {
      "id" : "Observation.identifier:uuid",
      "path" : "Observation.identifier",
      "sliceName" : "uuid",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Observation.identifier:uuid.system",
      "path" : "Observation.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/result_uuid"
    },
    {
      "id" : "Observation.basedOn",
      "path" : "Observation.basedOn",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/openelis-service-request"]
      }],
      "mapping" : [{
        "identity" : "oe-observation-mapping",
        "map" : "Analysis"
      }]
    },
    {
      "id" : "Observation.status",
      "path" : "Observation.status",
      "mapping" : [{
        "identity" : "oe-observation-mapping",
        "map" : "Result.analysis.status"
      }]
    },
    {
      "id" : "Observation.subject",
      "path" : "Observation.subject",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/openelis-patient"]
      }],
      "mapping" : [{
        "identity" : "oe-observation-mapping",
        "map" : "Patient"
      }]
    },
    {
      "id" : "Observation.effective[x]",
      "path" : "Observation.effective[x]",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "Observation.performer",
      "path" : "Observation.performer",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://digi-uw.github.io/openelis-global-ig/StructureDefinition/open-elispractitioner"]
      }]
    },
    {
      "id" : "Observation.value[x]",
      "path" : "Observation.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "Quantity"
      }],
      "mapping" : [{
        "identity" : "oe-observation-mapping",
        "map" : "Result.value"
      }]
    },
    {
      "id" : "Observation.specimen",
      "path" : "Observation.specimen",
      "min" : 1,
      "mapping" : [{
        "identity" : "oe-observation-mapping",
        "map" : "SampleItem"
      }]
    }]
  }
}

```
