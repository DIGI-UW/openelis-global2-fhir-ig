# OpenELIS Global FHIR REST server - OpenELIS Global FHIR Implementation Guide v0.2.0

## CapabilityStatement: OpenELIS Global FHIR REST server 

 
The FHIR R4 REST API OpenELIS Global serves at {server}/api/OpenELIS-Global/fhir. It reads from and writes to the OpenELIS database directly. It is not the co-resident HAPI FHIR store. See api.html. 

 [Raw OpenAPI-Swagger Definition file](../OpenELISFhirServer.openapi.json) | [Download](../OpenELISFhirServer.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "OpenELISFhirServer",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/CapabilityStatement/OpenELISFhirServer",
  "version" : "0.2.0",
  "name" : "OpenELISFhirServer",
  "title" : "OpenELIS Global FHIR REST server",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-09-29",
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
  "description" : "The FHIR R4 REST API OpenELIS Global serves at {server}/api/OpenELIS-Global/fhir. It reads from and writes to the OpenELIS database directly. It is not the co-resident HAPI FHIR store. See api.html.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "001",
      "display" : "World"
    }]
  }],
  "kind" : "capability",
  "software" : {
    "name" : "OpenELIS Global",
    "version" : "3.x (develop, 2026-09-29)"
  },
  "fhirVersion" : "4.0.1",
  "format" : ["json", "xml"],
  "implementationGuide" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/ImplementationGuide/org.openelisglobal.fhir"],
  "rest" : [{
    "mode" : "server",
    "documentation" : "Base URL: https://{host}/api/OpenELIS-Global/fhir (through the bundled nginx proxy) or https://{host}:8443/api/OpenELIS-Global/fhir (direct to Tomcat). Resource ids are OpenELIS FHIR UUIDs. Every search supports _count and _offset paging (default page size 20) and returns Bundle.total. _sort is accepted but ignored: results come back in database insertion order. String parameters match case-insensitive starts-with and support :exact and :contains. delete is a soft delete (cancel or deactivate): a later read still returns the resource. vread, history, patch, conditional operations, batch / transaction and operations are not supported.",
    "security" : {
      "cors" : false,
      "description" : "TLS is required. Send HTTP Basic credentials of an OpenELIS user account (Authorization: Basic), or use an authenticated OpenELIS browser session. Where the site enables them, OpenELIS also accepts client certificate and OAuth2 / OIDC login. Requests without credentials are redirected to the login page, including /metadata."
    },
    "resource" : [{
      "type" : "Patient",
      "profile" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-patient",
      "documentation" : "Delete does not change the patient in OpenELIS: it only marks the FHIR store copy active = false (see Known Issues). The id returned by create is the database id, not the FHIR UUID.",
      "interaction" : [{
        "code" : "read"
      },
      {
        "code" : "create"
      },
      {
        "code" : "update"
      },
      {
        "code" : "delete"
      },
      {
        "code" : "search-type"
      }],
      "versioning" : "no-version",
      "readHistory" : false,
      "updateCreate" : false,
      "conditionalCreate" : false,
      "conditionalUpdate" : false,
      "conditionalDelete" : "not-supported",
      "searchRevInclude" : ["ServiceRequest:patient",
      "ServiceRequest:subject",
      "Specimen:patient",
      "Specimen:subject",
      "Observation:patient",
      "Observation:subject",
      "DiagnosticReport:patient",
      "DiagnosticReport:subject"],
      "searchParam" : [{
        "name" : "_id",
        "type" : "token"
      },
      {
        "name" : "identifier",
        "type" : "token"
      },
      {
        "name" : "_lastUpdated",
        "type" : "date"
      },
      {
        "name" : "name",
        "type" : "string"
      },
      {
        "name" : "given",
        "type" : "string"
      },
      {
        "name" : "family",
        "type" : "string"
      },
      {
        "name" : "birthdate",
        "type" : "date"
      },
      {
        "name" : "gender",
        "type" : "token"
      }]
    },
    {
      "type" : "ServiceRequest",
      "profile" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-service-request",
      "documentation" : "Backed by the OpenELIS Analysis (one per ordered test). create requires subject (an existing Patient), code and specimen (an existing Specimen, which supplies the lab number and sample item). Delete cancels the Analysis and returns 204.",
      "interaction" : [{
        "code" : "read"
      },
      {
        "code" : "create"
      },
      {
        "code" : "update"
      },
      {
        "code" : "delete"
      },
      {
        "code" : "search-type"
      }],
      "versioning" : "no-version",
      "readHistory" : false,
      "conditionalDelete" : "not-supported",
      "searchInclude" : ["ServiceRequest:patient",
      "ServiceRequest:subject",
      "ServiceRequest:requester",
      "ServiceRequest:specimen"],
      "searchRevInclude" : ["Observation:based-on", "DiagnosticReport:based-on"],
      "searchParam" : [{
        "name" : "_id",
        "type" : "token"
      },
      {
        "name" : "identifier",
        "type" : "token"
      },
      {
        "name" : "_lastUpdated",
        "type" : "date"
      },
      {
        "name" : "patient",
        "type" : "reference"
      },
      {
        "name" : "subject",
        "type" : "reference"
      },
      {
        "name" : "requester",
        "type" : "reference"
      },
      {
        "name" : "specimen",
        "type" : "reference"
      },
      {
        "name" : "code",
        "type" : "token"
      },
      {
        "name" : "status",
        "type" : "token"
      }]
    },
    {
      "type" : "DiagnosticReport",
      "profile" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-diagnostic-report",
      "documentation" : "A read-only view of the OpenELIS Analysis. Its id equals the ServiceRequest id for the same test. Delete cancels the Analysis.",
      "interaction" : [{
        "code" : "read"
      },
      {
        "code" : "delete"
      },
      {
        "code" : "search-type"
      }],
      "versioning" : "no-version",
      "readHistory" : false,
      "conditionalDelete" : "not-supported",
      "searchInclude" : ["DiagnosticReport:patient",
      "DiagnosticReport:subject",
      "DiagnosticReport:based-on",
      "DiagnosticReport:result",
      "DiagnosticReport:specimen"],
      "searchParam" : [{
        "name" : "_id",
        "type" : "token"
      },
      {
        "name" : "identifier",
        "type" : "token"
      },
      {
        "name" : "_lastUpdated",
        "type" : "date"
      },
      {
        "name" : "patient",
        "type" : "reference"
      },
      {
        "name" : "subject",
        "type" : "reference"
      },
      {
        "name" : "based-on",
        "type" : "reference"
      },
      {
        "name" : "result",
        "type" : "reference"
      },
      {
        "name" : "specimen",
        "type" : "reference"
      },
      {
        "name" : "code",
        "type" : "token"
      },
      {
        "name" : "status",
        "type" : "token"
      },
      {
        "name" : "issued",
        "type" : "date"
      }]
    },
    {
      "type" : "Observation",
      "profile" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-observation",
      "documentation" : "Backed by the OpenELIS Result.",
      "interaction" : [{
        "code" : "read"
      },
      {
        "code" : "create"
      },
      {
        "code" : "update"
      },
      {
        "code" : "delete"
      },
      {
        "code" : "search-type"
      }],
      "versioning" : "no-version",
      "readHistory" : false,
      "conditionalDelete" : "not-supported",
      "searchInclude" : ["Observation:patient",
      "Observation:subject",
      "Observation:based-on",
      "Observation:specimen",
      "Observation:performer"],
      "searchRevInclude" : ["DiagnosticReport:result"],
      "searchParam" : [{
        "name" : "_id",
        "type" : "token"
      },
      {
        "name" : "identifier",
        "type" : "token"
      },
      {
        "name" : "_lastUpdated",
        "type" : "date"
      },
      {
        "name" : "patient",
        "type" : "reference"
      },
      {
        "name" : "subject",
        "type" : "reference"
      },
      {
        "name" : "based-on",
        "type" : "reference"
      },
      {
        "name" : "specimen",
        "type" : "reference"
      },
      {
        "name" : "code",
        "type" : "token"
      },
      {
        "name" : "status",
        "type" : "token"
      },
      {
        "name" : "date",
        "type" : "date"
      }]
    },
    {
      "type" : "Specimen",
      "profile" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-specimen",
      "documentation" : "Backed by the OpenELIS SampleItem. On update a body id that differs from the URL id returns 400. Delete cancels (rejects) the sample item.",
      "interaction" : [{
        "code" : "read"
      },
      {
        "code" : "create"
      },
      {
        "code" : "update"
      },
      {
        "code" : "delete"
      },
      {
        "code" : "search-type"
      }],
      "versioning" : "no-version",
      "readHistory" : false,
      "conditionalDelete" : "not-supported",
      "searchInclude" : ["Specimen:patient", "Specimen:subject"],
      "searchRevInclude" : ["ServiceRequest:specimen",
      "Observation:specimen",
      "DiagnosticReport:specimen"],
      "searchParam" : [{
        "name" : "_id",
        "type" : "token"
      },
      {
        "name" : "identifier",
        "type" : "token"
      },
      {
        "name" : "_lastUpdated",
        "type" : "date"
      },
      {
        "name" : "accession",
        "type" : "token"
      },
      {
        "name" : "patient",
        "type" : "reference"
      },
      {
        "name" : "subject",
        "type" : "reference"
      },
      {
        "name" : "type",
        "type" : "token"
      },
      {
        "name" : "status",
        "type" : "token"
      },
      {
        "name" : "collected",
        "type" : "date"
      }]
    },
    {
      "type" : "Practitioner",
      "profile" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-practitioner",
      "documentation" : "Backed by the OpenELIS Provider. update changes name and telecom only. Delete sets active = false.",
      "interaction" : [{
        "code" : "read"
      },
      {
        "code" : "create"
      },
      {
        "code" : "update"
      },
      {
        "code" : "delete"
      },
      {
        "code" : "search-type"
      }],
      "versioning" : "no-version",
      "readHistory" : false,
      "conditionalDelete" : "not-supported",
      "searchRevInclude" : ["ServiceRequest:requester", "Observation:performer"],
      "searchParam" : [{
        "name" : "_id",
        "type" : "token"
      },
      {
        "name" : "identifier",
        "type" : "token"
      },
      {
        "name" : "_lastUpdated",
        "type" : "date"
      },
      {
        "name" : "name",
        "type" : "string"
      },
      {
        "name" : "given",
        "type" : "string"
      },
      {
        "name" : "family",
        "type" : "string"
      },
      {
        "name" : "address-city",
        "type" : "string"
      },
      {
        "name" : "address-state",
        "type" : "string"
      },
      {
        "name" : "address-postalcode",
        "type" : "string"
      },
      {
        "name" : "address-country",
        "type" : "string"
      },
      {
        "name" : "telecom",
        "type" : "token"
      },
      {
        "name" : "email",
        "type" : "token"
      },
      {
        "name" : "phone",
        "type" : "token"
      }]
    },
    {
      "type" : "Organization",
      "profile" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-organization",
      "documentation" : "update changes name, active and partOf only. Delete sets the organization inactive.",
      "interaction" : [{
        "code" : "read"
      },
      {
        "code" : "create"
      },
      {
        "code" : "update"
      },
      {
        "code" : "delete"
      },
      {
        "code" : "search-type"
      }],
      "versioning" : "no-version",
      "readHistory" : false,
      "conditionalDelete" : "not-supported",
      "searchInclude" : ["Organization:partof"],
      "searchRevInclude" : ["Organization:partof"],
      "searchParam" : [{
        "name" : "_id",
        "type" : "token"
      },
      {
        "name" : "identifier",
        "type" : "token"
      },
      {
        "name" : "_lastUpdated",
        "type" : "date"
      },
      {
        "name" : "name",
        "type" : "string"
      },
      {
        "name" : "active",
        "type" : "token"
      },
      {
        "name" : "type",
        "type" : "token"
      },
      {
        "name" : "partof",
        "type" : "reference"
      },
      {
        "name" : "address-city",
        "type" : "string"
      },
      {
        "name" : "address-state",
        "type" : "string"
      }]
    },
    {
      "type" : "Location",
      "profile" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-storage-location",
      "documentation" : "The sample storage hierarchy (room / device / shelf / rack / box). The level comes from meta.tag (system http://openelis.org/fhir/tag/storage-hierarchy), falling back to physicalType.text. partOf is required except for rooms. On create the client id is ignored. On update a body id that differs from the URL id returns 400. Delete deactivates.",
      "interaction" : [{
        "code" : "read"
      },
      {
        "code" : "create"
      },
      {
        "code" : "update"
      },
      {
        "code" : "delete"
      },
      {
        "code" : "search-type"
      }],
      "versioning" : "no-version",
      "readHistory" : false,
      "conditionalDelete" : "not-supported",
      "searchInclude" : ["Location:partof"],
      "searchRevInclude" : ["Location:partof"],
      "searchParam" : [{
        "name" : "_id",
        "type" : "token"
      },
      {
        "name" : "identifier",
        "type" : "token"
      },
      {
        "name" : "_lastUpdated",
        "type" : "date"
      },
      {
        "name" : "name",
        "type" : "string"
      },
      {
        "name" : "status",
        "type" : "token"
      },
      {
        "name" : "partof",
        "type" : "reference"
      },
      {
        "name" : "_tag",
        "type" : "token",
        "documentation" : "Storage level: http://openelis.org/fhir/tag/storage-hierarchy|room / device / shelf / rack / box"
      }]
    },
    {
      "type" : "Device",
      "profile" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-analyzer-device",
      "documentation" : "Backed by the OpenELIS Analyzer. On create the client id is ignored. Delete sets the analyzer inactive.",
      "interaction" : [{
        "code" : "read"
      },
      {
        "code" : "create"
      },
      {
        "code" : "update"
      },
      {
        "code" : "delete"
      },
      {
        "code" : "search-type"
      }],
      "versioning" : "no-version",
      "readHistory" : false,
      "conditionalDelete" : "not-supported",
      "searchParam" : [{
        "name" : "_id",
        "type" : "token"
      },
      {
        "name" : "identifier",
        "type" : "token"
      },
      {
        "name" : "_lastUpdated",
        "type" : "date"
      },
      {
        "name" : "device-name",
        "type" : "string"
      },
      {
        "name" : "type",
        "type" : "token"
      },
      {
        "name" : "status",
        "type" : "token"
      }]
    }]
  }]
}

```
