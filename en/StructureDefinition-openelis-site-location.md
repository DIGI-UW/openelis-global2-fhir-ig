# OpenELIS Site Location - OpenELIS Global FHIR Implementation Guide v0.2.1

## Resource Profile: OpenELIS Site Location 

**Usages:**

* Refer to this Profile: [OpenELIS ServiceRequest](StructureDefinition-openelis-service-request.md)
* Examples for this Profile: [Riverside Health Centre](Location-d3619aef-5abf-5b4f-a76c-06f378deca13.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-openelis-site-location.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-openelis-site-location.csv), [Excel](../StructureDefinition-openelis-site-location.xlsx), [Schematron](../StructureDefinition-openelis-site-location.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "openelis-site-location",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-site-location",
  "version" : "0.2.1",
  "name" : "OpenELISSiteLocation",
  "title" : "OpenELIS Site Location",
  "status" : "draft",
  "date" : "2026-10-12T15:22:52+00:00",
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
  "description" : "The place an OpenELIS organization stands for (OrganizationTransformServiceImpl.transformToFhirLocation). It has the same id as the Organization. ServiceRequest.locationReference points at the referring site and department this way, and the subject of an order without a patient points at its sampling site. OpenELIS writes these Locations to the FHIR store together with the ServiceRequests that reference them and whenever the organization is saved, and serves them from /fhir/Location/{id} (read only).",
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
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Location",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Location",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Location",
      "path" : "Location",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Organization (OrganizationTransformServiceImpl.transformToFhirLocation)"
      }]
    },
    {
      "id" : "Location.id",
      "path" : "Location.id",
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Organization.fhirUuid"
      }]
    },
    {
      "id" : "Location.status",
      "path" : "Location.status",
      "comment" : "inactive when the organization is inactive, otherwise active.",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Organization.isActive (Y / N)"
      }]
    },
    {
      "id" : "Location.name",
      "path" : "Location.name",
      "min" : 1,
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Organization.organizationName"
      }]
    },
    {
      "id" : "Location.mode",
      "path" : "Location.mode",
      "min" : 1,
      "patternCode" : "instance",
      "mustSupport" : true
    },
    {
      "id" : "Location.physicalType",
      "path" : "Location.physicalType",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Location.physicalType.coding",
      "path" : "Location.physicalType.coding",
      "min" : 1,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
        "code" : "si",
        "display" : "Site"
      }
    },
    {
      "id" : "Location.managingOrganization",
      "path" : "Location.managingOrganization",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-organization"]
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "oe-data-model",
        "map" : "Organization.fhirUuid"
      }]
    }]
  }
}

```
