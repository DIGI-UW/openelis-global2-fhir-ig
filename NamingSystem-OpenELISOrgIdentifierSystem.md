# OpenELISOrgIdentifierSystem - OpenELIS GLOBAL2 Implementation Guide v0.1.0



## Resource Content

```json
{
  "resourceType" : "NamingSystem",
  "id" : "OpenELISOrgIdentifierSystem",
  "extension" : [{
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-NamingSystem.url",
    "valueUri" : "http://digi-uw.github.io/openelis-global-ig/NamingSystem/OpenELISOrgIdentifierSystem"
  },
  {
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-NamingSystem.version",
    "valueString" : "0.1.0"
  }],
  "name" : "OpenELISOrgIdentifierSystem",
  "status" : "active",
  "kind" : "identifier",
  "date" : "2025-09-03",
  "description" : "Defined url for OpenELISOrganization identifier system url ",
  "uniqueId" : [{
    "type" : "uri",
    "value" : "http://openelis-global.org/org_uuid",
    "preferred" : true
  },
  {
    "type" : "uri",
    "value" : "http://openelis-global.org/org_cliaNum"
  },
  {
    "type" : "uri",
    "value" : "http://openelis-global.org/org_shortName"
  },
  {
    "type" : "uri",
    "value" : "http://openelis-global.org/org_code"
  }]
}

```
