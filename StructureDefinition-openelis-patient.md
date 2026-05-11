# OpenELIS Patient - OpenELIS GLOBAL2 Implementation Guide v0.1.0



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "openelis-patient",
  "url" : "http://digi-uw.github.io/openelis-global-ig/StructureDefinition/openelis-patient",
  "version" : "0.1.0",
  "name" : "OpenELISPatient",
  "title" : "OpenELIS Patient",
  "status" : "draft",
  "date" : "2026-05-11T15:58:07+00:00",
  "description" : "A patient used for OpenELIS FHIR Exchange",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "open-elis-patient-mapping",
    "uri" : "Patient",
    "name" : "OpenELIS Vs FHIR",
    "comment" : "Patient Mapping shows how attributes of FHIR Patient Resource maps to and from the attributes of OpenElis Patient Object."
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "cda",
    "uri" : "http://hl7.org/v3/cda",
    "name" : "CDA (R2)"
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
  },
  {
    "identity" : "loinc",
    "uri" : "http://loinc.org",
    "name" : "LOINC code for the element"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Patient",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Patient",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Patient",
      "path" : "Patient",
      "mapping" : [{
        "identity" : "open-elis-patient-mapping",
        "map" : "OE Patient",
        "comment" : "This profile maps FHIR Patient Resource to OE DataExchange."
      }]
    },
    {
      "id" : "Patient.id",
      "path" : "Patient.id",
      "mapping" : [{
        "identity" : "open-elis-patient-mapping",
        "map" : "Patient.fhirUuid"
      }]
    },
    {
      "id" : "Patient.identifier",
      "path" : "Patient.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "system"
        }],
        "rules" : "open"
      },
      "min" : 5
    },
    {
      "id" : "Patient.identifier.value",
      "path" : "Patient.identifier.value",
      "mapping" : [{
        "identity" : "open-elis-patient-mapping",
        "map" : "Patient.nationalId"
      },
      {
        "identity" : "open-elis-patient-mapping",
        "map" : "Patient.subjectNumber"
      }]
    },
    {
      "id" : "Patient.identifier:nationalid",
      "path" : "Patient.identifier",
      "sliceName" : "nationalid",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Patient.identifier:nationalid.system",
      "path" : "Patient.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/pat_nationalId"
    },
    {
      "id" : "Patient.identifier:subjectnumber",
      "path" : "Patient.identifier",
      "sliceName" : "subjectnumber",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Patient.identifier:subjectnumber.system",
      "path" : "Patient.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/pat_subjectNumber"
    },
    {
      "id" : "Patient.identifier:stnumber",
      "path" : "Patient.identifier",
      "sliceName" : "stnumber",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Patient.identifier:stnumber.system",
      "path" : "Patient.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/pat_stNumber"
    },
    {
      "id" : "Patient.identifier:guid",
      "path" : "Patient.identifier",
      "sliceName" : "guid",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Patient.identifier:guid.system",
      "path" : "Patient.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/pat_guid"
    },
    {
      "id" : "Patient.identifier:uuid",
      "path" : "Patient.identifier",
      "sliceName" : "uuid",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Patient.identifier:uuid.system",
      "path" : "Patient.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/pat_uuid"
    },
    {
      "id" : "Patient.name",
      "path" : "Patient.name",
      "min" : 1,
      "max" : "1",
      "mapping" : [{
        "identity" : "open-elis-patient-mapping",
        "map" : "Patient.name.given"
      },
      {
        "identity" : "open-elis-patient-mapping",
        "map" : "Patient.name.family"
      }]
    },
    {
      "id" : "Patient.gender",
      "path" : "Patient.gender",
      "min" : 1,
      "mapping" : [{
        "identity" : "open-elis-patient-mapping",
        "map" : "Patient.gender"
      }]
    },
    {
      "id" : "Patient.birthDate",
      "path" : "Patient.birthDate",
      "min" : 1,
      "mapping" : [{
        "identity" : "open-elis-patient-mapping",
        "map" : "Patient.birthDateForDisplay"
      }]
    },
    {
      "id" : "Patient.address",
      "path" : "Patient.address",
      "min" : 1,
      "max" : "1",
      "mapping" : [{
        "identity" : "open-elis-patient-mapping",
        "map" : "PersonAddress"
      }]
    },
    {
      "id" : "Patient.contact",
      "path" : "Patient.contact",
      "max" : "1",
      "mapping" : [{
        "identity" : "open-elis-patient-mapping",
        "map" : "Patient.person.primaryPhone"
      }]
    }]
  }
}

```
