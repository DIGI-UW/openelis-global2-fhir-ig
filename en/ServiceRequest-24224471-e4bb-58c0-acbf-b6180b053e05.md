# EMR ServiceRequest: HBsAg - OpenELIS Global FHIR Implementation Guide v0.2.0

## Example ServiceRequest: EMR ServiceRequest: HBsAg

Profile: [Lab Order Request ServiceRequest (EMR to OpenELIS)](StructureDefinition-openelis-lab-order-request-service-request.md)

**identifier**: `http://emr.example.org/order`/ORD-88214

**status**: Active

**intent**: Order

**priority**: Routine

**code**: Hepatitis B virus surface Ag [Presence] in Serum or Plasma by Immunoassay

**subject**: [Grace Banda (official) Female, DoB: 1991-04 ( http://openelis-global.org/pat_guid#OEPatientGUID#dd63810d-c44b-52b6-b70d-0d8e60533c6d (use: usual, ))](Patient-5b6f3f86-2a44-4c3c-9d0c-6f0c4a2d7e11.md)

**requester**: Dr Kofi Mensah (EMR practitioner record)



## Resource Content

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "24224471-e4bb-58c0-acbf-b6180b053e05",
  "meta" : {
    "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-lab-order-request-service-request"]
  },
  "identifier" : [{
    "system" : "http://emr.example.org/order",
    "value" : "ORD-88214"
  }],
  "status" : "active",
  "intent" : "order",
  "priority" : "routine",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "5196-1",
      "display" : "Hepatitis B virus surface Ag [Presence] in Serum or Plasma by Immunoassay"
    }]
  },
  "subject" : {
    "reference" : "Patient/5b6f3f86-2a44-4c3c-9d0c-6f0c4a2d7e11"
  },
  "requester" : {
    "display" : "Dr Kofi Mensah (EMR practitioner record)"
  }
}

```
