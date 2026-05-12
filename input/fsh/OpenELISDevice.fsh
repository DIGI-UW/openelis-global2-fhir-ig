
Extension: AnalyzerCommunicationMode
Id: analyzer-communication-mode
Title: "Analyzer Communication Mode"
* value[x] only CodeableConcept

Extension: AnalyzerProtocolVersion
Id: analyzer-protocol-version
Title: "Analyzer Protocol Version"
* value[x] only CodeableConcept

Extension: AnalyzerTransportDetails
Id: analyzer-transport-details
Title: "Analyzer Transport Details"
* extension contains
    ipAddress 0..1 and
    port 0..1 and
    importDirectory 0..1 and
    filePattern 0..1 and
    fileFormat 0..1 and
    delimiter 0..1 and
    hasHeader 0..1 and
    skipRows 0..1

Extension: AnalyzerLocation
Id: analyzer-location
* value[x] only string

Extension: AnalyzerIdentifierPattern
Id: analyzer-identifier-pattern
* value[x] only string

Extension: AnalyzerLastActivated
Id: analyzer-last-activated
* value[x] only dateTime

Extension: AnalyzerTestUnits
Id: analyzer-test-units
* extension contains testUnitId 0..*
* extension[testUnitId].value[x] only string


Profile: OpenELISDevice
Parent: Device
Id: open-elis-device
Title: "OpenELIS Device"
Description: "FHIR Device representing OpenELIS Analyzer"

* identifier 1..*
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    uuid 1..1 and
    machineId 0..1 and
    sourceId 0..1

* identifier[uuid].system 1..1
* identifier[uuid].value 1..1

* deviceName 1..1
* deviceName.name 1..1
* deviceName.type 1..1

* type 1..1

* status 0..1

* serialNumber 0..1

* owner 1..1

* note 0..*

* extension contains
    AnalyzerCommunicationMode named communicationMode 0..1 and
    AnalyzerProtocolVersion named protocolVersion 0..1 and
    AnalyzerTransportDetails named transport 0..1 and
    AnalyzerLocation named location 0..1 and
    AnalyzerIdentifierPattern named identifierPattern 0..1 and
    AnalyzerLastActivated named lastActivated 0..1 and
    AnalyzerTestUnits named testUnits 0..1


Mapping: OpenELISDeviceMapping
Source: OpenELISDevice
Target: "Analyzer"
Id: oe-device-mapping
Title: "Device to Analyzer Mapping"

* identifier[uuid] -> "Analyzer.fhirUuid"
* identifier[machineId] -> "Analyzer.machineId"
* identifier[sourceId] -> "Analyzer.discoveredSourceId"

* deviceName.name -> "Analyzer.name"
* deviceName.type -> "Analyzer.nameType"

* type -> "Analyzer.AnalyzerType.name"

* status -> "Analyzer.AnalyzerStatus"

* serialNumber -> "Analyzer.machineId"

* owner -> "Analyzer.Organization"

* note -> "Analyzer.description"

* extension[communicationMode] -> "Analyzer.communicationMode"
* extension[protocolVersion] -> "Analyzer.protocolVersion"
* extension[transport].extension[ipAddress] -> "Analyzer.ipAddress"
* extension[transport].extension[port] -> "Analyzer.port"
* extension[transport].extension[importDirectory] -> "Analyzer.importDirectory"
* extension[transport].extension[filePattern] -> "Analyzer.filePattern"
* extension[transport].extension[fileFormat] -> "Analyzer.fileFormat"
* extension[transport].extension[delimiter] -> "Analyzer.delimiter"
* extension[transport].extension[hasHeader] -> "Analyzer.hasHeader"
* extension[transport].extension[skipRows] -> "Analyzer.skipRows"
* extension[location] -> "Analyzer.location"
* extension[identifierPattern] -> "Analyzer.identifierPattern"
* extension[lastActivated] -> "Analyzer.lastActivatedDate"
* extension[testUnits].extension[testUnitId] -> "Analyzer.testUnitIds"

Instance: OpenELISDeviceExample
InstanceOf: OpenELISDevice
Usage: #example

* identifier[uuid].system = "http://openelis-global.org/analyzer_uuid"
* identifier[uuid].value = "6f5f7a6b-89b2-4a7d-a2c2-77ef66a9f1b2"

* identifier[machineId].system = "http://openelis-global.org/analyzer_machineId"
* identifier[machineId].value = "XN-1000-4589"

* identifier[sourceId].system = "http://openelis-global.org/analyzer_sourceId"
* identifier[sourceId].value = "DISCOVERY-192.168.1.10"

* deviceName.name = "Sysmex XN-1000"
* deviceName.type = #user-friendly-name

* type.text = "Hematology Analyzer"

* status = #active

* serialNumber = "XN-1000-4589"

* owner.identifier.system = "http://openelis-global.org/facility"
* owner.identifier.value = "TEST LIMS"

* note.text = "Primary hematology analyzer"