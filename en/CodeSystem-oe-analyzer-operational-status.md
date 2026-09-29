# OpenELIS Analyzer Operational Status - OpenELIS Global FHIR Implementation Guide v0.2.0

## CodeSystem: OpenELIS Analyzer Operational Status 

 
OpenELIS's own analyzer lifecycle status, sent unchanged (enum name, a plain code with no system) in the analyzer-operational-status extension. This CodeSystem exists only so the IG can bind that code. Device.status carries the FHIR mapping of the same value. 

This Code system is referenced in the definition of the following value sets:

* [OpenELIS Analyzer Operational Statuses](ValueSet-oe-analyzer-operational-status.md)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "oe-analyzer-operational-status",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/CodeSystem/oe-analyzer-operational-status",
  "version" : "0.2.0",
  "name" : "OEAnalyzerOperationalStatus",
  "title" : "OpenELIS Analyzer Operational Status",
  "status" : "active",
  "experimental" : false,
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
  "description" : "OpenELIS's own analyzer lifecycle status, sent unchanged (enum name, a plain code with no system) in the analyzer-operational-status extension. This CodeSystem exists only so the IG can bind that code. Device.status carries the FHIR mapping of the same value.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "001",
      "display" : "World"
    }]
  }],
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 6,
  "concept" : [{
    "code" : "SETUP",
    "display" : "Setup",
    "definition" : "Being configured. Device.status = active."
  },
  {
    "code" : "VALIDATION",
    "display" : "Validation",
    "definition" : "Under validation. Device.status = active."
  },
  {
    "code" : "ACTIVE",
    "display" : "Active",
    "definition" : "In routine use. Device.status = active."
  },
  {
    "code" : "ERROR_PENDING",
    "display" : "Error pending",
    "definition" : "Has an unresolved error. Device.status = entered-in-error."
  },
  {
    "code" : "OFFLINE",
    "display" : "Offline",
    "definition" : "Not reachable. Device.status = unknown."
  },
  {
    "code" : "INACTIVE",
    "display" : "Inactive",
    "definition" : "Retired or disabled. Device.status = inactive."
  }]
}

```
