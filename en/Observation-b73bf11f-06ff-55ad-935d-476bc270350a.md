# OpenELIS Observation: glucose (numeric) - OpenELIS Global FHIR Implementation Guide v0.2.0

## Example Observation: OpenELIS Observation: glucose (numeric)

Profile: [OpenELIS Observation](StructureDefinition-openelis-observation.md)

**identifier**: [OEResultUUID](NamingSystem-oe-ns-result-uuid.md)/b73bf11f-06ff-55ad-935d-476bc270350a (use: usual, ), [OEFacilityId](NamingSystem-oe-ns-facility-id.md)/EDH-LAB (use: official, )

**basedOn**: [ServiceRequest Glucose [Mass/volume] in Serum or Plasma](ServiceRequest-48549f60-c400-5510-97da-2e2497627e81.md)

**status**: Final

**code**: Glucose

**subject**: [Grace Banda (official) Female, DoB: 1991-04 ( http://openelis-global.org/pat_guid#OEPatientGUID#dd63810d-c44b-52b6-b70d-0d8e60533c6d (use: usual, ))](Patient-5b6f3f86-2a44-4c3c-9d0c-6f0c4a2d7e11.md)

**effective**: 2026-09-28 13:05:00+1000

**issued**: 2026-09-28 13:05:00+1000

**performer**: [Practitioner Kofi Mensah ](Practitioner-cc90c222-c1fa-5cb0-bb01-a2b35ac26244.md)

**value**: 92 mg/dL

**specimen**: [Specimen: identifier = http://openelis-global.org/sampleItem_uuid#OESampleItemUUID#97b37d86-fd55-529b-bbd7-4766f3988fab (use: usual, ),http://openelis-global.org/facility_id#OEFacilityId#EDH-LAB (use: official, ); accessionIdentifier = http://openelis-global.org/sampleItem_labNo#OESampleItemLabNumber#EDH26000000417-1 (use: usual, ); status = available; type = Serum; receivedTime = 2026-09-28 09:30:00+1000](Specimen-97b37d86-fd55-529b-bbd7-4766f3988fab.md)

**device**: [Device: extension = 2026-09-01 07:30:00+1000,,ACTIVE; identifier = http://openelis-global.org/analyzer_uuid#OEAnalyzerUUID#ff2b5d6a-ff46-5f20-b254-4eaa0615d555 (use: usual, ),http://openelis-global.org/analyzer_bridge_connection#OEAnalyzerBridgeConnection#chem-01 (use: usual, ); status = active; type = ](Device-ff2b5d6a-ff46-5f20-b254-4eaa0615d555.md)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "b73bf11f-06ff-55ad-935d-476bc270350a",
  "meta" : {
    "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-observation"]
  },
  "identifier" : [{
    "use" : "usual",
    "system" : "http://openelis-global.org/result_uuid",
    "value" : "b73bf11f-06ff-55ad-935d-476bc270350a"
  },
  {
    "use" : "official",
    "system" : "http://openelis-global.org/facility_id",
    "value" : "EDH-LAB",
    "assigner" : {
      "reference" : "Organization/a845f2db-10e5-5117-ac75-553f615e301a"
    }
  }],
  "basedOn" : [{
    "reference" : "ServiceRequest/48549f60-c400-5510-97da-2e2497627e81"
  }],
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "2345-7",
      "display" : "Glucose [Mass/volume] in Serum or Plasma"
    }],
    "text" : "Glucose"
  },
  "subject" : {
    "reference" : "Patient/5b6f3f86-2a44-4c3c-9d0c-6f0c4a2d7e11"
  },
  "effectiveDateTime" : "2026-09-28T13:05:00+10:00",
  "issued" : "2026-09-28T13:05:00+10:00",
  "performer" : [{
    "reference" : "Practitioner/cc90c222-c1fa-5cb0-bb01-a2b35ac26244"
  }],
  "valueQuantity" : {
    "value" : 92,
    "unit" : "mg/dL"
  },
  "specimen" : {
    "reference" : "Specimen/97b37d86-fd55-529b-bbd7-4766f3988fab"
  },
  "device" : {
    "reference" : "Device/ff2b5d6a-ff46-5f20-b254-4eaa0615d555"
  }
}

```
