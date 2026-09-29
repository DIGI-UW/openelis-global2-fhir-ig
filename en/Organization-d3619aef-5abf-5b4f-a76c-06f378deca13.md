# Referring site: Riverside Health Centre - OpenELIS Global FHIR Implementation Guide v0.2.0

## Example Organization: Referring site: Riverside Health Centre

Profile: [OpenELIS Organization](StructureDefinition-openelis-organization.md)

**identifier**: [OEOrganizationCode](NamingSystem-oe-ns-org-code.md)/RHC01, [OEOrganizationShortName](NamingSystem-oe-ns-org-shortname.md)/Riverside HC, [OEOrganizationUUID](NamingSystem-oe-ns-org-uuid.md)/d3619aef-5abf-5b4f-a76c-06f378deca13, [OEFacilityId](NamingSystem-oe-ns-facility-id.md)/EDH-LAB

**active**: true

**type**: Referring clinic

**name**: Riverside Health Centre

**address**: 12 Market Road Riverside 



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "d3619aef-5abf-5b4f-a76c-06f378deca13",
  "meta" : {
    "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-organization"]
  },
  "identifier" : [{
    "system" : "http://openelis-global.org/org_code",
    "value" : "RHC01"
  },
  {
    "system" : "http://openelis-global.org/org_shortName",
    "value" : "Riverside HC"
  },
  {
    "system" : "http://openelis-global.org/org_uuid",
    "value" : "d3619aef-5abf-5b4f-a76c-06f378deca13"
  },
  {
    "system" : "http://openelis-global.org/facility_id",
    "value" : "EDH-LAB",
    "assigner" : {
      "reference" : "Organization/a845f2db-10e5-5117-ac75-553f615e301a"
    }
  }],
  "active" : true,
  "type" : [{
    "coding" : [{
      "system" : "http://openelis-global.org/orgType",
      "code" : "referringClinic"
    }],
    "text" : "Referring clinic"
  }],
  "name" : "Riverside Health Centre",
  "address" : [{
    "line" : ["12 Market Road"],
    "city" : "Riverside"
  }]
}

```
