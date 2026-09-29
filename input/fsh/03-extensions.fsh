// Every extension below has its ^url pinned to the exact URL OpenELIS puts on
// the wire today, so that real OpenELIS messages validate against this IG.
// These URLs do not follow the IG canonical and use two different bases
// (see known-issues.html).

// ===========================================================================
// Specimen
// ===========================================================================

Extension: OECollectionLocationGPS
Id: collection-location-gps
Title: "Collection location (GPS)"
Description: "Where the specimen was collected, as captured on the device used at collection. Added to Specimen.collection when the order has GPS coordinates (SpecimenTransformServiceImpl.createGpsExtension)."
Context: Specimen.collection
* ^url = "http://openelis-global.org/fhir/StructureDefinition/collection-location-gps"
* ^status = #active
* ^experimental = false
* extension contains
    latitude 0..1 MS and
    longitude 0..1 MS and
    accuracy 0..1 and
    method 0..1 and
    captureTimestamp 0..1
* extension[latitude] ^short = "Latitude in decimal degrees (WGS84)"
* extension[latitude].value[x] only decimal
* extension[longitude] ^short = "Longitude in decimal degrees (WGS84)"
* extension[longitude].value[x] only decimal
* extension[accuracy] ^short = "Horizontal accuracy in metres"
* extension[accuracy].value[x] only integer
* extension[method] ^short = "How the coordinates were captured (free code set by the client)"
* extension[method].value[x] only code
* extension[captureTimestamp] ^short = "When the coordinates were captured"
* extension[captureTimestamp].value[x] only dateTime

// ===========================================================================
// Device (analyzer)
// ===========================================================================

Extension: OEAnalyzerLastActivated
Id: analyzer-last-activated
Title: "Analyzer last activated"
Description: "When the analyzer was last activated in OpenELIS."
Context: Device
* ^url = "http://openelis.org/fhir/StructureDefinition/analyzer-last-activated"
* ^status = #active
* ^experimental = false
* value[x] only dateTime

Extension: OEAnalyzerTestUnits
Id: analyzer-test-units
Title: "Analyzer test units"
Description: "The OpenELIS test units (lab sections) the analyzer serves."
Context: Device
* ^url = "http://openelis.org/fhir/StructureDefinition/analyzer-test-units"
* ^status = #active
* ^experimental = false
* extension contains testUnitId 0..*
* extension[testUnitId] ^short = "OpenELIS test unit id"
* extension[testUnitId].value[x] only string

Extension: OEAnalyzerOperationalStatusExt
Id: analyzer-operational-status
Title: "Analyzer operational status"
Description: "OpenELIS's own analyzer lifecycle status, unmapped. Device.status carries the mapped FHIR value. Ignored on import."
Context: Device
* ^url = "http://openelis.org/fhir/StructureDefinition/analyzer-operational-status"
* ^status = #active
* ^experimental = false
* value[x] only code
* valueCode from OEAnalyzerOperationalStatusVS (required)

// ===========================================================================
// Storage Location
// ===========================================================================

Extension: OEStorageTemperature
Id: storage-temperature
Title: "Storage temperature"
Description: "Temperature setting of a storage device. The unit is not carried on the wire (see Known Issues)."
Context: Location
* ^url = "http://openelis.org/fhir/extension/storage-temperature"
* ^status = #active
* ^experimental = false
* value[x] only decimal

Extension: OEStorageCapacity
Id: storage-capacity
Title: "Storage capacity"
Description: "Capacity of the location: the capacity limit of a device or shelf. On a box it is rows x columns and is only sent with rack-grid-dimensions."
Context: Location
* ^url = "http://openelis.org/fhir/extension/storage-capacity"
* ^status = #active
* ^experimental = false
* value[x] only integer

Extension: OERackGridDimensions
Id: rack-grid-dimensions
Title: "Grid dimensions"
Description: "Grid of a storage box as the string \"{rows} × {columns}\" (U+00D7 multiplication sign, with spaces), for example \"9 × 9\". Parsed on import."
Context: Location
* ^url = "http://openelis.org/fhir/extension/rack-grid-dimensions"
* ^status = #active
* ^experimental = false
* value[x] only string

Extension: OERackPositionSchemaHint
Id: rack-position-schema-hint
Title: "Position schema hint"
Description: "How positions in the box are labelled (for example letter-number). Free text."
Context: Location
* ^url = "http://openelis.org/fhir/extension/rack-position-schema-hint"
* ^status = #active
* ^experimental = false
* value[x] only string

Extension: OEPositionOccupancy
Id: position-occupancy
Title: "Position occupancy"
Description: "Whether any position in the storage box is occupied. Always sent on box-level Locations."
Context: Location
* ^url = "http://openelis.org/fhir/extension/position-occupancy"
* ^status = #active
* ^experimental = false
* value[x] only boolean

Extension: OEStorageDeviceIPAddress
Id: device-ip-address
Title: "Storage device IP address"
Description: "Network address of a connected storage device (for example a monitored freezer)."
Context: Location
* ^url = "http://openelis.org/fhir/extension/device-ip-address"
* ^status = #active
* ^experimental = false
* value[x] only string

Extension: OEStorageDevicePort
Id: device-port
Title: "Storage device port"
Description: "Network port of a connected storage device."
Context: Location
* ^url = "http://openelis.org/fhir/extension/device-port"
* ^status = #active
* ^experimental = false
* value[x] only integer

Extension: OEStorageDeviceProtocol
Id: device-communication-protocol
Title: "Storage device communication protocol"
Description: "Protocol used to talk to a connected storage device. Free text."
Context: Location
* ^url = "http://openelis.org/fhir/extension/device-communication-protocol"
* ^status = #active
* ^experimental = false
* value[x] only string

// ===========================================================================
// Shipment (SupplyDelivery)
// ===========================================================================

Extension: OEShipmentDestinationOrg
Id: shipment-destination-org
Title: "Shipment destination organization id"
Description: "UUID of the destination Organization. Kept for receivers that do not read the contained destination Location."
Context: SupplyDelivery
* ^url = "http://openelis.org/fhir/extension/shipment-destination-org"
* ^status = #active
* ^experimental = false
* value[x] only string

Extension: OEShipmentSourceOrg
Id: shipment-source-org
Title: "Shipment source laboratory"
Description: "Name of the sending OpenELIS site (its configuration name)."
Context: SupplyDelivery
* ^url = "http://openelis.org/fhir/extension/shipment-source-org"
* ^status = #active
* ^experimental = false
* value[x] only string

Extension: OEShipmentTemperature
Id: shipment-temperature
Title: "Shipment temperature requirement"
Description: "Temperature the box must be kept at in transit. Free text (for example 2-8 °C)."
Context: SupplyDelivery
* ^url = "http://openelis.org/fhir/extension/shipment-temperature"
* ^status = #active
* ^experimental = false
* value[x] only string

Extension: OEShipmentCapacity
Id: shipment-capacity
Title: "Shipment box capacity"
Description: "Number of specimens the box can hold."
Context: SupplyDelivery
* ^url = "http://openelis.org/fhir/extension/shipment-capacity"
* ^status = #active
* ^experimental = false
* value[x] only integer

Extension: OEShipmentNotes
Id: shipment-notes
Title: "Shipment notes"
Description: "Free-text notes on the box."
Context: SupplyDelivery
* ^url = "http://openelis.org/fhir/extension/shipment-notes"
* ^status = #active
* ^experimental = false
* value[x] only string

Extension: OEShipmentContentItem
Id: shipment-content-item
Title: "Shipment content item"
Description: "One row of the box manifest. Repeats once per item in the box."
Context: SupplyDelivery
* ^url = "http://openelis.org/fhir/extension/shipment-content-item"
* ^status = #active
* ^experimental = false
* extension contains
    label 0..1 and
    type 0..1
* extension[label] ^short = "Accession number, or EQA panel sample code"
* extension[label].value[x] only string
* extension[type] ^short = "Sample type description, or EQA panel name"
* extension[type].value[x] only string

Extension: OEShipmentNonConformity
Id: shipment-non-conformity
Title: "Shipment non-conformity"
Description: "A problem recorded when the box was received (damaged, leaked, missing, rejected). SNOMED CT by default. Codes can be overridden per site. Only sent after reception."
Context: SupplyDelivery
* ^url = "http://openelis.org/fhir/extension/shipment-non-conformity"
* ^status = #active
* ^experimental = false
* value[x] only CodeableConcept

Extension: OEShipmentSpecimen
Id: shipment-specimen
Title: "Shipped specimen"
Description: "A Specimen in the box. Repeats once per sample item with a FHIR id. The receiving site uses these references at reception."
Context: SupplyDelivery
* ^url = "http://openelis.org/fhir/extension/shipment-specimen"
* ^status = #active
* ^experimental = false
* value[x] only Reference(OpenELISSpecimen)

Extension: OEShipmentSpecimenTypeSummary
Id: shipment-specimen-type-summary
Title: "Shipment specimen type summary"
Description: "Count of items in the box per sample type. One repetition per distinct type, in no guaranteed order."
Context: SupplyDelivery
* ^url = "http://openelis.org/fhir/extension/shipment-specimen-type-summary"
* ^status = #active
* ^experimental = false
* extension contains
    type 1..1 and
    count 1..1
* extension[type] ^short = "Sample type description (\"Unknown\" if none)"
* extension[type].value[x] only string
* extension[count] ^short = "Number of items of that type"
* extension[count].value[x] only integer

Extension: OEEQACycle
Id: eqa-cycle
Title: "EQA cycle"
Description: "External quality assessment cycle the consignment belongs to. Only sent for EQA boxes."
Context: SupplyDelivery
* ^url = "http://openelis.org/fhir/extension/eqa-cycle"
* ^status = #active
* ^experimental = false
* extension contains
    scheme 0..1 and
    number 0..1 and
    name 0..1 and
    distributionDate 0..1 and
    submissionDeadline 0..1
* extension[scheme].value[x] only string
* extension[number].value[x] only integer
* extension[name].value[x] only string
* extension[distributionDate].value[x] only date
* extension[submissionDeadline].value[x] only date
