# OpenELIS Observation: HBsAg (coded) - OpenELIS Global FHIR Implementation Guide v0.2.0

## Example Observation: OpenELIS Observation: HBsAg (coded)

Profile: [OpenELIS Observation](StructureDefinition-openelis-observation.md)

**identifier**: [OEResultUUID](NamingSystem-oe-ns-result-uuid.md)/8330c79d-ccd9-5ef4-876d-2b176e5e86a5 (use: usual, ), [OEFacilityId](NamingSystem-oe-ns-facility-id.md)/EDH-LAB (use: official, )

**basedOn**: [ServiceRequest Hepatitis B virus surface Ag [Presence] in Serum or Plasma by Immunoassay](ServiceRequest-3b2c3407-5430-5878-9c61-c4c9b9c013c4.md)

**status**: Final

**code**: HBsAg

**subject**: [Grace Banda (official) Female, DoB: 1991-04 ( http://openelis-global.org/pat_guid#OEPatientGUID#dd63810d-c44b-52b6-b70d-0d8e60533c6d (use: usual, ))](Patient-5b6f3f86-2a44-4c3c-9d0c-6f0c4a2d7e11.md)

**effective**: 2026-09-28 14:20:00+1000

**issued**: 2026-09-28 14:20:00+1000

**value**: Negative

**specimen**: [Specimen: identifier = http://openelis-global.org/sampleItem_uuid#OESampleItemUUID#97b37d86-fd55-529b-bbd7-4766f3988fab (use: usual, ),http://openelis-global.org/facility_id#OEFacilityId#EDH-LAB (use: official, ); accessionIdentifier = http://openelis-global.org/sampleItem_labNo#OESampleItemLabNumber#EDH26000000417-1 (use: usual, ); status = available; type = Serum; receivedTime = 2026-09-28 09:30:00+1000](Specimen-97b37d86-fd55-529b-bbd7-4766f3988fab.md)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "8330c79d-ccd9-5ef4-876d-2b176e5e86a5",
  "meta" : {
    "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-observation"]
  },
  "identifier" : [{
    "use" : "usual",
    "system" : "http://openelis-global.org/result_uuid",
    "value" : "8330c79d-ccd9-5ef4-876d-2b176e5e86a5"
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
    "reference" : "ServiceRequest/3b2c3407-5430-5878-9c61-c4c9b9c013c4"
  }],
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "5196-1",
      "display" : "Hepatitis B virus surface Ag [Presence] in Serum or Plasma by Immunoassay"
    }],
    "text" : "HBsAg"
  },
  "subject" : {
    "reference" : "Patient/5b6f3f86-2a44-4c3c-9d0c-6f0c4a2d7e11"
  },
  "effectiveDateTime" : "2026-09-28T14:20:00+10:00",
  "issued" : "2026-09-28T14:20:00+10:00",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "LA6577-6",
      "display" : "Negative"
    },
    {
      "system" : "http://openelis-global.org/dictionary_entry",
      "code" : "Negative",
      "display" : "Negative"
    }]
  },
  "specimen" : {
    "reference" : "Specimen/97b37d86-fd55-529b-bbd7-4766f3988fab"
  }
}

```
