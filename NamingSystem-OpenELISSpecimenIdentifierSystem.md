# OpenELISSpecimenIdentifierSystem - OpenELIS GLOBAL2 Implementation Guide v0.1.0



## Resource Content

```json
{
  "resourceType" : "NamingSystem",
  "id" : "OpenELISSpecimenIdentifierSystem",
  "extension" : [{
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-NamingSystem.url",
    "valueUri" : "http://digi-uw.github.io/openelis-global-ig/NamingSystem/OpenELISSpecimenIdentifierSystem"
  },
  {
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-NamingSystem.version",
    "valueString" : "0.1.0"
  }],
  "name" : "OpenELISSpecimenIdentifierSystem",
  "status" : "active",
  "kind" : "identifier",
  "date" : "2025-09-03",
  "description" : "Defined url for Specimen identifier system url ",
  "uniqueId" : [{
    "type" : "uri",
    "value" : "http://openelis-global.org/sampleItem_uuid",
    "preferred" : true
  },
  {
    "type" : "uri",
    "value" : "http://openelis-global.org/sampleItem_labNo"
  }]
}

```
