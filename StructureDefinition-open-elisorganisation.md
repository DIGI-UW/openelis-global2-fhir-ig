# OpenELIS Organization - OpenELIS GLOBAL2 Implementation Guide v0.1.0



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "open-elisorganisation",
  "url" : "http://digi-uw.github.io/openelis-global-ig/StructureDefinition/open-elisorganisation",
  "version" : "0.1.0",
  "name" : "OpenELISOrganisation",
  "title" : "OpenELIS Organization",
  "status" : "draft",
  "date" : "2026-05-11T11:15:58+00:00",
  "description" : "A Organization Resource used for FHIR Exchange",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "open-elis-organization-mapping",
    "uri" : "Organization",
    "name" : "OpenELIS Vs FHIR",
    "comment" : "Organisation Mapping shows how attributes of FHIR Organisation Resource maps to and from the attributes of OpenElis Organisation Object."
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
        "identity" : "open-elis-organization-mapping",
        "map" : "OE Patient",
        "comment" : "This profile maps FHIR Organisation Resource to OE DataExchange."
      }]
    },
    {
      "id" : "Organization.id",
      "path" : "Organization.id",
      "mapping" : [{
        "identity" : "open-elis-organization-mapping",
        "map" : "Organisation.fhirUuid"
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
        "rules" : "open"
      },
      "min" : 4
    },
    {
      "id" : "Organization.identifier.value",
      "path" : "Organization.identifier.value",
      "mapping" : [{
        "identity" : "open-elis-organization-mapping",
        "map" : "Organization.shortName"
      },
      {
        "identity" : "open-elis-organization-mapping",
        "map" : "Organization.cliaNum"
      },
      {
        "identity" : "open-elis-organization-mapping",
        "map" : "Organization.code"
      }]
    },
    {
      "id" : "Organization.identifier:cliaNum",
      "path" : "Organization.identifier",
      "sliceName" : "cliaNum",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Organization.identifier:cliaNum.system",
      "path" : "Organization.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/org_cliaNum"
    },
    {
      "id" : "Organization.identifier:shortName",
      "path" : "Organization.identifier",
      "sliceName" : "shortName",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Organization.identifier:shortName.system",
      "path" : "Organization.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/org_shortName"
    },
    {
      "id" : "Organization.identifier:code",
      "path" : "Organization.identifier",
      "sliceName" : "code",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Organization.identifier:code.system",
      "path" : "Organization.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/org_code"
    },
    {
      "id" : "Organization.identifier:uuid",
      "path" : "Organization.identifier",
      "sliceName" : "uuid",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Organization.identifier:uuid.system",
      "path" : "Organization.identifier.system",
      "min" : 1,
      "patternUri" : "http://openelis-global.org/org_uuid"
    },
    {
      "id" : "Organization.type",
      "path" : "Organization.type",
      "min" : 1,
      "mapping" : [{
        "identity" : "open-elis-organization-mapping",
        "map" : "Organization.organizationTypes.name"
      }]
    },
    {
      "id" : "Organization.name",
      "path" : "Organization.name",
      "min" : 1,
      "mapping" : [{
        "identity" : "open-elis-organization-mapping",
        "map" : "Organization.organizationName"
      }]
    },
    {
      "id" : "Organization.address",
      "path" : "Organization.address",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Organization.address.line",
      "path" : "Organization.address.line",
      "mapping" : [{
        "identity" : "open-elis-organization-mapping",
        "map" : "Organization.streetAddress"
      }]
    },
    {
      "id" : "Organization.address.city",
      "path" : "Organization.address.city",
      "mapping" : [{
        "identity" : "open-elis-organization-mapping",
        "map" : "Organization.city"
      }]
    },
    {
      "id" : "Organization.address.state",
      "path" : "Organization.address.state",
      "mapping" : [{
        "identity" : "open-elis-organization-mapping",
        "map" : "Organization.state"
      }]
    },
    {
      "id" : "Organization.address.postalCode",
      "path" : "Organization.address.postalCode",
      "mapping" : [{
        "identity" : "open-elis-organization-mapping",
        "map" : "Organization.zipCode"
      }]
    }]
  }
}

```
