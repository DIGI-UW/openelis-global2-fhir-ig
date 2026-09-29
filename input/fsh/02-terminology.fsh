// Terminology this guide defines. Code systems OpenELIS uses on the wire under
// its own URLs (storage hierarchy, storage device type, and the site-configured
// local code systems) are documented on identifiers.html rather than defined
// here, because their URLs are not under this guide's canonical.

CodeSystem: OEAnalyzerOperationalStatus
Id: oe-analyzer-operational-status
Title: "OpenELIS Analyzer Operational Status"
Description: "OpenELIS's own analyzer lifecycle status, sent unchanged (enum name, a plain code with no system) in the analyzer-operational-status extension. This CodeSystem exists only so the IG can bind that code. Device.status carries the FHIR mapping of the same value."
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #SETUP "Setup" "Being configured. Device.status = active."
* #VALIDATION "Validation" "Under validation. Device.status = active."
* #ACTIVE "Active" "In routine use. Device.status = active."
* #ERROR_PENDING "Error pending" "Has an unresolved error. Device.status = entered-in-error."
* #OFFLINE "Offline" "Not reachable. Device.status = unknown."
* #INACTIVE "Inactive" "Retired or disabled. Device.status = inactive."

ValueSet: OEAnalyzerOperationalStatusVS
Id: oe-analyzer-operational-status
Title: "OpenELIS Analyzer Operational Statuses"
Description: "All analyzer operational statuses."
* ^status = #active
* ^experimental = false
* include codes from system OEAnalyzerOperationalStatus

