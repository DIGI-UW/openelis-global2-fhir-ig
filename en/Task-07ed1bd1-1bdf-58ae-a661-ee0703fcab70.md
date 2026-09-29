# EMR lab order Task - OpenELIS Global FHIR Implementation Guide v0.2.0

## Example Task: EMR lab order Task

Profile: [Lab Order Request Task (EMR to OpenELIS)](StructureDefinition-openelis-lab-order-request-task.md)

**basedOn**: 

* [ServiceRequest Glucose [Mass/volume] in Serum or Plasma](ServiceRequest-35acd1d2-f076-5434-9105-683254702ff1.md)
* [ServiceRequest Hepatitis B virus surface Ag [Presence] in Serum or Plasma by Immunoassay](ServiceRequest-24224471-e4bb-58c0-acbf-b6180b053e05.md)

**status**: Requested

**intent**: order

**for**: [Grace Banda](Patient-5b6f3f86-2a44-4c3c-9d0c-6f0c4a2d7e11.md)

**authoredOn**: 2026-09-28 08:15:00+1000

**owner**: [OpenELIS service user](Practitioner-0f1c6d3a-6b6e-4a55-9a77-5b1b1b0b3e21.md)



## Resource Content

```json
{
  "resourceType" : "Task",
  "id" : "07ed1bd1-1bdf-58ae-a661-ee0703fcab70",
  "meta" : {
    "profile" : ["https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-lab-order-request-task"]
  },
  "basedOn" : [{
    "reference" : "ServiceRequest/35acd1d2-f076-5434-9105-683254702ff1"
  },
  {
    "reference" : "ServiceRequest/24224471-e4bb-58c0-acbf-b6180b053e05"
  }],
  "status" : "requested",
  "intent" : "order",
  "for" : {
    "reference" : "Patient/5b6f3f86-2a44-4c3c-9d0c-6f0c4a2d7e11",
    "display" : "Grace Banda"
  },
  "authoredOn" : "2026-09-28T08:15:00+10:00",
  "owner" : {
    "reference" : "Practitioner/0f1c6d3a-6b6e-4a55-9a77-5b1b1b0b3e21",
    "display" : "OpenELIS service user"
  }
}

```
