# OpenELIS Organization - OpenELIS Global FHIR Implementation Guide v0.2.0

## Resource Profile: OpenELIS Organization 

 
An organization as OpenELIS produces it (OrganizationTransformServiceImpl) and serves it from /fhir/Organization: referring sites, reference labs, and the site's own facility Organization (FhirFacilityOrganizationServiceImpl). 

**Usages:**

* Refer to this Profile: [OpenELIS Analyzer Device](StructureDefinition-openelis-analyzer-device.md), [OpenELIS DiagnosticReport](StructureDefinition-openelis-diagnostic-report.md), [OpenELIS Observation](StructureDefinition-openelis-observation.md), [OpenELIS Organization](StructureDefinition-openelis-organization.md)... Show 6 more, [OpenELIS Patient](StructureDefinition-openelis-patient.md), [OpenELIS Practitioner](StructureDefinition-openelis-practitioner.md), [OpenELIS Referral Task](StructureDefinition-openelis-referral-task.md), [OpenELIS ServiceRequest](StructureDefinition-openelis-service-request.md), [OpenELIS Shipment Box](StructureDefinition-openelis-shipment-box.md) and [OpenELIS Specimen](StructureDefinition-openelis-specimen.md)
* Examples for this Profile: [National Reference Laboratory](Organization-32a104cd-6337-5d1b-b1a9-6849e98b2200.md), [Example District Hospital Laboratory](Organization-a845f2db-10e5-5117-ac75-553f615e301a.md) and [Riverside Health Centre](Organization-d3619aef-5abf-5b4f-a76c-06f378deca13.md)
* CapabilityStatements using this Profile: [OpenELIS Global FHIR REST server](CapabilityStatement-OpenELISFhirServer.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-openelis-organization.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-openelis-organization.csv), [Excel](../StructureDefinition-openelis-organization.xlsx), [Schematron](../StructureDefinition-openelis-organization.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "openelis-organization",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-organization",
  "version" : "0.2.0",
  "name" : "OpenELISOrganization",
  "title" : "OpenELIS Organization",
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
  "description" : "An organization as OpenELIS produces it (OrganizationTransformServiceImpl) and serves it from /fhir/Organization: referring sites, reference labs, and the site's own facility Organization (FhirFacilityOrganizationServiceImpl).",
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
  "type" : "Organization",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Organization",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Organization",
      "path" : "Organization",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Organization (OrganizationTransformServiceImpl)"
      }]
    },
    {
      "id" : "Organization.id",
      "path" : "Organization.id",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Organization.fhirUuid (Organization.id when no UUID)"
      }]
    },
    {
      "id" : "Organization.identifier",
      "path" : "Organization.identifier",
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
      "id" : "Organization.identifier:uuid",
      "path" : "Organization.identifier",
      "sliceName" : "uuid",
      "short" : "OpenELIS organization UUID",
      "comment" : "Currently only sent when the organization has a code (see Known Issues).",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Organization.fhirUuid"
      }]
    },
    {
      "id" : "Organization.identifier:uuid.system",
      "path" : "Organization.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/org_uuid"
    },
    {
      "id" : "Organization.identifier:uuid.value",
      "path" : "Organization.identifier.value",
      "min" : 1
    },
    {
      "id" : "Organization.identifier:code",
      "path" : "Organization.identifier",
      "sliceName" : "code",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Organization.code"
      }]
    },
    {
      "id" : "Organization.identifier:code.system",
      "path" : "Organization.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/org_code"
    },
    {
      "id" : "Organization.identifier:code.value",
      "path" : "Organization.identifier.value",
      "min" : 1
    },
    {
      "id" : "Organization.identifier:shortName",
      "path" : "Organization.identifier",
      "sliceName" : "shortName",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Organization.shortName"
      }]
    },
    {
      "id" : "Organization.identifier:shortName.system",
      "path" : "Organization.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/org_shortName"
    },
    {
      "id" : "Organization.identifier:shortName.value",
      "path" : "Organization.identifier.value",
      "min" : 1
    },
    {
      "id" : "Organization.identifier:cliaNum",
      "path" : "Organization.identifier",
      "sliceName" : "cliaNum",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Organization.cliaNum"
      }]
    },
    {
      "id" : "Organization.identifier:cliaNum.system",
      "path" : "Organization.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/org_cliaNum"
    },
    {
      "id" : "Organization.identifier:cliaNum.value",
      "path" : "Organization.identifier.value",
      "min" : 1
    },
    {
      "id" : "Organization.identifier:facility",
      "path" : "Organization.identifier",
      "sliceName" : "facility",
      "short" : "Identifier of the OpenELIS site that produced this resource",
      "comment" : "The site's own facility Organization is pushed to the FHIR store at start-up with only this identifier (no assigner). Served from /fhir/Organization, the same organization also carries org_shortName = FACILITY_ORG.",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Organization.identifier:facility.use",
      "path" : "Organization.identifier.use",
      "patternCode" : "official"
    },
    {
      "id" : "Organization.identifier:facility.system",
      "path" : "Organization.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/facility_id"
    },
    {
      "id" : "Organization.identifier:facility.value",
      "path" : "Organization.identifier.value",
      "min" : 1
    },
    {
      "id" : "Organization.identifier:facility.assigner",
      "path" : "Organization.identifier.assigner",
      "short" : "The site Organization",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-organization"]
      }]
    },
    {
      "id" : "Organization.active",
      "path" : "Organization.active",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Organization.isActive (Y / N)"
      }]
    },
    {
      "id" : "Organization.type",
      "path" : "Organization.type",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Organization.organizationTypes (name / description)"
      }]
    },
    {
      "id" : "Organization.type.coding",
      "path" : "Organization.type.coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "system"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "Organization.type.coding:oeType",
      "path" : "Organization.type.coding",
      "sliceName" : "oeType",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Organization.type.coding:oeType.system",
      "path" : "Organization.type.coding.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/orgType"
    },
    {
      "id" : "Organization.type.coding:oeType.code",
      "path" : "Organization.type.coding.code",
      "min" : 1
    },
    {
      "id" : "Organization.name",
      "path" : "Organization.name",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Organization.organizationName"
      }]
    },
    {
      "id" : "Organization.address",
      "path" : "Organization.address",
      "comment" : "Legacy column limits apply on create and update: line 30, city 30, state 2, postalCode 10 characters. Longer values are rejected with 422.",
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Organization.address.line",
      "path" : "Organization.address.line",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Organization.streetAddress"
      }]
    },
    {
      "id" : "Organization.address.city",
      "path" : "Organization.address.city",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Organization.city"
      }]
    },
    {
      "id" : "Organization.address.state",
      "path" : "Organization.address.state",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Organization.state"
      }]
    },
    {
      "id" : "Organization.address.postalCode",
      "path" : "Organization.address.postalCode",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Organization.zipCode"
      }]
    },
    {
      "id" : "Organization.partOf",
      "path" : "Organization.partOf",
      "type" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-hierarchy",
          "valueBoolean" : true
        }],
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-organization"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Organization.organization (parent)"
      }]
    }]
  }
}

```
