# OpenELIS Patient - OpenELIS Global FHIR Implementation Guide v0.2.0

## Resource Profile: OpenELIS Patient 

 
A patient as OpenELIS produces it (PatientTransformServiceImpl.transformToFhirPatient) and serves it from /fhir/Patient. Environmental and vector orders have no patient. 

**Usages:**

* Refer to this Profile: [OpenELIS DiagnosticReport](StructureDefinition-openelis-diagnostic-report.md), [OpenELIS Observation](StructureDefinition-openelis-observation.md), [OpenELIS Order Task](StructureDefinition-openelis-order-task.md), [OpenELIS Referral Task](StructureDefinition-openelis-referral-task.md)... Show 2 more, [OpenELIS ServiceRequest](StructureDefinition-openelis-service-request.md) and [OpenELIS Specimen](StructureDefinition-openelis-specimen.md)
* Examples for this Profile: [Patient/5b6f3f86-2a44-4c3c-9d0c-6f0c4a2d7e11](Patient-5b6f3f86-2a44-4c3c-9d0c-6f0c4a2d7e11.md)
* CapabilityStatements using this Profile: [OpenELIS Global FHIR REST server](CapabilityStatement-OpenELISFhirServer.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-openelis-patient.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-openelis-patient.csv), [Excel](../StructureDefinition-openelis-patient.xlsx), [Schematron](../StructureDefinition-openelis-patient.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "openelis-patient",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-patient",
  "version" : "0.2.0",
  "name" : "OpenELISPatient",
  "title" : "OpenELIS Patient",
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
  "description" : "A patient as OpenELIS produces it (PatientTransformServiceImpl.transformToFhirPatient) and serves it from /fhir/Patient. Environmental and vector orders have no patient.",
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
        "identity" : "oe-data-model",
        "map" : "Patient + Person (PatientTransformServiceImpl)"
      }]
    },
    {
      "id" : "Patient.id",
      "path" : "Patient.id",
      "mapping" : [{
        "identity" : "oe-data-model",
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
        "description" : "Sliced by identifier system",
        "rules" : "open"
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:uuid",
      "path" : "Patient.identifier",
      "sliceName" : "uuid",
      "short" : "OpenELIS patient UUID (equals Patient.id)",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Patient.fhirUuid"
      }]
    },
    {
      "id" : "Patient.identifier:uuid.system",
      "path" : "Patient.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/pat_uuid"
    },
    {
      "id" : "Patient.identifier:uuid.value",
      "path" : "Patient.identifier.value",
      "min" : 1
    },
    {
      "id" : "Patient.identifier:nationalId",
      "path" : "Patient.identifier",
      "sliceName" : "nationalId",
      "short" : "National id",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Patient.nationalId (patient_identity NATIONAL)"
      }]
    },
    {
      "id" : "Patient.identifier:nationalId.use",
      "path" : "Patient.identifier.use",
      "patternCode" : "official"
    },
    {
      "id" : "Patient.identifier:nationalId.system",
      "path" : "Patient.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/pat_nationalId"
    },
    {
      "id" : "Patient.identifier:nationalId.value",
      "path" : "Patient.identifier.value",
      "min" : 1
    },
    {
      "id" : "Patient.identifier:subjectNumber",
      "path" : "Patient.identifier",
      "sliceName" : "subjectNumber",
      "short" : "Subject (programme) number",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Patient subject number (patient_identity SUBJECT)"
      }]
    },
    {
      "id" : "Patient.identifier:subjectNumber.system",
      "path" : "Patient.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/pat_subjectNumber"
    },
    {
      "id" : "Patient.identifier:subjectNumber.value",
      "path" : "Patient.identifier.value",
      "min" : 1
    },
    {
      "id" : "Patient.identifier:stNumber",
      "path" : "Patient.identifier",
      "sliceName" : "stNumber",
      "short" : "ST number",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Patient ST number (patient_identity ST)"
      }]
    },
    {
      "id" : "Patient.identifier:stNumber.system",
      "path" : "Patient.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/pat_stNumber"
    },
    {
      "id" : "Patient.identifier:stNumber.value",
      "path" : "Patient.identifier.value",
      "min" : 1
    },
    {
      "id" : "Patient.identifier:guid",
      "path" : "Patient.identifier",
      "sliceName" : "guid",
      "short" : "Patient GUID",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Patient GUID (patient_identity GUID)"
      }]
    },
    {
      "id" : "Patient.identifier:guid.system",
      "path" : "Patient.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/pat_guid"
    },
    {
      "id" : "Patient.identifier:guid.value",
      "path" : "Patient.identifier.value",
      "min" : 1
    },
    {
      "id" : "Patient.identifier:facility",
      "path" : "Patient.identifier",
      "sliceName" : "facility",
      "short" : "Identifier of the OpenELIS site that produced this resource",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Site facility id (org.openelisglobal.facility.id)"
      }]
    },
    {
      "id" : "Patient.identifier:facility.use",
      "path" : "Patient.identifier.use",
      "patternCode" : "official"
    },
    {
      "id" : "Patient.identifier:facility.system",
      "path" : "Patient.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/facility_id"
    },
    {
      "id" : "Patient.identifier:facility.value",
      "path" : "Patient.identifier.value",
      "min" : 1
    },
    {
      "id" : "Patient.identifier:facility.assigner",
      "path" : "Patient.identifier.assigner",
      "short" : "The site Organization",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-organization"]
      }]
    },
    {
      "id" : "Patient.name",
      "path" : "Patient.name",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.name.use",
      "path" : "Patient.name.use",
      "mustSupport" : true
    },
    {
      "id" : "Patient.name.family",
      "path" : "Patient.name.family",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Person.lastName"
      }]
    },
    {
      "id" : "Patient.name.given",
      "path" : "Patient.name.given",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Person.firstName"
      }]
    },
    {
      "id" : "Patient.telecom",
      "path" : "Patient.telecom",
      "comment" : "Primary phone (use = mobile), email and fax.",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Person.primaryPhone (use = mobile) / email / fax"
      }]
    },
    {
      "id" : "Patient.gender",
      "path" : "Patient.gender",
      "comment" : "OpenELIS stores M / F. M maps to male. Any other stored value maps to female. A blank value maps to unknown (see Known Issues).",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Patient.gender (M / F)"
      }]
    },
    {
      "id" : "Patient.birthDate",
      "path" : "Patient.birthDate",
      "comment" : "Partially known birth dates are sent at year or year-month precision.",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Patient.birthDateForDisplay"
      }]
    },
    {
      "id" : "Patient.address",
      "path" : "Patient.address",
      "comment" : "One address built from the person's street, city, state and country. A commune, when recorded, is added as an extra line prefixed 'commune: '.",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address.line",
      "path" : "Patient.address.line",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Person.streetAddress (+ PersonAddress commune)"
      }]
    },
    {
      "id" : "Patient.address.city",
      "path" : "Patient.address.city",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Person.city"
      }]
    },
    {
      "id" : "Patient.address.state",
      "path" : "Patient.address.state",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Person.state"
      }]
    },
    {
      "id" : "Patient.address.country",
      "path" : "Patient.address.country",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Person.country"
      }]
    }]
  }
}

```
