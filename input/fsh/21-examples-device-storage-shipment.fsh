// Analyzer, storage hierarchy and shipment examples. All fictional.

Instance: ExampleAnalyzerDevice
InstanceOf: OpenELISAnalyzerDevice
Usage: #example
Title: "Analyzer Device"
Description: "A chemistry analyzer connected through the OpenELIS analyzer bridge."
* id = "ff2b5d6a-ff46-5f20-b254-4eaa0615d555"
* identifier[analyzerUuid].use = #usual
* identifier[analyzerUuid].system = "http://openelis-global.org/analyzer_uuid"
* identifier[analyzerUuid].value = "ff2b5d6a-ff46-5f20-b254-4eaa0615d555"
* identifier[bridgeConnection].use = #usual
* identifier[bridgeConnection].system = "http://openelis-global.org/analyzer_bridge_connection"
* identifier[bridgeConnection].value = "chem-01"
* extension[lastActivated].valueDateTime = "2026-09-01T07:30:00+10:00"
* extension[testUnits].extension[testUnitId][0].valueString = "36"
* extension[testUnits].extension[testUnitId][1].valueString = "41"
* extension[operationalStatus].valueCode = #ACTIVE
* status = #active
* deviceName.name = "Chemistry Analyzer 1"
* deviceName.type = #user-friendly-name
* type.text = "astm-chemistry-generic"
* owner.identifier.use = #official
* owner.identifier.system = "http://openelis-global.org/facility_id"
* owner.identifier.value = "EDH-LAB"
* owner.identifier.assigner = Reference(ExampleSiteOrganization)

// ---------------------------------------------------------------------------
// Storage hierarchy: room > freezer > shelf > rack > box
// ---------------------------------------------------------------------------
Instance: ExampleStorageRoom
InstanceOf: OpenELISStorageLocation
Usage: #example
Title: "Storage level: room"
Description: "Top of the storage hierarchy."
* id = "1fa151e6-afa2-531c-b70c-fd63b88c10f0"
* meta.profile = "http://ihe.net/fhir/StructureDefinition/IHE.mCSD.Location"
* meta.tag[level] = http://openelis.org/fhir/tag/storage-hierarchy#room "Room"
* identifier[code].system = "http://openelis.org/storage-location-code"
* identifier[code].value = "MAIN"
* status = #active
* name = "Main laboratory storage"
* description = "Ground floor, room 014"
* mode = #instance
* physicalType = $LocPhysType#ro "Room"
* physicalType.text = "Storage Room"

Instance: ExampleStorageFreezer
InstanceOf: OpenELISStorageLocation
Usage: #example
Title: "Storage level: device (freezer)"
Description: "A monitored -80 freezer in the room. The physicalType follows the recommended fix for Known Issue 17. OpenELIS currently sends ve (Vehicle)."
* id = "3d2a1373-14d8-5bef-ae7e-817917e5a4fd"
* meta.profile = "http://ihe.net/fhir/StructureDefinition/IHE.mCSD.Location"
* meta.tag[level] = http://openelis.org/fhir/tag/storage-hierarchy#device "Device"
* identifier[code].system = "http://openelis.org/storage-location-code"
* identifier[code].value = "MAIN-FRZ01"
* status = #active
* name = "Freezer 01 (-80)"
* mode = #instance
* physicalType = $LocPhysType#ca "Cabinet"
* physicalType.text = "Storage Equipment"
* type = http://openelis.org/fhir/CodeSystem/storage-device-type#freezer "Freezer"
* partOf = Reference(ExampleStorageRoom)
* extension[temperature].valueDecimal = -80
* extension[capacity].valueInteger = 5
* extension[ipAddress].valueString = "10.20.0.41"
* extension[port].valueInteger = 502
* extension[protocol].valueString = "Modbus TCP"

Instance: ExampleStorageShelf
InstanceOf: OpenELISStorageLocation
Usage: #example
Title: "Storage level: shelf"
Description: "A shelf in the freezer. The physicalType follows the recommended fix for Known Issue 17. OpenELIS currently sends co with the display Container."
* id = "8264f454-03c2-597b-996d-b9ea0998f326"
* meta.profile = "http://ihe.net/fhir/StructureDefinition/IHE.mCSD.Location"
* meta.tag[level] = http://openelis.org/fhir/tag/storage-hierarchy#shelf "Shelf"
* identifier[code].system = "http://openelis.org/storage-location-code"
* identifier[code].value = "MAIN-FRZ01-Shelf 1"
* status = #active
* name = "Shelf 1"
* mode = #instance
* physicalType.text = "Storage Shelf"
* partOf = Reference(ExampleStorageFreezer)
* extension[capacity].valueInteger = 4

Instance: ExampleStorageRack
InstanceOf: OpenELISStorageLocation
Usage: #example
Title: "Storage level: rack"
Description: "A rack on the shelf. The physicalType follows the recommended fix for Known Issue 17. OpenELIS currently sends co with the display Container."
* id = "5a9cc354-9495-5090-91d7-b67b0d2ef5dc"
* meta.profile = "http://ihe.net/fhir/StructureDefinition/IHE.mCSD.Location"
* meta.tag[level] = http://openelis.org/fhir/tag/storage-hierarchy#rack "Rack"
* identifier[code].system = "http://openelis.org/storage-location-code"
* identifier[code].value = "MAIN-FRZ01-Shelf 1-Rack 2"
* status = #active
* name = "Rack 2"
* mode = #instance
* physicalType.text = "Storage Rack"
* partOf = Reference(ExampleStorageShelf)

Instance: ExampleStorageBox
InstanceOf: OpenELISStorageLocation
Usage: #example
Title: "Storage level: box"
Description: "A 9 x 9 cryobox in the rack. The physicalType follows the recommended fix for Known Issue 17. OpenELIS currently sends co with the display Container."
* id = "613ff118-ceeb-5472-9793-dc241d0d032c"
* meta.profile = "http://ihe.net/fhir/StructureDefinition/IHE.mCSD.Location"
* meta.tag[level] = http://openelis.org/fhir/tag/storage-hierarchy#box "Box"
* identifier[code].system = "http://openelis.org/storage-location-code"
* identifier[code].value = "MAIN-FRZ01-Shelf 1-Rack 2-B3"
* status = #active
* name = "B3"
* mode = #instance
* physicalType.text = "Storage Box"
* type = http://openelis.org/fhir/CodeSystem/storage-box-type#cryobox
* type.text = "cryobox"
* partOf = Reference(ExampleStorageRack)
* extension[gridDimensions].valueString = "9 × 9"
* extension[capacity].valueInteger = 81
* extension[positionSchemaHint].valueString = "letter-number"
* extension[occupied].valueBoolean = true

// ---------------------------------------------------------------------------
// Shipment box
// ---------------------------------------------------------------------------
Instance: ExampleDestinationLocation
InstanceOf: Location
Usage: #inline
* id = "destination-facility"
* name = "National Reference Laboratory"
* managingOrganization = Reference(ExampleReferenceLab)
* managingOrganization.display = "National Reference Laboratory"

Instance: ExampleShipmentBox
InstanceOf: OpenELISShipmentBox
Usage: #example
Title: "Shipment box (sent)"
Description: "A box with one specimen sent to the reference laboratory. type is omitted, the recommended fix for Known Issue 4. OpenELIS currently sends supply-item-type#medication with the display Specimen Shipment, which fails the required binding."
* id = "0e8e2c05-d198-51b0-8fa2-ac80c118c73e"
* contained[0] = ExampleDestinationLocation
* identifier[boxId].system = "http://openelis.org/shipment/box-id"
* identifier[boxId].value = "BOX-2026-0091"
* status = #in-progress
* suppliedItem.quantity.value = 1
* suppliedItem.quantity.unit = "specimens"
* suppliedItem.quantity.system = $UCUM
* suppliedItem.quantity.code = #{specimens}
* suppliedItem.itemCodeableConcept = $SCT#434711009 "Specimen container"
* occurrenceDateTime = "2026-09-28T15:10:00+10:00"
* supplier = Reference(ExampleSiteOrganization)
* destination.reference = "#destination-facility"
* destination.display = "National Reference Laboratory"
* extension[destinationOrg].valueString = "32a104cd-6337-5d1b-b1a9-6849e98b2200"
* extension[sourceOrg].valueString = "Example District Hospital Laboratory"
* extension[temperature].valueString = "2-8 °C"
* extension[capacity].valueInteger = 50
* extension[notes].valueString = "Confirmatory testing"
* extension[contentItem][0].extension[label].valueString = "EDH26000000417"
* extension[contentItem][0].extension[type].valueString = "Serum"
* extension[specimen][0].valueReference = Reference(ExampleSpecimen)
* extension[specimen][0].valueReference.display = "Serum"
* extension[typeSummary][0].extension[type].valueString = "Serum"
* extension[typeSummary][0].extension[count].valueInteger = 1
