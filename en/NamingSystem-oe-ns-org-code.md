# oe-ns-org-code - OpenELIS Global FHIR Implementation Guide v0.2.0

## NamingSystem: oe-ns-org-code 

 
Organization code configured in OpenELIS. 



## Resource Content

```json
{
  "resourceType" : "NamingSystem",
  "id" : "oe-ns-org-code",
  "extension" : [{
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-NamingSystem.url",
    "valueUri" : "https://digi-uw.github.io/openelis-global2-fhir-ig/NamingSystem/oe-ns-org-code"
  },
  {
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-NamingSystem.version",
    "valueString" : "0.2.0"
  }],
  "name" : "OEOrganizationCode",
  "status" : "active",
  "kind" : "identifier",
  "date" : "2026-09-29",
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
  "responsible" : "OpenELIS Global",
  "description" : "Organization code configured in OpenELIS.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "001",
      "display" : "World"
    }]
  }],
  "uniqueId" : [{
    "type" : "uri",
    "value" : "http://openelis-global.org/org_code",
    "preferred" : true
  }]
}

```
