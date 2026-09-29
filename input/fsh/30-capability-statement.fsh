// What OpenELIS's own FHIR REST server (/fhir) supports, from the resource
// providers in org.openelisglobal.fhir.providers (develop, 2026-09-29).

RuleSet: CommonSearchParams
* searchParam[+].name = "_id"
* searchParam[=].type = #token
* searchParam[+].name = "identifier"
* searchParam[=].type = #token
* searchParam[+].name = "_lastUpdated"
* searchParam[=].type = #date

RuleSet: CrudInteractions
* interaction[+].code = #read
* interaction[+].code = #create
* interaction[+].code = #update
* interaction[+].code = #delete
* interaction[+].code = #search-type

RuleSet: SP(name, type, doc)
* searchParam[+].name = "{name}"
* searchParam[=].type = #{type}
* searchParam[=].documentation = "{doc}"

RuleSet: SPplain(name, type)
* searchParam[+].name = "{name}"
* searchParam[=].type = #{type}

Instance: OpenELISFhirServer
InstanceOf: CapabilityStatement
Usage: #definition
Title: "OpenELIS Global FHIR REST server"
Description: "The FHIR R4 REST API OpenELIS Global serves at {server}/api/OpenELIS-Global/fhir. It reads from and writes to the OpenELIS database directly. It is not the co-resident HAPI FHIR store. See api.html."
* name = "OpenELISFhirServer"
* title = "OpenELIS Global FHIR REST server"
* status = #active
* experimental = false
* date = "2026-09-29"
* publisher = "OpenELIS Global"
* kind = #capability
* software.name = "OpenELIS Global"
* software.version = "3.x (develop, 2026-09-29)"
* fhirVersion = #4.0.1
* format[0] = #json
* format[1] = #xml
* implementationGuide = "https://digi-uw.github.io/openelis-global2-fhir-ig/ImplementationGuide/org.openelisglobal.fhir"
* rest.mode = #server
* rest.documentation = "Base URL: https://{host}/api/OpenELIS-Global/fhir (through the bundled nginx proxy) or https://{host}:8443/api/OpenELIS-Global/fhir (direct to Tomcat). Resource ids are OpenELIS FHIR UUIDs. Every search supports _count and _offset paging (default page size 20) and returns Bundle.total. _sort is accepted but ignored: results come back in database insertion order. String parameters match case-insensitive starts-with and support :exact and :contains. delete is a soft delete (cancel or deactivate): a later read still returns the resource. vread, history, patch, conditional operations, batch / transaction and operations are not supported."
* rest.security.cors = false
* rest.security.description = "TLS is required. Send HTTP Basic credentials of an OpenELIS user account (Authorization: Basic), or use an authenticated OpenELIS browser session. Where the site enables them, OpenELIS also accepts client certificate and OAuth2 / OIDC login. Requests without credentials are redirected to the login page, including /metadata."

// --- Patient ---
* rest.resource[+].type = #Patient
* rest.resource[=].profile = Canonical(OpenELISPatient)
* rest.resource[=].documentation = "Delete does not change the patient in OpenELIS: it only marks the FHIR store copy active = false (see Known Issues). The id returned by create is the database id, not the FHIR UUID."
* rest.resource[=].versioning = #no-version
* rest.resource[=].readHistory = false
* rest.resource[=].updateCreate = false
* rest.resource[=].conditionalCreate = false
* rest.resource[=].conditionalUpdate = false
* rest.resource[=].conditionalDelete = #not-supported
* rest.resource[=] insert CrudInteractions
* rest.resource[=].searchRevInclude[0] = "ServiceRequest:patient"
* rest.resource[=].searchRevInclude[1] = "ServiceRequest:subject"
* rest.resource[=].searchRevInclude[2] = "Specimen:patient"
* rest.resource[=].searchRevInclude[3] = "Specimen:subject"
* rest.resource[=].searchRevInclude[4] = "Observation:patient"
* rest.resource[=].searchRevInclude[5] = "Observation:subject"
* rest.resource[=].searchRevInclude[6] = "DiagnosticReport:patient"
* rest.resource[=].searchRevInclude[7] = "DiagnosticReport:subject"
* rest.resource[=] insert CommonSearchParams
* rest.resource[=] insert SPplain(name, string)
* rest.resource[=] insert SPplain(given, string)
* rest.resource[=] insert SPplain(family, string)
* rest.resource[=] insert SPplain(birthdate, date)
* rest.resource[=] insert SPplain(gender, token)

// --- ServiceRequest ---
* rest.resource[+].type = #ServiceRequest
* rest.resource[=].profile = Canonical(OpenELISServiceRequest)
* rest.resource[=].documentation = "Backed by the OpenELIS Analysis (one per ordered test). create requires subject (an existing Patient), code and specimen (an existing Specimen, which supplies the lab number and sample item). Delete cancels the Analysis and returns 204."
* rest.resource[=].versioning = #no-version
* rest.resource[=].readHistory = false
* rest.resource[=].conditionalDelete = #not-supported
* rest.resource[=] insert CrudInteractions
* rest.resource[=].searchInclude[0] = "ServiceRequest:patient"
* rest.resource[=].searchInclude[1] = "ServiceRequest:subject"
* rest.resource[=].searchInclude[2] = "ServiceRequest:requester"
* rest.resource[=].searchInclude[3] = "ServiceRequest:specimen"
* rest.resource[=].searchRevInclude[0] = "Observation:based-on"
* rest.resource[=].searchRevInclude[1] = "DiagnosticReport:based-on"
* rest.resource[=] insert CommonSearchParams
* rest.resource[=] insert SPplain(patient, reference)
* rest.resource[=] insert SPplain(subject, reference)
* rest.resource[=] insert SPplain(requester, reference)
* rest.resource[=] insert SPplain(specimen, reference)
* rest.resource[=] insert SPplain(code, token)
* rest.resource[=] insert SPplain(status, token)

// --- DiagnosticReport ---
* rest.resource[+].type = #DiagnosticReport
* rest.resource[=].profile = Canonical(OpenELISDiagnosticReport)
* rest.resource[=].documentation = "A read-only view of the OpenELIS Analysis. Its id equals the ServiceRequest id for the same test. Delete cancels the Analysis."
* rest.resource[=].versioning = #no-version
* rest.resource[=].readHistory = false
* rest.resource[=].conditionalDelete = #not-supported
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[+].code = #delete
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].searchInclude[0] = "DiagnosticReport:patient"
* rest.resource[=].searchInclude[1] = "DiagnosticReport:subject"
* rest.resource[=].searchInclude[2] = "DiagnosticReport:based-on"
* rest.resource[=].searchInclude[3] = "DiagnosticReport:result"
* rest.resource[=].searchInclude[4] = "DiagnosticReport:specimen"
* rest.resource[=] insert CommonSearchParams
* rest.resource[=] insert SPplain(patient, reference)
* rest.resource[=] insert SPplain(subject, reference)
* rest.resource[=] insert SPplain(based-on, reference)
* rest.resource[=] insert SPplain(result, reference)
* rest.resource[=] insert SPplain(specimen, reference)
* rest.resource[=] insert SPplain(code, token)
* rest.resource[=] insert SPplain(status, token)
* rest.resource[=] insert SPplain(issued, date)

// --- Observation ---
* rest.resource[+].type = #Observation
* rest.resource[=].profile = Canonical(OpenELISObservation)
* rest.resource[=].documentation = "Backed by the OpenELIS Result."
* rest.resource[=].versioning = #no-version
* rest.resource[=].readHistory = false
* rest.resource[=].conditionalDelete = #not-supported
* rest.resource[=] insert CrudInteractions
* rest.resource[=].searchInclude[0] = "Observation:patient"
* rest.resource[=].searchInclude[1] = "Observation:subject"
* rest.resource[=].searchInclude[2] = "Observation:based-on"
* rest.resource[=].searchInclude[3] = "Observation:specimen"
* rest.resource[=].searchInclude[4] = "Observation:performer"
* rest.resource[=].searchRevInclude[0] = "DiagnosticReport:result"
* rest.resource[=] insert CommonSearchParams
* rest.resource[=] insert SPplain(patient, reference)
* rest.resource[=] insert SPplain(subject, reference)
* rest.resource[=] insert SPplain(based-on, reference)
* rest.resource[=] insert SPplain(specimen, reference)
* rest.resource[=] insert SPplain(code, token)
* rest.resource[=] insert SPplain(status, token)
* rest.resource[=] insert SPplain(date, date)

// --- Specimen ---
* rest.resource[+].type = #Specimen
* rest.resource[=].profile = Canonical(OpenELISSpecimen)
* rest.resource[=].documentation = "Backed by the OpenELIS SampleItem. On update a body id that differs from the URL id returns 400. Delete cancels (rejects) the sample item."
* rest.resource[=].versioning = #no-version
* rest.resource[=].readHistory = false
* rest.resource[=].conditionalDelete = #not-supported
* rest.resource[=] insert CrudInteractions
* rest.resource[=].searchInclude[0] = "Specimen:patient"
* rest.resource[=].searchInclude[1] = "Specimen:subject"
* rest.resource[=].searchRevInclude[0] = "ServiceRequest:specimen"
* rest.resource[=].searchRevInclude[1] = "Observation:specimen"
* rest.resource[=].searchRevInclude[2] = "DiagnosticReport:specimen"
* rest.resource[=] insert CommonSearchParams
* rest.resource[=] insert SPplain(accession, token)
* rest.resource[=] insert SPplain(patient, reference)
* rest.resource[=] insert SPplain(subject, reference)
* rest.resource[=] insert SPplain(type, token)
* rest.resource[=] insert SPplain(status, token)
* rest.resource[=] insert SPplain(collected, date)

// --- Practitioner ---
* rest.resource[+].type = #Practitioner
* rest.resource[=].profile = Canonical(OpenELISPractitioner)
* rest.resource[=].documentation = "Backed by the OpenELIS Provider. update changes name and telecom only. Delete sets active = false."
* rest.resource[=].versioning = #no-version
* rest.resource[=].readHistory = false
* rest.resource[=].conditionalDelete = #not-supported
* rest.resource[=] insert CrudInteractions
* rest.resource[=].searchRevInclude[0] = "ServiceRequest:requester"
* rest.resource[=].searchRevInclude[1] = "Observation:performer"
* rest.resource[=] insert CommonSearchParams
* rest.resource[=] insert SPplain(name, string)
* rest.resource[=] insert SPplain(given, string)
* rest.resource[=] insert SPplain(family, string)
* rest.resource[=] insert SPplain(address-city, string)
* rest.resource[=] insert SPplain(address-state, string)
* rest.resource[=] insert SPplain(address-postalcode, string)
* rest.resource[=] insert SPplain(address-country, string)
* rest.resource[=] insert SPplain(telecom, token)
* rest.resource[=] insert SPplain(email, token)
* rest.resource[=] insert SPplain(phone, token)

// --- Organization ---
* rest.resource[+].type = #Organization
* rest.resource[=].profile = Canonical(OpenELISOrganization)
* rest.resource[=].documentation = "update changes name, active and partOf only. Delete sets the organization inactive."
* rest.resource[=].versioning = #no-version
* rest.resource[=].readHistory = false
* rest.resource[=].conditionalDelete = #not-supported
* rest.resource[=] insert CrudInteractions
* rest.resource[=].searchInclude[0] = "Organization:partof"
* rest.resource[=].searchRevInclude[0] = "Organization:partof"
* rest.resource[=] insert CommonSearchParams
* rest.resource[=] insert SPplain(name, string)
* rest.resource[=] insert SPplain(active, token)
* rest.resource[=] insert SPplain(type, token)
* rest.resource[=] insert SPplain(partof, reference)
* rest.resource[=] insert SPplain(address-city, string)
* rest.resource[=] insert SPplain(address-state, string)

// --- Location (storage) ---
* rest.resource[+].type = #Location
* rest.resource[=].profile = Canonical(OpenELISStorageLocation)
* rest.resource[=].documentation = "The sample storage hierarchy (room / device / shelf / rack / box). The level comes from meta.tag (system http://openelis.org/fhir/tag/storage-hierarchy), falling back to physicalType.text. partOf is required except for rooms. On create the client id is ignored. On update a body id that differs from the URL id returns 400. Delete deactivates."
* rest.resource[=].versioning = #no-version
* rest.resource[=].readHistory = false
* rest.resource[=].conditionalDelete = #not-supported
* rest.resource[=] insert CrudInteractions
* rest.resource[=].searchInclude[0] = "Location:partof"
* rest.resource[=].searchRevInclude[0] = "Location:partof"
* rest.resource[=] insert CommonSearchParams
* rest.resource[=] insert SPplain(name, string)
* rest.resource[=] insert SPplain(status, token)
* rest.resource[=] insert SPplain(partof, reference)
* rest.resource[=] insert SP(_tag, token, Storage level: http://openelis.org/fhir/tag/storage-hierarchy|room / device / shelf / rack / box)

// --- Device (analyzer) ---
* rest.resource[+].type = #Device
* rest.resource[=].profile = Canonical(OpenELISAnalyzerDevice)
* rest.resource[=].documentation = "Backed by the OpenELIS Analyzer. On create the client id is ignored. Delete sets the analyzer inactive."
* rest.resource[=].versioning = #no-version
* rest.resource[=].readHistory = false
* rest.resource[=].conditionalDelete = #not-supported
* rest.resource[=] insert CrudInteractions
* rest.resource[=] insert CommonSearchParams
* rest.resource[=] insert SPplain(device-name, string)
* rest.resource[=] insert SPplain(type, token)
* rest.resource[=] insert SPplain(status, token)
