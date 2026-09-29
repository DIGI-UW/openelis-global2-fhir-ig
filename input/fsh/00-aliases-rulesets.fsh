// ---------------------------------------------------------------------------
// Aliases
// ---------------------------------------------------------------------------
// OpenELIS builds most identifier and local code systems as
//   {org.openelisglobal.oe.fhir.system}/<suffix>
// The property defaults to http://openelis-global.org. Profiles in this IG use
// the default. See identifiers.html.
Alias: $OE = http://openelis-global.org
Alias: $OEX = http://openelis.org/fhir/extension
Alias: $OESD = http://openelis.org/fhir/StructureDefinition
Alias: $LOINC = http://loinc.org
Alias: $SCT = http://snomed.info/sct
Alias: $UCUM = http://unitsofmeasure.org
Alias: $LocPhysType = http://terminology.hl7.org/CodeSystem/location-physical-type
Alias: $SupplyItemType = http://terminology.hl7.org/CodeSystem/supply-item-type
Alias: $OEDataModel = https://github.com/DIGI-UW/OpenELIS-Global-2

// ---------------------------------------------------------------------------
// Rule sets
// ---------------------------------------------------------------------------

// Open slicing of identifier by system
RuleSet: IdentifierSlicing
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Sliced by identifier system"

// The site (facility) identifier OpenELIS adds to most resources it produces.
// FhirCommonTransformServiceImpl.createFacilityIdentifier()
RuleSet: FacilityIdentifierSlice
* identifier[facility] ^short = "Identifier of the OpenELIS site that produced this resource"
* identifier[facility].use = #official
* identifier[facility].system = "http://openelis-global.org/facility_id"
* identifier[facility].value 1..1
* identifier[facility].assigner only Reference(OpenELISOrganization)
* identifier[facility].assigner ^short = "The site Organization"

// A NamingSystem for one OpenELIS identifier system
RuleSet: OEIdentifierNamingSystem(name, uri, description)
* name = "{name}"
* status = #active
* kind = #identifier
* date = "2026-09-29"
* publisher = "OpenELIS Global"
* responsible = "OpenELIS Global"
* description = "{description}"
* uniqueId[0].type = #uri
* uniqueId[0].value = "{uri}"
* uniqueId[0].preferred = true
