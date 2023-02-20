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
* identifier[cliaNum].system = "http://openelis-global.org/org_cliaNum"
* identifier[shortName].system = "http://openelis-global.org/org_shortName" 
* identifier[code].system = "http://openelis-global.org/org_code"
* identifier[uuid].system = "http://openelis-global.org/org_uuid"
* name 1..1
* address 1..1
* type 1..*

Instance: OrganizationExample
InstanceOf: OpenELISOrganisation
Usage: #example
Title: "OpenELIS Organization Example"
Description: "OpenELIS Organization Example"
* id = "bc8479a5-b34b-4578-9d38-a351bc92e614"
* identifier[+].value = "DEPT"
* identifier[+].value = "EID ICAP"
* identifier[+].value = "UG1001"
* identifier[+].value = "a1313f63-29b4-498d-ba12-0e960c683ec0"
* name = "Minity Of Health"
* address[+].line = "KING"
* address[=].state = "WASHINGTON"
* address[=].city = "GREENWOOD"
* address[=].postalCode = "98103"
* type[0].coding[0].code = #prov
* type[0].coding[0].display = "referralLab"
