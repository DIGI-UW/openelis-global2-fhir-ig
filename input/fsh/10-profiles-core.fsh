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
    stNumber 0..1 and
    guid 0..1 and
    facility 0..1
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
* gender ^comment = "OpenELIS stores M / F. M maps to male. Any other stored value maps to female. A blank value maps to unknown (see Known Issues)."
* birthDate MS
* birthDate ^comment = "Partially known birth dates are sent at year or year-month precision."
* telecom MS
* telecom ^comment = "Primary phone (use = mobile), email and fax."
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
    facility 0..1
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
    shortName 0..1 and
    cliaNum 0..1 and
    facility 0..1
* identifier[uuid] ^short = "OpenELIS organization UUID"
* identifier[uuid] ^comment = "Currently only sent when the organization has a code (see Known Issues)."
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
