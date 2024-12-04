Profile: OpenELISOrganisation
Parent: Organization
Id: open-elisorganisation
Title: "OpenELIS Organization"
Description: "A Organization Resource used for FHIR Exchange"
* identifier 1..*
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains cliaNum 1..1  and shortName 1..1  and code 1..1 and uuid 1..1
* identifier[cliaNum].system = "https://demo.openelis-global.org/org_cliaNum"
* identifier[shortName].system = "https://demo.openelis-global.org/org_shortName" 
* identifier[code].system = "https://demo.openelis-global.org/org_code"
* identifier[uuid].system = "https://demo.openelis-global.org/org_uuid"
* name 1..1
* address 1..1
* type 1..*

Instance: OrganizationExample
InstanceOf: OpenELISOrganisation
Usage: #example
Title: "OpenELIS Organization Example"
Description: "OpenELIS Organization Example"
* id = "bc8479a5-b34b-4578-9d38-a351bc92e614"
* identifier[cliaNum].system = "https://demo.openelis-global.org/org_cliaNum"
* identifier[cliaNum].value = "DEPT"
* identifier[shortName].system = "https://demo.openelis-global.org/org_shortName"
* identifier[shortName].value = "EID ICAP"
* identifier[code].system = "https://demo.openelis-global.org/org_code"
* identifier[code].value = "UG1001"
* identifier[uuid].system = "https://demo.openelis-global.org/org_uuid"
* identifier[uuid].value = "a1313f63-29b4-498d-ba12-0e960c683ec0"
* name = "Minity Of Health"
* address[+].line = "KING"
* address[=].state = "WASHINGTON"
* address[=].city = "GREENWOOD"
* address[=].postalCode = "98103"
* type[0].coding[0].code = #prov
* type[0].coding[0].display = "referralLab"

Mapping: OpenELISOrganizationMapping
Source: OpenELISOrganisation
Target: "http://i-tech-uw.github.io/openelis-global-ig/StructureDefinition/open-elis-organization"
Id: open-elis-organization-mapping
Title: "OpenELIS Vs FHIR"
Description: "Organisation Mapping shows how attributes of FHIR Organisation Resource maps to and from the attributes of OpenElis Organisation Object."
* -> "OE Patient" "This profile maps FHIR Organisation Resource to OE DataExchange."
* id -> "Organisation.fhirUuid"
* name -> "Organization.organizationName"
* identifier.value -> "Organization.shortName"
* identifier.value -> "Organization.cliaNum"
* identifier.value -> "Organization.code"
* address.line -> "Organization.streetAddress"
* address.city -> "Organization.city"
* address.state -> "Organization.state"
* address.postalCode -> "Organization.zipCode"
* type -> "Organization.organizationTypes.name"