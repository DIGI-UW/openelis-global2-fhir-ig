// A single worked scenario, end to end:
// 1. Riverside Health Centre's EMR orders glucose and HBsAg for a patient.
// 2. OpenELIS at the Example District Hospital Laboratory imports the order,
//    collects one serum sample, runs both tests and validates the results.
// 3. HBsAg is also referred to the National Reference Laboratory for confirmation.
// All people, places and identifiers are fictional.

// ---------------------------------------------------------------------------
// Organizations and people
// ---------------------------------------------------------------------------
Instance: ExampleSiteOrganization
InstanceOf: OpenELISOrganization
Usage: #example
Title: "Site Organization: Example District Hospital Laboratory"
Description: "The OpenELIS site's own facility Organization as pushed to the FHIR store at start-up (FhirFacilityOrganizationServiceImpl). It is the assigner of every facility identifier."
* id = "a845f2db-10e5-5117-ac75-553f615e301a"
* identifier[facility].use = #official
* identifier[facility].system = "http://openelis-global.org/facility_id"
* identifier[facility].value = "EDH-LAB"
* active = true
* name = "Example District Hospital Laboratory"
* address.use = #work
* address.city = "Riverside"
* address.district = "Central District"
* address.country = "XX"

Instance: ExampleReferringOrganization
InstanceOf: OpenELISOrganization
Usage: #example
Title: "Referring site: Riverside Health Centre"
Description: "A referring clinic configured in OpenELIS."
* id = "d3619aef-5abf-5b4f-a76c-06f378deca13"
* identifier[code].system = "http://openelis-global.org/org_code"
* identifier[code].value = "RHC01"
* identifier[shortName].system = "http://openelis-global.org/org_shortName"
* identifier[shortName].value = "Riverside HC"
* identifier[uuid].system = "http://openelis-global.org/org_uuid"
* identifier[uuid].value = "d3619aef-5abf-5b4f-a76c-06f378deca13"
* identifier[facility].system = "http://openelis-global.org/facility_id"
* identifier[facility].value = "EDH-LAB"
* identifier[facility].assigner = Reference(ExampleSiteOrganization)
* active = true
* name = "Riverside Health Centre"
* type[0].text = "Referring clinic"
* type[0].coding[oeType].system = "http://openelis-global.org/orgType"
* type[0].coding[oeType].code = #referringClinic
* address.line = "12 Market Road"
* address.city = "Riverside"

Instance: ExampleReferenceLab
InstanceOf: OpenELISOrganization
Usage: #example
Title: "Reference laboratory: National Reference Laboratory"
Description: "The laboratory tests are referred to."
* id = "32a104cd-6337-5d1b-b1a9-6849e98b2200"
* identifier[code].system = "http://openelis-global.org/org_code"
* identifier[code].value = "NRL"
* identifier[uuid].system = "http://openelis-global.org/org_uuid"
* identifier[uuid].value = "32a104cd-6337-5d1b-b1a9-6849e98b2200"
* identifier[facility].system = "http://openelis-global.org/facility_id"
* identifier[facility].value = "EDH-LAB"
* identifier[facility].assigner = Reference(ExampleSiteOrganization)
* active = true
* name = "National Reference Laboratory"
* type[0].text = "Reference laboratory"
* type[0].coding[oeType].system = "http://openelis-global.org/orgType"
* type[0].coding[oeType].code = #referralLab

Instance: ExamplePractitioner
InstanceOf: OpenELISPractitioner
Usage: #example
Title: "Requesting provider"
Description: "The clinician who ordered the tests."
* id = "cc90c222-c1fa-5cb0-bb01-a2b35ac26244"
* identifier[uuid].use = #usual
* identifier[uuid].system = "http://openelis-global.org/provider_uuid"
* identifier[uuid].value = "cc90c222-c1fa-5cb0-bb01-a2b35ac26244"
* identifier[facility].use = #official
* identifier[facility].system = "http://openelis-global.org/facility_id"
* identifier[facility].value = "EDH-LAB"
* identifier[facility].assigner = Reference(ExampleSiteOrganization)
* active = true
* name.family = "Mensah"
* name.given = "Kofi"
* name.prefix = "Dr"
* telecom.system = #phone
* telecom.value = "+000 555 0101"
* telecom.use = #mobile

Instance: ExamplePatient
InstanceOf: OpenELISPatient
Usage: #example
Title: "Patient"
Description: "A patient as OpenELIS publishes it. A patient received with an EMR order keeps the EMR's Patient id as its OpenELIS FHIR UUID."
* id = "5b6f3f86-2a44-4c3c-9d0c-6f0c4a2d7e11"
* identifier[subjectNumber].use = #usual
* identifier[subjectNumber].system = "http://openelis-global.org/pat_subjectNumber"
* identifier[subjectNumber].value = "RHC-2026-00417"
* identifier[nationalId].use = #official
* identifier[nationalId].system = "http://openelis-global.org/pat_nationalId"
* identifier[nationalId].value = "NID-000-123-456"
* identifier[uuid].use = #usual
* identifier[uuid].system = "http://openelis-global.org/pat_uuid"
* identifier[uuid].value = "5b6f3f86-2a44-4c3c-9d0c-6f0c4a2d7e11"
* identifier[guid].use = #usual
* identifier[guid].system = "http://openelis-global.org/pat_guid"
* identifier[guid].value = "dd63810d-c44b-52b6-b70d-0d8e60533c6d"
* identifier[facility].use = #official
* identifier[facility].system = "http://openelis-global.org/facility_id"
* identifier[facility].value = "EDH-LAB"
* identifier[facility].assigner = Reference(ExampleSiteOrganization)
* name.use = #official
* name.family = "Banda"
* name.given = "Grace"
* gender = #female
* birthDate = "1991-04"
* telecom.system = #phone
* telecom.value = "+000 555 0199"
* telecom.use = #mobile
* address.line[0] = "Plot 7, Hill Street"
* address.line[1] = "commune: Riverside North"
* address.city = "Riverside"
* address.country = "XX"

// ---------------------------------------------------------------------------
// 1. The EMR's order (what OpenELIS polls for)
// ---------------------------------------------------------------------------
Instance: ExampleOpenELISServiceUser
InstanceOf: Practitioner
Usage: #example
Title: "EMR service user representing OpenELIS"
Description: "The Practitioner in the EMR that stands for OpenELIS. Its reference is the value of org.openelisglobal.remote.source.identifier (Practitioner/0f1c6d3a-...) and the owner of every Task OpenELIS should pick up."
* id = "0f1c6d3a-6b6e-4a55-9a77-5b1b1b0b3e21"
* name.text = "OpenELIS service user"

Instance: ExampleEmrOrderTask
InstanceOf: OpenELISLabOrderRequestTask
Usage: #example
Title: "EMR lab order Task"
Description: "Written by the EMR to the shared FHIR server. OpenELIS finds it with Task?status=requested&owner=Practitioner/0f1c6d3a-6b6e-4a55-9a77-5b1b1b0b3e21."
* id = "07ed1bd1-1bdf-58ae-a661-ee0703fcab70"
* status = #requested
* intent = #order
* owner = Reference(ExampleOpenELISServiceUser)
* owner.display = "OpenELIS service user"
* basedOn[0] = Reference(ExampleEmrServiceRequestGlucose)
* basedOn[1] = Reference(ExampleEmrServiceRequestHBsAg)
* for.reference = "Patient/5b6f3f86-2a44-4c3c-9d0c-6f0c4a2d7e11"
* for.display = "Grace Banda"
* authoredOn = "2026-09-28T08:15:00+10:00"

Instance: ExampleEmrServiceRequestGlucose
InstanceOf: OpenELISLabOrderRequestServiceRequest
Usage: #example
Title: "EMR ServiceRequest: glucose"
Description: "The EMR's test order. OpenELIS matches the test by the LOINC coding."
* id = "35acd1d2-f076-5434-9105-683254702ff1"
* identifier.system = "http://emr.example.org/order"
* identifier.value = "ORD-88213"
* status = #active
* intent = #order
* priority = #routine
* code.coding[loinc] = $LOINC#2345-7 "Glucose [Mass/volume] in Serum or Plasma"
* code.coding[1].system = "https://openconceptlab.org/orgs/CIEL/sources/CIEL"
* code.coding[1].code = #887
* subject.reference = "Patient/5b6f3f86-2a44-4c3c-9d0c-6f0c4a2d7e11"
* requester.display = "Dr Kofi Mensah (EMR practitioner record)"

Instance: ExampleEmrServiceRequestHBsAg
InstanceOf: OpenELISLabOrderRequestServiceRequest
Usage: #example
Title: "EMR ServiceRequest: HBsAg"
Description: "The EMR's test order. OpenELIS matches the test by the LOINC coding."
* id = "24224471-e4bb-58c0-acbf-b6180b053e05"
* identifier.system = "http://emr.example.org/order"
* identifier.value = "ORD-88214"
* status = #active
* intent = #order
* priority = #routine
* code.coding[loinc] = $LOINC#5196-1 "Hepatitis B virus surface Ag [Presence] in Serum or Plasma by Immunoassay"
* subject.reference = "Patient/5b6f3f86-2a44-4c3c-9d0c-6f0c4a2d7e11"
* requester.display = "Dr Kofi Mensah (EMR practitioner record)"

// ---------------------------------------------------------------------------
// 2. What OpenELIS produces
// ---------------------------------------------------------------------------
Instance: ExampleOrderTask
InstanceOf: OpenELISOrderTask
Usage: #example
Title: "OpenELIS order Task (finished)"
Description: "OpenELIS's Task for the order, once finished: one output per test."
* id = "ed860000-5fab-5072-a257-83bbe38c27f4"
* identifier[orderUuid].use = #usual
* identifier[orderUuid].system = "http://openelis-global.org/order_uuid"
* identifier[orderUuid].value = "ed860000-5fab-5072-a257-83bbe38c27f4"
* identifier[accessionNumber].use = #usual
* identifier[accessionNumber].system = "http://openelis-global.org/order_accessionNumber"
* identifier[accessionNumber].value = "EDH26000000417"
* partOf = Reference(ExampleEmrOrderTask)
* status = #completed
* intent = #order
* priority = #routine
* authoredOn = "2026-09-28T09:02:11+10:00"
* basedOn[0] = Reference(ExampleServiceRequestGlucose)
* basedOn[1] = Reference(ExampleServiceRequestHBsAg)
* for = Reference(ExamplePatient)
* output[0].type.coding.code = #reference
* output[0].valueReference = Reference(ExampleDiagnosticReportGlucose)
* output[1].type.coding.code = #reference
* output[1].valueReference = Reference(ExampleDiagnosticReportHBsAg)

Instance: ExampleServiceRequestGlucose
InstanceOf: OpenELISServiceRequest
Usage: #example
Title: "OpenELIS ServiceRequest: glucose"
Description: "One ordered test. The id is the Analysis UUID."
* id = "48549f60-c400-5510-97da-2e2497627e81"
* identifier[analysisUuid].use = #usual
* identifier[analysisUuid].system = "http://openelis-global.org/analysis_uuid"
* identifier[analysisUuid].value = "48549f60-c400-5510-97da-2e2497627e81"
* identifier[facility].use = #official
* identifier[facility].system = "http://openelis-global.org/facility_id"
* identifier[facility].value = "EDH-LAB"
* identifier[facility].assigner = Reference(ExampleSiteOrganization)
* requisition.use = #usual
* requisition.system = "http://openelis-global.org/samp_labNo"
* requisition.value = "EDH26000000417"
* status = #completed
* intent = #order
* category.coding.system = "http://openelis-global.org/samp_domain"
* category.coding.code = #H
* category.coding.display = "H"
* priority = #routine
* code.coding[0] = $LOINC#2345-7 "Glucose [Mass/volume] in Serum or Plasma"
* code.text = "Glucose"
* subject = Reference(ExamplePatient)
* authoredOn = "2026-09-28T11:40:00+10:00"
* requester = Reference(ExamplePractitioner)
* specimen = Reference(ExampleSpecimen)

Instance: ExampleServiceRequestHBsAg
InstanceOf: OpenELISServiceRequest
Usage: #example
Title: "OpenELIS ServiceRequest: HBsAg"
Description: "One ordered test. The id is the Analysis UUID."
* id = "3b2c3407-5430-5878-9c61-c4c9b9c013c4"
* identifier[analysisUuid].use = #usual
* identifier[analysisUuid].system = "http://openelis-global.org/analysis_uuid"
* identifier[analysisUuid].value = "3b2c3407-5430-5878-9c61-c4c9b9c013c4"
* identifier[facility].use = #official
* identifier[facility].system = "http://openelis-global.org/facility_id"
* identifier[facility].value = "EDH-LAB"
* identifier[facility].assigner = Reference(ExampleSiteOrganization)
* requisition.use = #usual
* requisition.system = "http://openelis-global.org/samp_labNo"
* requisition.value = "EDH26000000417"
* status = #completed
* intent = #order
* category.coding.system = "http://openelis-global.org/samp_domain"
* category.coding.code = #H
* category.coding.display = "H"
* priority = #routine
* code.coding[0] = $LOINC#5196-1 "Hepatitis B virus surface Ag [Presence] in Serum or Plasma by Immunoassay"
* code.text = "HBsAg"
* subject = Reference(ExamplePatient)
* authoredOn = "2026-09-28T11:40:00+10:00"
* requester = Reference(ExamplePractitioner)
* specimen = Reference(ExampleSpecimen)

Instance: ExampleSpecimen
InstanceOf: OpenELISSpecimen
Usage: #example
Title: "OpenELIS Specimen: serum"
Description: "The serum sample item both tests run on, with GPS collection location."
* id = "97b37d86-fd55-529b-bbd7-4766f3988fab"
* identifier[sampleItemUuid].use = #usual
* identifier[sampleItemUuid].system = "http://openelis-global.org/sampleItem_uuid"
* identifier[sampleItemUuid].value = "97b37d86-fd55-529b-bbd7-4766f3988fab"
* identifier[facility].use = #official
* identifier[facility].system = "http://openelis-global.org/facility_id"
* identifier[facility].value = "EDH-LAB"
* identifier[facility].assigner = Reference(ExampleSiteOrganization)
* accessionIdentifier.use = #usual
* accessionIdentifier.system = "http://openelis-global.org/sampleItem_labNo"
* accessionIdentifier.value = "EDH26000000417-1"
* status = #available
* type.coding[oeSampleType].system = "http://openelis-global.org/sampleType"
* type.coding[oeSampleType].code = #Serum
* type.coding[oeSampleType].display = "Serum"
* type.coding[1] = $SCT#119364003 "Serum specimen"
* subject = Reference(ExamplePatient)
* receivedTime = "2026-09-28T09:30:00+10:00"
* request[0] = Reference(ExampleServiceRequestGlucose)
* request[1] = Reference(ExampleServiceRequestHBsAg)
* collection.collectedDateTime = "2026-09-28T08:40:00+10:00"
* collection.extension[gps].extension[latitude].valueDecimal = -9.4431
* collection.extension[gps].extension[longitude].valueDecimal = 147.1803
* collection.extension[gps].extension[accuracy].valueInteger = 12
* collection.extension[gps].extension[method].valueCode = #device
* collection.extension[gps].extension[captureTimestamp].valueDateTime = "2026-09-28T08:40:12+10:00"
* collection.bodySite.text = "Venous blood"
* container.type = $SCT#434711009 "Specimen container (physical object)"
* container.specimenQuantity.value = 5
* container.specimenQuantity.system = $UCUM
* container.specimenQuantity.code = #mL

Instance: ExampleObservationGlucose
InstanceOf: OpenELISObservation
Usage: #example
Title: "OpenELIS Observation: glucose (numeric)"
Description: "A validated numeric result produced on an analyzer."
* id = "b73bf11f-06ff-55ad-935d-476bc270350a"
* identifier[resultUuid].use = #usual
* identifier[resultUuid].system = "http://openelis-global.org/result_uuid"
* identifier[resultUuid].value = "b73bf11f-06ff-55ad-935d-476bc270350a"
* identifier[facility].use = #official
* identifier[facility].system = "http://openelis-global.org/facility_id"
* identifier[facility].value = "EDH-LAB"
* identifier[facility].assigner = Reference(ExampleSiteOrganization)
* status = #final
* code.coding[0] = $LOINC#2345-7 "Glucose [Mass/volume] in Serum or Plasma"
* code.text = "Glucose"
* subject = Reference(ExamplePatient)
* basedOn = Reference(ExampleServiceRequestGlucose)
* specimen = Reference(ExampleSpecimen)
* effectiveDateTime = "2026-09-28T13:05:00+10:00"
* issued = "2026-09-28T13:05:00+10:00"
* valueQuantity.value = 92
* valueQuantity.unit = "mg/dL"
* performer = Reference(ExamplePractitioner)
* device = Reference(ExampleAnalyzerDevice)

Instance: ExampleObservationHBsAg
InstanceOf: OpenELISObservation
Usage: #example
Title: "OpenELIS Observation: HBsAg (coded)"
Description: "A validated dictionary (coded) result: a LOINC answer coding plus the OpenELIS dictionary entry."
* id = "8330c79d-ccd9-5ef4-876d-2b176e5e86a5"
* identifier[resultUuid].use = #usual
* identifier[resultUuid].system = "http://openelis-global.org/result_uuid"
* identifier[resultUuid].value = "8330c79d-ccd9-5ef4-876d-2b176e5e86a5"
* identifier[facility].use = #official
* identifier[facility].system = "http://openelis-global.org/facility_id"
* identifier[facility].value = "EDH-LAB"
* identifier[facility].assigner = Reference(ExampleSiteOrganization)
* status = #final
* code.coding[0] = $LOINC#5196-1 "Hepatitis B virus surface Ag [Presence] in Serum or Plasma by Immunoassay"
* code.text = "HBsAg"
* subject = Reference(ExamplePatient)
* basedOn = Reference(ExampleServiceRequestHBsAg)
* specimen = Reference(ExampleSpecimen)
* effectiveDateTime = "2026-09-28T14:20:00+10:00"
* issued = "2026-09-28T14:20:00+10:00"
* valueCodeableConcept.coding[0] = $LOINC#LA6577-6 "Negative"
* valueCodeableConcept.coding[1].system = "http://openelis-global.org/dictionary_entry"
* valueCodeableConcept.coding[1].code = #Negative
* valueCodeableConcept.coding[1].display = "Negative"

Instance: ExampleDiagnosticReportGlucose
InstanceOf: OpenELISDiagnosticReport
Usage: #example
Title: "OpenELIS DiagnosticReport: glucose"
Description: "The report for the glucose test. Same id as its ServiceRequest (both are the Analysis UUID)."
* id = "48549f60-c400-5510-97da-2e2497627e81"
* identifier[analysisResultUuid].use = #usual
* identifier[analysisResultUuid].system = "http://openelis-global.org/analysisResult_uuid"
* identifier[analysisResultUuid].value = "48549f60-c400-5510-97da-2e2497627e81"
* identifier[facility].use = #official
* identifier[facility].system = "http://openelis-global.org/facility_id"
* identifier[facility].value = "EDH-LAB"
* identifier[facility].assigner = Reference(ExampleSiteOrganization)
* status = #final
* code.coding[0] = $LOINC#2345-7 "Glucose [Mass/volume] in Serum or Plasma"
* code.text = "Glucose"
* basedOn = Reference(ExampleServiceRequestGlucose)
* subject = Reference(ExamplePatient)
* specimen = Reference(ExampleSpecimen)
* result = Reference(ExampleObservationGlucose)

Instance: ExampleDiagnosticReportHBsAg
InstanceOf: OpenELISDiagnosticReport
Usage: #example
Title: "OpenELIS DiagnosticReport: HBsAg"
Description: "The report for the HBsAg test."
* id = "3b2c3407-5430-5878-9c61-c4c9b9c013c4"
* identifier[analysisResultUuid].use = #usual
* identifier[analysisResultUuid].system = "http://openelis-global.org/analysisResult_uuid"
* identifier[analysisResultUuid].value = "3b2c3407-5430-5878-9c61-c4c9b9c013c4"
* identifier[facility].use = #official
* identifier[facility].system = "http://openelis-global.org/facility_id"
* identifier[facility].value = "EDH-LAB"
* identifier[facility].assigner = Reference(ExampleSiteOrganization)
* status = #final
* code.coding[0] = $LOINC#5196-1 "Hepatitis B virus surface Ag [Presence] in Serum or Plasma by Immunoassay"
* code.text = "HBsAg"
* basedOn = Reference(ExampleServiceRequestHBsAg)
* subject = Reference(ExamplePatient)
* specimen = Reference(ExampleSpecimen)
* result = Reference(ExampleObservationHBsAg)

// ---------------------------------------------------------------------------
// 3. Referral to the reference laboratory
// ---------------------------------------------------------------------------
Instance: ExampleReferralTask
InstanceOf: OpenELISReferralTask
Usage: #example
Title: "Referral Task (requested)"
Description: "HBsAg referred for confirmation. The reference lab's OpenELIS picks it up by polling."
* id = "1adff0e3-109a-55fe-b3b7-74736ef4ff6d"
* status = #requested
* intent = #order
* owner = Reference(ExampleReferenceLab)
* requester = Reference(ExamplePractitioner)
* reasonCode.coding.system = "http://openelis-global.org/refer_reason"
* for = Reference(ExamplePatient)
* basedOn = Reference(ExampleServiceRequestHBsAg)
* focus = Reference(ExampleServiceRequestHBsAg)
* description = "referring accession number EDH26000000417 from Practitioner/cc90c222-c1fa-5cb0-bb01-a2b35ac26244 to Organization/32a104cd-6337-5d1b-b1a9-6849e98b2200"
* authoredOn = "2026-09-28T14:30:00+10:00"
