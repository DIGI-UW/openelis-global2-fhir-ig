Profile: OpenELISServiceRequest
Parent: ServiceRequest
Id: openelis-service-request
Title: "OpenELIS Service Request"
Description: "OpenELIS service request"
* identifier 1..*
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains uuid 1..1 and labNo 1..1
* identifier[uuid].system = "http://openelis-global.org/analysis_uuid" 
* identifier[labNo].system = "http://openelis-global.org/samp_labNo"
* intent from OpenElisServiceRequestIntentVs
* status from OpenElisServiceRequestStatusVs
* code 1..1
* code.coding 1..*
* subject only Reference(OpenELISPatient)
* encounter only Reference(Encounter)
* locationReference 1..1
* locationReference only Reference(Location)
* priority  from OpenElisServiceRequestIntentVs
* category 0..1
* authoredOn 0..1
* note 0..1
* specimen 1..1
* specimen only Reference(OpenElisSpecimen)
* subject 1..1
* subject only Reference(OpenELISPatient)
* requester 1..1
* requester only Reference(OpenELISPractitioner)

