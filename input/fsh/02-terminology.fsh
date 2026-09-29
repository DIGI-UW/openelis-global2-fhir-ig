// ---------------------------------------------------------------------------
// Code systems OpenELIS defines and fully controls
// ---------------------------------------------------------------------------

CodeSystem: OEStorageHierarchy
Id: oe-storage-hierarchy
Title: "OpenELIS Storage Hierarchy Level"
Description: "Level of a storage Location in the OpenELIS storage hierarchy. Sent as the system of Location.meta.tag (StorageLocationFhirTransform)."
* ^url = "http://openelis.org/fhir/tag/storage-hierarchy"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #room "Room" "A storage room. Top of the hierarchy (no partOf)."
* #device "Device" "Storage equipment in a room: freezer, refrigerator, cabinet or other."
* #shelf "Shelf" "A shelf in a storage device."
* #rack "Rack" "A rack on a shelf."
* #box "Box" "A box (or plate) in a rack. May carry a grid of positions."

ValueSet: OEStorageHierarchyVS
Id: oe-storage-hierarchy
Title: "OpenELIS Storage Hierarchy Levels"
Description: "All storage hierarchy levels."
* ^status = #active
* ^experimental = false
* include codes from system OEStorageHierarchy

CodeSystem: OEStorageDeviceType
Id: oe-storage-device-type
Title: "OpenELIS Storage Device Type"
Description: "Type of storage equipment. Sent in Location.type of equipment-level storage Locations (StorageDevice.deviceType)."
* ^url = "http://openelis.org/fhir/CodeSystem/storage-device-type"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #freezer "Freezer"
* #refrigerator "Refrigerator"
* #cabinet "Cabinet"
* #other "Other"

ValueSet: OEStorageDeviceTypeVS
Id: oe-storage-device-type
Title: "OpenELIS Storage Device Types"
Description: "All storage device types."
* ^status = #active
* ^experimental = false
* include codes from system OEStorageDeviceType

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

// ---------------------------------------------------------------------------
// Local code systems whose content is configured per site.
// Their URLs are {org.openelisglobal.oe.fhir.system}/<suffix>.
// ---------------------------------------------------------------------------

CodeSystem: OESampleType
Id: oe-sample-type
Title: "OpenELIS Sample Type (local)"
Description: "Sample types configured in the site test catalog. Code = local abbreviation. Display = localized name. Always the first coding of Specimen.type."
* insert OELocalCodeSystem(http://openelis-global.org/sampleType, Sample types configured in the OpenELIS test catalog.)

CodeSystem: OEDictionaryEntry
Id: oe-dictionary-entry
Title: "OpenELIS Dictionary Entry (local)"
Description: "Coded (dictionary) result values configured in the site catalog. Used in Observation.valueCodeableConcept alongside a LOINC answer code when one is mapped."
* insert OELocalCodeSystem(http://openelis-global.org/dictionary_entry, Coded result values configured in the OpenELIS dictionary.)

CodeSystem: OETestResultComponent
Id: oe-test-result-component
Title: "OpenELIS Test Result Component (local)"
Description: "Components of a multi-component test. Added to Observation.code for non-primary components."
* insert OELocalCodeSystem(http://openelis-global.org/test_result_component, Result components of multi-component tests.)

CodeSystem: OESampleDomain
Id: oe-sample-domain
Title: "OpenELIS Sample Domain (local)"
Description: "Domain of the order (for example clinical / environmental / vector). Carried in ServiceRequest.category so the receiving system can route the order."
* insert OELocalCodeSystem(http://openelis-global.org/samp_domain, Domain of an OpenELIS order.)

CodeSystem: OESampleProgram
Id: oe-sample-program
Title: "OpenELIS Program (local)"
Description: "Programme the order was entered under. Carried in ServiceRequest.category."
* insert OELocalCodeSystem(http://openelis-global.org/sample_program, Programmes configured in OpenELIS.)

CodeSystem: OESampleCondition
Id: oe-sample-condition
Title: "OpenELIS Sample Condition (local)"
Description: "Condition of a sample on receipt."
* insert OELocalCodeSystem(http://openelis-global.org/sample_condition, Sample conditions configured in OpenELIS.)

CodeSystem: OEOrganizationType
Id: oe-organization-type
Title: "OpenELIS Organization Type (local)"
Description: "Organization types configured in OpenELIS. Carried in Organization.type and read back on import."
* insert OELocalCodeSystem(http://openelis-global.org/orgType, Organization types configured in OpenELIS.)

CodeSystem: OETaskOutputType
Id: oe-task-output
Title: "OpenELIS Task Output Type"
Description: "Type of a referral Task output. OpenELIS sends the code DiagnosticReport."
* ^url = "http://openelis-global.org/task_output"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #fragment
* #DiagnosticReport "DiagnosticReport" "The output references the DiagnosticReport holding the referral results."

CodeSystem: OEReferralReason
Id: oe-refer-reason
Title: "OpenELIS Referral Reason (local)"
Description: "Reason a test was referred. OpenELIS currently sends only the system with no code (see Known Issues)."
* insert OELocalCodeSystem(http://openelis-global.org/refer_reason, Referral reasons configured in OpenELIS.)

CodeSystem: OEGeneratedIdentifierType
Id: oe-gen-id-type
Title: "OpenELIS Identifier Type"
Description: "Identifier.type codes OpenELIS uses on identifiers it creates."
* ^url = "http://openelis-global.org/genIdType"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #fragment
* #externalId "External id" "An identifier assigned by an external system and kept on the OpenELIS copy of the resource."
