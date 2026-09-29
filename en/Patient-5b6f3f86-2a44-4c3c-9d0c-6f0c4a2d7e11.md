# Patient - OpenELIS Global FHIR Implementation Guide v0.2.0

## Example Patient: Patient

Profile: [OpenELIS Patient](StructureDefinition-openelis-patient.md)

Grace Banda (official) Female, DoB: 1991-04 ( http://openelis-global.org/pat_guid#OEPatientGUID#dd63810d-c44b-52b6-b70d-0d8e60533c6d (use: usual, ))

-------

| | |
| :--- | :--- |
| Other Ids: | * [OEPatientUUID](NamingSystem-oe-ns-pat-uuid.md)/5b6f3f86-2a44-4c3c-9d0c-6f0c4a2d7e11 (use: usual, )
* [OEPatientSubjectNumber](NamingSystem-oe-ns-pat-subject-number.md)/RHC-2026-00417 (use: usual, )
* [OEPatientNationalId](NamingSystem-oe-ns-pat-national-id.md)/NID-000-123-456 (use: official, )
* [OEFacilityId](NamingSystem-oe-ns-facility-id.md)/EDH-LAB (use: official, )
 |
| Contact Detail | * [+000 555 0199](tel:+0005550199)
* Plot 7, Hill Street commune: Riverside North Riverside XX 
 |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "5b6f3f86-2a44-4c3c-9d0c-6f0c4a2d7e11",
  "meta" : {
    "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-patient"]
  },
  "identifier" : [{
    "use" : "usual",
    "system" : "http://openelis-global.org/pat_uuid",
    "value" : "5b6f3f86-2a44-4c3c-9d0c-6f0c4a2d7e11"
  },
  {
    "use" : "usual",
    "system" : "http://openelis-global.org/pat_subjectNumber",
    "value" : "RHC-2026-00417"
  },
  {
    "use" : "official",
    "system" : "http://openelis-global.org/pat_nationalId",
    "value" : "NID-000-123-456"
  },
  {
    "use" : "usual",
    "system" : "http://openelis-global.org/pat_guid",
    "value" : "dd63810d-c44b-52b6-b70d-0d8e60533c6d"
  },
  {
    "use" : "official",
    "system" : "http://openelis-global.org/facility_id",
    "value" : "EDH-LAB",
    "assigner" : {
      "reference" : "Organization/a845f2db-10e5-5117-ac75-553f615e301a"
    }
  }],
  "name" : [{
    "use" : "official",
    "family" : "Banda",
    "given" : ["Grace"]
  }],
  "telecom" : [{
    "system" : "phone",
    "value" : "+000 555 0199",
    "use" : "mobile"
  }],
  "gender" : "female",
  "birthDate" : "1991-04",
  "address" : [{
    "line" : ["Plot 7, Hill Street", "commune: Riverside North"],
    "city" : "Riverside",
    "country" : "XX"
  }]
}

```
