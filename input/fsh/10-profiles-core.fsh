// Patient, Practitioner and Organization as produced by OpenELIS.

// ===========================================================================
// Patient
// ===========================================================================
Profile: OpenELISPatient
Parent: Patient
Id: openelis-patient
Title: "OpenELIS Patient"
Description: "A patient as OpenELIS produces it (PatientTransformServiceImpl.transformToFhirPatient) and serves it from /fhir/Patient. Environmental and vector orders have no patient."
* insert IdentifierSlicing
* identifier 1..* MS
* identifier contains
    uuid 1..1 MS and
    nationalId 0..1 MS and
    subjectNumber 0..1 MS and
    stNumber 0..1 MS and
    guid 0..1 MS and
    facility 0..1 MS
* identifier[uuid] ^short = "OpenELIS patient UUID (equals Patient.id)"
* identifier[uuid].system = "http://openelis-global.org/pat_uuid"
* identifier[uuid].value 1..1
* identifier[nationalId] ^short = "National id"
* identifier[nationalId].use = #official
* identifier[nationalId].system = "http://openelis-global.org/pat_nationalId"
* identifier[nationalId].value 1..1
* identifier[subjectNumber] ^short = "Subject (programme) number"
* identifier[subjectNumber].system = "http://openelis-global.org/pat_subjectNumber"
* identifier[subjectNumber].value 1..1
* identifier[stNumber] ^short = "ST number"
* identifier[stNumber].system = "http://openelis-global.org/pat_stNumber"
* identifier[stNumber].value 1..1
* identifier[guid] ^short = "Patient GUID"
* identifier[guid].system = "http://openelis-global.org/pat_guid"
* identifier[guid].value 1..1
* insert FacilityIdentifierSlice
* name 1..* MS
* name.use MS
* name.family MS
* name.given MS
* gender 1..1 MS
* gender ^comment = "Stored M = male, F = female, O = other. A blank or any other value = unknown."
* birthDate MS
* birthDate ^comment = "Partially known birth dates are sent at year or year-month precision."
* telecom MS
* telecom ^comment = "Primary phone (use = mobile), email and fax. Blank values are not sent."
* address MS
* address ^comment = "One address built from the person's street, city, state and country. A commune, when recorded, is added as an extra line prefixed 'commune: '."

Mapping: OpenELISPatientToOE
Source: OpenELISPatient
Target: "https://github.com/DIGI-UW/OpenELIS-Global-2"
Id: oe-data-model
Title: "OpenELIS Global data model"
* -> "Patient + Person (PatientTransformServiceImpl)"
* id -> "Patient.fhirUuid"
* identifier[uuid] -> "Patient.fhirUuid"
* identifier[nationalId] -> "Patient.nationalId (patient_identity NATIONAL)"
* identifier[subjectNumber] -> "Patient subject number (patient_identity SUBJECT)"
* identifier[stNumber] -> "Patient ST number (patient_identity ST)"
* identifier[guid] -> "Patient GUID (patient_identity GUID)"
* identifier[facility] -> "Site facility id (org.openelisglobal.facility.id)"
* name.family -> "Person.lastName"
* name.given -> "Person.firstName"
* gender -> "Patient.gender (M / F)"
* birthDate -> "Patient.birthDateForDisplay"
* telecom -> "Person.primaryPhone (use = mobile) / email / fax"
* address.line -> "Person.streetAddress (+ PersonAddress commune)"
* address.city -> "Person.city"
* address.state -> "Person.state"
* address.country -> "Person.country"

// ===========================================================================
// Practitioner
// ===========================================================================
Profile: OpenELISPractitioner
Parent: Practitioner
Id: openelis-practitioner
Title: "OpenELIS Practitioner"
Description: "A requesting provider as OpenELIS produces it (PractitionerTransformServiceImpl) and serves it from /fhir/Practitioner."
* insert IdentifierSlicing
* identifier MS
* identifier contains
    uuid 0..1 MS and
    facility 0..1 MS
* identifier[uuid] ^short = "OpenELIS provider UUID"
* identifier[uuid].system = "http://openelis-global.org/provider_uuid"
* identifier[uuid].value 1..1
* insert FacilityIdentifierSlice
* active MS
* name 1..* MS
* name.family MS
* name.given MS
* name.prefix MS
* name.prefix ^comment = "The person's title code. Only the first prefix is kept on import."
* telecom MS
* address MS

Mapping: OpenELISPractitionerToOE
Source: OpenELISPractitioner
Target: "https://github.com/DIGI-UW/OpenELIS-Global-2"
Id: oe-data-model
Title: "OpenELIS Global data model"
* -> "Provider + Person (PractitionerTransformServiceImpl)"
* id -> "Provider.fhirUuid (Provider.id when no UUID)"
* identifier[uuid] -> "Provider.fhirUuid"
* active -> "Provider.active"
* name.family -> "Person.lastName"
* name.given -> "Person.firstName"
* name.prefix -> "Person.titleCode"
* telecom -> "Person.primaryPhone (use = mobile) / email / fax"
* address -> "Person.streetAddress / city / state / zipCode / country"

// ===========================================================================
// Organization
// ===========================================================================
Profile: OpenELISOrganization
Parent: Organization
Id: openelis-organization
Title: "OpenELIS Organization"
Description: "An organization as OpenELIS produces it (OrganizationTransformServiceImpl) and serves it from /fhir/Organization: referring sites, reference labs, and the site's own facility Organization (FhirFacilityOrganizationServiceImpl)."
* insert IdentifierSlicing
* identifier MS
* identifier contains
    uuid 0..1 MS and
    code 0..1 MS and
    shortName 0..1 MS and
    cliaNum 0..1 MS and
    facility 0..1 MS
* identifier[uuid] ^short = "OpenELIS organization UUID"
* identifier[uuid].system = "http://openelis-global.org/org_uuid"
* identifier[uuid].value 1..1
* identifier[code].system = "http://openelis-global.org/org_code"
* identifier[code].value 1..1
* identifier[shortName].system = "http://openelis-global.org/org_shortName"
* identifier[shortName].value 1..1
* identifier[cliaNum].system = "http://openelis-global.org/org_cliaNum"
* identifier[cliaNum].value 1..1
* insert FacilityIdentifierSlice
* identifier[facility] ^comment = "The site's own facility Organization is pushed to the FHIR store at start-up with only this identifier (no assigner). Served from /fhir/Organization, the same organization also carries org_shortName = FACILITY_ORG."
* active 1..1 MS
* name 1..1 MS
* type MS
* type.coding ^slicing.discriminator.type = #value
* type.coding ^slicing.discriminator.path = "system"
* type.coding ^slicing.rules = #open
* type.coding contains oeType 0..1 MS
* type.coding[oeType].system = "http://openelis-global.org/orgType"
* type.coding[oeType].code 1..1
* address 0..1 MS
* address ^comment = "Legacy column limits apply on create and update: line 30, city 30, state 2, postalCode 10 characters. Longer values are rejected with 422."
* partOf only Reference(OpenELISOrganization)
* partOf MS

Mapping: OpenELISOrganizationToOE
Source: OpenELISOrganization
Target: "https://github.com/DIGI-UW/OpenELIS-Global-2"
Id: oe-data-model
Title: "OpenELIS Global data model"
* -> "Organization (OrganizationTransformServiceImpl)"
* id -> "Organization.fhirUuid (Organization.id when no UUID)"
* identifier[uuid] -> "Organization.fhirUuid"
* identifier[code] -> "Organization.code"
* identifier[shortName] -> "Organization.shortName"
* identifier[cliaNum] -> "Organization.cliaNum"
* active -> "Organization.isActive (Y / N)"
* name -> "Organization.organizationName"
* type -> "Organization.organizationTypes (name / description)"
* address.line -> "Organization.streetAddress"
* address.city -> "Organization.city"
* address.state -> "Organization.state"
* address.postalCode -> "Organization.zipCode"
* partOf -> "Organization.organization (parent)"

// ===========================================================================
// Site Location of an organization
// ===========================================================================
Profile: OpenELISSiteLocation
Parent: Location
Id: openelis-site-location
Title: "OpenELIS Site Location"
Description: "The place an OpenELIS organization stands for (OrganizationTransformServiceImpl.transformToFhirLocation). It has the same id as the Organization. ServiceRequest.locationReference points at the referring site and department this way, and the subject of an order without a patient points at its sampling site. OpenELIS writes these Locations to the FHIR store together with the ServiceRequests that reference them and whenever the organization is saved, and serves them from /fhir/Location/{id} (read only)."
* status 1..1 MS
* status ^comment = "inactive when the organization is inactive, otherwise active."
* name 1..1 MS
* mode 1..1 MS
* mode = #instance
* physicalType 1..1 MS
* physicalType.coding 1..1
* physicalType.coding = $LocPhysType#si "Site"
* managingOrganization 1..1 MS
* managingOrganization only Reference(OpenELISOrganization)

Mapping: OpenELISSiteLocationToOE
Source: OpenELISSiteLocation
Target: "https://github.com/DIGI-UW/OpenELIS-Global-2"
Id: oe-data-model
Title: "OpenELIS Global data model"
* -> "Organization (OrganizationTransformServiceImpl.transformToFhirLocation)"
* id -> "Organization.fhirUuid"
* status -> "Organization.isActive (Y / N)"
* name -> "Organization.organizationName"
* managingOrganization -> "Organization.fhirUuid"
