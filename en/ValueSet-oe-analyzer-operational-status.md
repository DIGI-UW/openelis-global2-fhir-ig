# OpenELIS Analyzer Operational Statuses - OpenELIS Global FHIR Implementation Guide v0.2.0

## ValueSet: OpenELIS Analyzer Operational Statuses 

 
All analyzer operational statuses. 

 **References** 

* [Analyzer operational status](StructureDefinition-analyzer-operational-status.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "oe-analyzer-operational-status",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/ValueSet/oe-analyzer-operational-status",
  "version" : "0.2.0",
  "name" : "OEAnalyzerOperationalStatusVS",
  "title" : "OpenELIS Analyzer Operational Statuses",
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
  "description" : "All analyzer operational statuses.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "001",
      "display" : "World"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "https://digi-uw.github.io/openelis-global2-fhir-ig/CodeSystem/oe-analyzer-operational-status"
    }]
  }
}

```
