// Analyzers, sample storage and specimen shipment.

// ===========================================================================
// Device (analyzer)
// ===========================================================================
Profile: OpenELISAnalyzerDevice
Parent: Device
Id: openelis-analyzer-device
Title: "OpenELIS Analyzer Device"
Description: "An analyzer as OpenELIS produces it (DeviceTransformServiceImpl), serves it from /fhir/Device, and includes it in result bundles when Observation.device references it. OpenELIS sends this profile's URL, http://openelis.org/fhir/StructureDefinition/openelis-analyzer-device, in meta.profile, so the profile URL is pinned to it."
* ^url = "http://openelis.org/fhir/StructureDefinition/openelis-analyzer-device"
* insert IdentifierSlicing
* identifier 1..* MS
* identifier contains
    analyzerUuid 1..1 MS and
    bridgeConnection 0..1 MS
* identifier[analyzerUuid] ^short = "OpenELIS analyzer UUID (equals Device.id)"
* identifier[analyzerUuid].system = "http://openelis-global.org/analyzer_uuid"
* identifier[analyzerUuid].value 1..1
* identifier[bridgeConnection] ^short = "Connection id in the OpenELIS analyzer bridge"
* identifier[bridgeConnection].system = "http://openelis-global.org/analyzer_bridge_connection"
* identifier[bridgeConnection].value 1..1
* extension contains
    OEAnalyzerLastActivated named lastActivated 0..1 MS and
    OEAnalyzerTestUnits named testUnits 0..1 MS and
    OEAnalyzerOperationalStatusExt named operationalStatus 0..1 MS
* status MS
* status ^comment = "Setup / validation / active = active. Error pending = entered-in-error. Inactive = inactive. Offline or other = unknown. The unmapped OpenELIS status is in the operationalStatus extension."
* deviceName 0..1 MS
* deviceName.type = #user-friendly-name
* type MS
* type ^comment = "text only: the analyzer bridge profile id pinned to this analyzer."
* owner MS
* owner only Reference(OpenELISOrganization)
* owner ^comment = "Sent as a logical reference: owner.identifier with system {oe}/facility_id and the site Organization as assigner. owner.reference is not set."
* owner.identifier MS

Mapping: OpenELISAnalyzerDeviceToOE
Source: OpenELISAnalyzerDevice
Target: "https://github.com/DIGI-UW/OpenELIS-Global-2"
Id: oe-data-model
Title: "OpenELIS Global data model"
* -> "Analyzer (DeviceTransformServiceImpl)"
* id -> "Analyzer.fhirUuid (Analyzer.id when no UUID)"
* identifier[analyzerUuid] -> "Analyzer.fhirUuid"
* identifier[bridgeConnection] -> "Analyzer.bridgeConnectionId"
* extension[lastActivated] -> "Analyzer.lastActivatedDate"
* extension[testUnits] -> "Analyzer test units"
* extension[operationalStatus] -> "Analyzer.status"
* status -> "Analyzer.status"
* deviceName -> "Analyzer.name"
* type -> "Analyzer pinned bridge profile id"
* owner -> "Site facility"

// ===========================================================================
// Storage Location (room / device / shelf / rack / box)
// ===========================================================================
Invariant: oe-storage-partof
Description: "Every storage level except room has a parent (partOf)."
Severity: #error
Expression: "meta.tag.where(system = 'http://openelis.org/fhir/tag/storage-hierarchy').code = 'room' or partOf.exists()"

Profile: OpenELISStorageLocation
Parent: Location
Id: openelis-storage-location
Title: "OpenELIS Storage Location"
Description: "A level of the OpenELIS sample storage hierarchy: room, storage device (equipment), shelf, rack or box (StorageLocationFhirTransform). Served from /fhir/Location with read, create, update, delete and search (including _tag and _include=Location:partof). Every change is also mirrored to the FHIR store. The level is carried in meta.tag."
* obeys oe-storage-partof
* meta.tag 1..* MS
* meta.tag ^slicing.discriminator.type = #value
* meta.tag ^slicing.discriminator.path = "system"
* meta.tag ^slicing.rules = #open
* meta.tag contains level 1..1 MS
* meta.tag[level] ^short = "Storage hierarchy level"
* meta.tag[level].system 1..1
* meta.tag[level].system = "http://openelis.org/fhir/tag/storage-hierarchy"
* meta.tag[level].code 1..1
* meta.tag[level].code from OEStorageHierarchyVS (required)
* meta.profile ^comment = "OpenELIS sends http://ihe.net/fhir/StructureDefinition/IHE.mCSD.Location, which does not resolve to the published IHE mCSD profile (see Known Issues)."
* insert IdentifierSlicing
* identifier 1..* MS
* identifier contains code 1..1 MS
* identifier[code] ^short = "Hierarchical location path, for example MAIN-FRZ01-Shelf 1-Rack 2-B3"
* identifier[code] ^comment = "Room code, device code, then shelf, rack and box labels, joined with hyphens. A box without a label is BOX."
* identifier[code].system = "http://openelis.org/storage-location-code"
* identifier[code].value 1..1
* status 1..1 MS
* name 1..1 MS
* description MS
* mode 1..1
* mode = #instance
* physicalType 1..1 MS
* physicalType ^comment = "Room = ro. Device = ve (Vehicle). Shelf, rack and box = co (Corridor in FHIR, displayed by OpenELIS as Container). See Known Issues. physicalType.text names the level and is used on import when the tag is missing."
* type MS
* type ^comment = "Device: the device type from http://openelis.org/fhir/CodeSystem/storage-device-type. Box: the free-text box type with system http://openelis.org/fhir/CodeSystem/storage-box-type."
* partOf MS
* partOf only Reference(OpenELISStorageLocation)
* partOf ^comment = "Device -> room, shelf -> device, rack -> shelf, box -> rack."
* extension contains
    OEStorageTemperature named temperature 0..1 MS and
    OEStorageCapacity named capacity 0..1 MS and
    OEStorageDeviceIPAddress named ipAddress 0..1 and
    OEStorageDevicePort named port 0..1 and
    OEStorageDeviceProtocol named protocol 0..1 and
    OERackGridDimensions named gridDimensions 0..1 MS and
    OERackPositionSchemaHint named positionSchemaHint 0..1 and
    OEPositionOccupancy named occupied 0..1 MS

Mapping: OpenELISStorageLocationToOE
Source: OpenELISStorageLocation
Target: "https://github.com/DIGI-UW/OpenELIS-Global-2"
Id: oe-data-model
Title: "OpenELIS Global data model"
* -> "StorageRoom / StorageDevice / StorageShelf / StorageRack / StorageBox (StorageLocationFhirTransform)"
* id -> "fhirUuid of the storage entity"
* identifier[code] -> "code / label path"
* name -> "name / label"
* status -> "active"
* type -> "StorageDevice.deviceType / StorageBox.type"
* partOf -> "parent entity"
* extension[temperature] -> "StorageDevice.temperatureSetting"
* extension[capacity] -> "StorageDevice.capacityLimit / StorageShelf capacity / StorageBox rows x columns"
* extension[ipAddress] -> "StorageDevice.ipAddress"
* extension[port] -> "StorageDevice.port"
* extension[protocol] -> "StorageDevice.communicationProtocol"
* extension[gridDimensions] -> "StorageBox.rows / columns"
* extension[positionSchemaHint] -> "StorageBox.positionSchemaHint"
* extension[occupied] -> "StorageBox occupancy"

// ===========================================================================
// Shipment box (SupplyDelivery)
// ===========================================================================
Profile: OpenELISShipmentBox
Parent: SupplyDelivery
Id: openelis-shipment-box
Title: "OpenELIS Shipment Box"
Description: "A box of specimens shipped from one OpenELIS site to another (ShippingBoxFhirTransform). Written to the sender's FHIR store on creation and on every status change. The receiving OpenELIS polls each remote source for SupplyDelivery?status=in-progress (ShipmentFhirImportService). SupplyDelivery is not served from /fhir."
* insert IdentifierSlicing
* identifier 1..* MS
* identifier contains boxId 1..1 MS
* identifier[boxId] ^short = "Shipping box id"
* identifier[boxId].system = "http://openelis.org/shipment/box-id"
* identifier[boxId].value 1..1
* status 1..1 MS
* status ^comment = "Draft, ready to send, sent and in transit = in-progress. Received, partially received and reconciled = completed. Cancelled and lost in transit = abandoned. On reception the receiver sets the sender's copy to completed when org.openelisglobal.remote.source.updateStatus=true."
* type 0..1 MS
* type ^comment = "Currently http://terminology.hl7.org/CodeSystem/supply-item-type#medication with display 'Specimen Shipment' and text 'Specimen Shipment Box' (see Known Issues)."
* suppliedItem 1..1 MS
* suppliedItem.quantity 1..1 MS
* suppliedItem.quantity ^comment = "Number of items in the box, as {specimens} (UCUM)."
* suppliedItem.quantity.system = $UCUM
* suppliedItem.quantity.code = #{specimens}
* suppliedItem.item[x] only CodeableConcept
* suppliedItem.item[x] MS
* suppliedItem.item[x] ^comment = "SNOMED CT container type: site setting fhirContainerTypeCode, default 434711009 Specimen container."
* occurrence[x] only dateTime
* occurrence[x] MS
* occurrence[x] ^comment = "Sent date, else created date. The receiver ignores boxes older than org.openelisglobal.shipment.import.maxAgeDays (default 30)."
* supplier MS
* supplier only Reference(OpenELISOrganization)
* supplier ^short = "The sending site's Organization"
* destination MS
* destination ^comment = "A reference to a contained Location (#destination-facility) whose managingOrganization is the destination Organization."
* receiver ^comment = "Not set. The receiver falls back to receiver.display when looking up the destination by name."
* extension contains
    OEShipmentDestinationOrg named destinationOrg 0..1 MS and
    OEShipmentSourceOrg named sourceOrg 0..1 MS and
    OEShipmentTemperature named temperature 0..1 MS and
    OEShipmentCapacity named capacity 0..1 and
    OEShipmentNotes named notes 0..1 and
    OEShipmentContentItem named contentItem 0..* MS and
    OEShipmentNonConformity named nonConformity 0..* and
    OEShipmentSpecimen named specimen 0..* MS and
    OEShipmentSpecimenTypeSummary named typeSummary 0..* and
    OEEQACycle named eqaCycle 0..1

Mapping: OpenELISShipmentBoxToOE
Source: OpenELISShipmentBox
Target: "https://github.com/DIGI-UW/OpenELIS-Global-2"
Id: oe-data-model
Title: "OpenELIS Global data model"
* -> "ShippingBox (ShippingBoxFhirTransform)"
* id -> "ShippingBox.fhirUuid"
* identifier[boxId] -> "ShippingBox.boxId"
* status -> "ShippingBox.status"
* suppliedItem.quantity -> "count of BoxSampleItem"
* occurrence[x] -> "ShippingBox.sentDate (else createdDate)"
* supplier -> "Site Organization (SiteInformation siteOrganizationFhirUuid)"
* destination -> "Shipment destination Organization"
* extension[temperature] -> "ShippingBox.temperatureRequirement"
* extension[capacity] -> "ShippingBox.capacity"
* extension[notes] -> "ShippingBox.notes"
* extension[contentItem] -> "BoxSampleItem (accession number / sample type)"
* extension[nonConformity] -> "BoxSampleItem.receptionStatus"
* extension[specimen] -> "BoxSampleItem.sampleItem"
* extension[eqaCycle] -> "ShippingBox.eqaCycleId"
