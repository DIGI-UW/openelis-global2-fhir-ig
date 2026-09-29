# Referral Task (requested) - OpenELIS Global FHIR Implementation Guide v0.2.0

## Example Task: Referral Task (requested)

Profile: [OpenELIS Referral Task](StructureDefinition-openelis-referral-task.md)

**basedOn**: [ServiceRequest Hepatitis B virus surface Ag [Presence] in Serum or Plasma by Immunoassay](ServiceRequest-3b2c3407-5430-5878-9c61-c4c9b9c013c4.md)

**status**: Requested

**intent**: order

**description**: referring accession number EDH26000000417 from Practitioner/cc90c222-c1fa-5cb0-bb01-a2b35ac26244 to Organization/32a104cd-6337-5d1b-b1a9-6849e98b2200

**focus**: [ServiceRequest Hepatitis B virus surface Ag [Presence] in Serum or Plasma by Immunoassay](ServiceRequest-3b2c3407-5430-5878-9c61-c4c9b9c013c4.md)

**for**: [Grace Banda (official) Female, DoB: 1991-04 ( http://openelis-global.org/pat_guid#OEPatientGUID#dd63810d-c44b-52b6-b70d-0d8e60533c6d (use: usual, ))](Patient-5b6f3f86-2a44-4c3c-9d0c-6f0c4a2d7e11.md)

**authoredOn**: 2026-09-28 14:30:00+1000

**requester**: [Practitioner Kofi Mensah ](Practitioner-cc90c222-c1fa-5cb0-bb01-a2b35ac26244.md)

**owner**: [Organization National Reference Laboratory](Organization-32a104cd-6337-5d1b-b1a9-6849e98b2200.md)

**reasonCode**: 



## Resource Content

```json
{
  "resourceType" : "Task",
  "id" : "1adff0e3-109a-55fe-b3b7-74736ef4ff6d",
  "meta" : {
    "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-referral-task"]
  },
  "basedOn" : [{
    "reference" : "ServiceRequest/3b2c3407-5430-5878-9c61-c4c9b9c013c4"
  }],
  "status" : "requested",
  "intent" : "order",
  "description" : "referring accession number EDH26000000417 from Practitioner/cc90c222-c1fa-5cb0-bb01-a2b35ac26244 to Organization/32a104cd-6337-5d1b-b1a9-6849e98b2200",
  "focus" : {
    "reference" : "ServiceRequest/3b2c3407-5430-5878-9c61-c4c9b9c013c4"
  },
  "for" : {
    "reference" : "Patient/5b6f3f86-2a44-4c3c-9d0c-6f0c4a2d7e11"
  },
  "authoredOn" : "2026-09-28T14:30:00+10:00",
  "requester" : {
    "reference" : "Practitioner/cc90c222-c1fa-5cb0-bb01-a2b35ac26244"
  },
  "owner" : {
    "reference" : "Organization/32a104cd-6337-5d1b-b1a9-6849e98b2200"
  },
  "reasonCode" : {
    "coding" : [{
      "system" : "http://openelis-global.org/refer_reason"
    }]
  }
}

```
