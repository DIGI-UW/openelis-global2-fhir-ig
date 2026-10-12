# Site Location: Riverside Health Centre - OpenELIS Global FHIR Implementation Guide v0.2.1

## Example Location: Site Location: Riverside Health Centre

Profile: [OpenELIS Site Location](StructureDefinition-openelis-site-location.md)

Riverside Health Centre

-------

| | | | |
| :--- | :--- | :--- | :--- |
| Status: | Active | Mode: | Instance |
| Form: | Site | | |
| Managed By: | [Riverside Health Centre (Referring clinic) (http://openelis-global.org/org_code#OEOrganizationCode#RHC01)](Organization-d3619aef-5abf-5b4f-a76c-06f378deca13.md) | | |



## Resource Content

```json
{
  "resourceType" : "Location",
  "id" : "d3619aef-5abf-5b4f-a76c-06f378deca13",
  "meta" : {
    "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-site-location"]
  },
  "status" : "active",
  "name" : "Riverside Health Centre",
  "mode" : "instance",
  "physicalType" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/location-physical-type",
      "code" : "si",
      "display" : "Site"
    }]
  },
  "managingOrganization" : {
    "reference" : "Organization/d3619aef-5abf-5b4f-a76c-06f378deca13"
  }
}

```
