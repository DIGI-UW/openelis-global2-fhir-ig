Profile: OpenELISLocation
Parent: Location
Id: open-elis-location
Title: "OpenELIS Facility Location"
Description: "A Location Resource used for FHIR Exchange"
* name 0..1
* description 0..1

Instance: LocationExample
InstanceOf: OpenELISLocation
Usage: #example
Title: "Location Example"
Description: "Health Facility Location example resource"
* name = "Outpatient Clinic"
* description = "Outpatient Clinic"
