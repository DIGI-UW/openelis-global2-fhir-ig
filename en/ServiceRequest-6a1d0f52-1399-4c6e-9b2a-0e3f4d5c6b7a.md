# OpenELIS ServiceRequest: environmental sample - OpenELIS Global FHIR Implementation Guide v0.2.1

## Example ServiceRequest: OpenELIS ServiceRequest: environmental sample

Profile: [OpenELIS ServiceRequest](StructureDefinition-openelis-service-request.md)

**identifier**: [OEAnalysisUUID](NamingSystem-oe-ns-analysis-uuid.md)/6a1d0f52-1399-4c6e-9b2a-0e3f4d5c6b7a (use: usual)

**requisition**: [OESampleLabNumber](NamingSystem-oe-ns-samp-labno.md)/EDH26000000418 (use: usual)

**status**: Active

**intent**: Original Order

**category**: E

**priority**: Routine

**code**: pH

**subject**: [Well 7](#hc6a1d0f52-1399-4c6e-9b2a-0e3f4d5c6b7a/subject)

**authoredOn**: 2026-10-12

**locationReference**: [Riverside Health Centre](Location-d3619aef-5abf-5b4f-a76c-06f378deca13.md)

-------

> **Exception parsing generated Narrative (see /tmp/liquid-7c0f7b3f-c5bc-42ba-a30a-46eb11128f49.html): Error in template: Root element is not 'div'**



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "6a1d0f52-1399-4c6e-9b2a-0e3f4d5c6b7a",
  "meta" : {
    "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-service-request"]
  },
  "contained" : [{
    "resourceType" : "Group",
    "id" : "subject",
    "type" : "substance",
    "actual" : false,
    "name" : "Well 7"
  }],
  "identifier" : [{
    "use" : "usual",
    "system" : "http://openelis-global.org/analysis_uuid",
    "value" : "6a1d0f52-1399-4c6e-9b2a-0e3f4d5c6b7a"
  }],
  "requisition" : {
    "use" : "usual",
    "system" : "http://openelis-global.org/samp_labNo",
    "value" : "EDH26000000418"
  },
  "status" : "active",
  "intent" : "original-order",
  "category" : [{
    "coding" : [{
      "system" : "http://openelis-global.org/samp_domain",
      "code" : "E",
      "display" : "E"
    }]
  }],
  "priority" : "routine",
  "code" : {
    "text" : "pH"
  },
  "subject" : {
    "reference" : "#subject"
  },
  "authoredOn" : "2026-10-12",
  "locationReference" : [{
    "reference" : "Location/d3619aef-5abf-5b4f-a76c-06f378deca13"
  }]
}

```
