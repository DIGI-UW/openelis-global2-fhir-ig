# OpenELIS Practitioner - OpenELIS Global FHIR Implementation Guide v0.2.0

## Resource Profile: OpenELIS Practitioner 

 
A requesting provider as OpenELIS produces it (PractitionerTransformServiceImpl) and serves it from /fhir/Practitioner. 

**Usages:**

* Refer to this Profile: [OpenELIS Observation](StructureDefinition-openelis-observation.md), [OpenELIS Referral Task](StructureDefinition-openelis-referral-task.md) and [OpenELIS ServiceRequest](StructureDefinition-openelis-service-request.md)
* Examples for this Profile: [Practitioner/cc90c222-c1fa-5cb0-bb01-a2b35ac26244](Practitioner-cc90c222-c1fa-5cb0-bb01-a2b35ac26244.md)
* CapabilityStatements using this Profile: [OpenELIS Global FHIR REST server](CapabilityStatement-OpenELISFhirServer.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-openelis-practitioner.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-openelis-practitioner.csv), [Excel](../StructureDefinition-openelis-practitioner.xlsx), [Schematron](../StructureDefinition-openelis-practitioner.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "openelis-practitioner",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-practitioner",
  "version" : "0.2.0",
  "name" : "OpenELISPractitioner",
  "title" : "OpenELIS Practitioner",
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
  "description" : "A requesting provider as OpenELIS produces it (PractitionerTransformServiceImpl) and serves it from /fhir/Practitioner.",
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
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "servd",
    "uri" : "http://www.omg.org/spec/ServD/1.0/",
    "name" : "ServD"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Practitioner",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Practitioner",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Practitioner",
      "path" : "Practitioner",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Provider + Person (PractitionerTransformServiceImpl)"
      }]
    },
    {
      "id" : "Practitioner.id",
      "path" : "Practitioner.id",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Provider.fhirUuid (Provider.id when no UUID)"
      }]
    },
    {
      "id" : "Practitioner.identifier",
      "path" : "Practitioner.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "system"
        }],
        "description" : "Sliced by identifier system",
        "rules" : "open"
      },
      "mustSupport" : true
    },
    {
      "id" : "Practitioner.identifier:uuid",
      "path" : "Practitioner.identifier",
      "sliceName" : "uuid",
      "short" : "OpenELIS provider UUID",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Provider.fhirUuid"
      }]
    },
    {
      "id" : "Practitioner.identifier:uuid.system",
      "path" : "Practitioner.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/provider_uuid"
    },
    {
      "id" : "Practitioner.identifier:uuid.value",
      "path" : "Practitioner.identifier.value",
      "min" : 1
    },
    {
      "id" : "Practitioner.identifier:facility",
      "path" : "Practitioner.identifier",
      "sliceName" : "facility",
      "short" : "Identifier of the OpenELIS site that produced this resource",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Practitioner.identifier:facility.use",
      "path" : "Practitioner.identifier.use",
      "patternCode" : "official"
    },
    {
      "id" : "Practitioner.identifier:facility.system",
      "path" : "Practitioner.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/facility_id"
    },
    {
      "id" : "Practitioner.identifier:facility.value",
      "path" : "Practitioner.identifier.value",
      "min" : 1
    },
    {
      "id" : "Practitioner.identifier:facility.assigner",
      "path" : "Practitioner.identifier.assigner",
      "short" : "The site Organization",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-organization"]
      }]
    },
    {
      "id" : "Practitioner.active",
      "path" : "Practitioner.active",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Provider.active"
      }]
    },
    {
      "id" : "Practitioner.name",
      "path" : "Practitioner.name",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Practitioner.name.family",
      "path" : "Practitioner.name.family",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Person.lastName"
      }]
    },
    {
      "id" : "Practitioner.name.given",
      "path" : "Practitioner.name.given",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Person.firstName"
      }]
    },
    {
      "id" : "Practitioner.name.prefix",
      "path" : "Practitioner.name.prefix",
      "comment" : "The person's title code. Only the first prefix is kept on import.",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Person.titleCode"
      }]
    },
    {
      "id" : "Practitioner.telecom",
      "path" : "Practitioner.telecom",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Person.primaryPhone (use = mobile) / email / fax"
      }]
    },
    {
      "id" : "Practitioner.address",
      "path" : "Practitioner.address",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Person.streetAddress / city / state / zipCode / country"
      }]
    }]
  }
}

```
