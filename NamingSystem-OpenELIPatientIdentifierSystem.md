# OpenELIPatientIdentifierSystem - OpenELIS GLOBAL2 Implementation Guide v0.1.0



## Resource Content

```json
{
  "resourceType" : "NamingSystem",
  "id" : "OpenELIPatientIdentifierSystem",
  "extension" : [{
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-NamingSystem.url",
    "valueUri" : "http://digi-uw.github.io/openelis-global-ig/NamingSystem/OpenELIPatientIdentifierSystem"
  },
  {
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-NamingSystem.version",
    "valueString" : "0.1.0"
  }],
  "name" : "OpenELIPatientIdentifierSystem",
  "status" : "active",
  "kind" : "identifier",
  "date" : "2025-09-03",
  "description" : "Defined url for OpenELISPatient identifier system url ",
  "uniqueId" : [{
    "type" : "uri",
    "value" : "http://openelis-global.org/pat_nationalId",
    "preferred" : true
  },
  {
    "type" : "uri",
    "value" : "http://openelis-global.org/pat_subjectNumber"
  },
  {
    "type" : "uri",
    "value" : "http://openelis-global.org/pat_stNumber"
  },
  {
    "type" : "uri",
    "value" : "http://openelis-global.org/pat_guid"
  },
  {
    "type" : "uri",
    "value" : "http://openelis-global.org/pat_uuid"
  }]
}

```
