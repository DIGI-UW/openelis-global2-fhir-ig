# Requesting provider - OpenELIS Global FHIR Implementation Guide v0.2.0

## Example Practitioner: Requesting provider

Profile: [OpenELIS Practitioner](StructureDefinition-openelis-practitioner.md)

**identifier**: [OEProviderUUID](NamingSystem-oe-ns-provider-uuid.md)/cc90c222-c1fa-5cb0-bb01-a2b35ac26244 (use: usual, ), [OEFacilityId](NamingSystem-oe-ns-facility-id.md)/EDH-LAB (use: official, )

**active**: true

**name**: Kofi Mensah 

**telecom**: [+000 555 0101](tel:+0005550101)



## Resource Content

```json
{
  "resourceType" : "Practitioner",
  "id" : "cc90c222-c1fa-5cb0-bb01-a2b35ac26244",
  "meta" : {
    "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-practitioner"]
  },
  "identifier" : [{
    "use" : "usual",
    "system" : "http://openelis-global.org/provider_uuid",
    "value" : "cc90c222-c1fa-5cb0-bb01-a2b35ac26244"
  },
  {
    "use" : "official",
    "system" : "http://openelis-global.org/facility_id",
    "value" : "EDH-LAB",
    "assigner" : {
      "reference" : "Organization/a845f2db-10e5-5117-ac75-553f615e301a"
    }
  }],
  "active" : true,
  "name" : [{
    "family" : "Mensah",
    "given" : ["Kofi"],
    "prefix" : ["Dr"]
  }],
  "telecom" : [{
    "system" : "phone",
    "value" : "+000 555 0101",
    "use" : "mobile"
  }]
}

```
