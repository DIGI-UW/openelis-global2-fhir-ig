Profile:        OpenELISPatient
Parent:         Patient
Id:             openelis-patient
Title:          "OpenELIS Patient"
Description:    "A patient used for OpenELIS FHIR Exchange"
* name 1..*
* identifier 1..*
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains nationalid 1..1  and subjectnumber 1..1 and stnumber 1..1 and guid 1..1 and uuid 1..1
* identifier[nationalid].system = "http://openelis-global.org/pat_nationalId" 
* identifier[subjectnumber].system = "http://openelis-global.org/pat_subjectNumber"
* identifier[stnumber].system = "http://openelis-global.org/pat_stNumber"
* identifier[guid].system = "http://openelis-global.org/pat_guid"
* identifier[uuid].system = "http://openelis-global.org/pat_uuid"
* name 1..1
* gender 1..1
* birthDate 1..1
* contact 0..1
* address 1..1

Instance: example-openelis-patient
InstanceOf: OpenELISPatient 
Usage: #example 
Description: "OpenELIS Patient Example"
Title:   "OpenELIS Patient Example Resource"
* id  = "329f09da-0fc9-419d-9575-ace68954426A"
* identifier[nationalid].system = "http://openelis-global.org/pat_nationalId"
* identifier[nationalid].value = "NA121212"
* identifier[subjectnumber].system = "http://openelis-global.org/pat_subjectNumber"
* identifier[subjectnumber].value = "121213"
* identifier[stnumber].system = "http://openelis-global.org/pat_stNumber"
* identifier[stnumber].value = "121214"
* identifier[guid].system = "http://openelis-global.org/pat_guid"
* identifier[guid].value = "329f09da-0fc9-419d-9575-ace689544229"
* identifier[uuid].system = "http://openelis-global.org/pat_uuid"
* identifier[uuid].value = "329f09da-0fc9-419d-9575-ace689544269"
* birthDate = "1988-03-02"
* gender = #female
* active = true
* name.family = "Mutesa"
* name.given = "moses"
* address[+].line = "KING"
* address[=].state = "WASHINGTON"
* address[=].city = "GREENWOOD"
* address[=].postalCode = "98103"

Mapping: OpenELISPatientMapping 
Source: OpenELISPatient
Target: "http://i-tech-uw.github.io/openelis-global-ig/StructureDefinition/open-elis-patient"
Id: open-elis-patient-mapping
Title: "OpenELIS Vs FHIR"
Description: "Patient Mapping shows how attributes of FHIR Patient Resource maps to and from the attributes of OpenElis Patient Object."
* -> "OE Patient" "This profile maps FHIR Patient Resource to OE DataExchange."
* id -> "Patient.fhirUuid"
* identifier.value -> "Patient.nationalId"
* identifier.value -> "Patient.subjectNumber"
* name -> "Patient.name.given"
* name -> "Patient.name.family"
* birthDate -> "Patient.birthDateForDisplay"
* gender -> "Patient.gender"
* contact -> "Patient.person.primaryPhone"
* address -> "PersonAddress"