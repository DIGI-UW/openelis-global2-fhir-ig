# Collection location (GPS) - OpenELIS Global FHIR Implementation Guide v0.2.0

## Extension: Collection location (GPS) 

Where the specimen was collected, as captured on the device used at collection. Added to Specimen.collection when the order has GPS coordinates (SpecimenTransformServiceImpl.createGpsExtension). OpenELIS currently sends this extension with url http://openelis-global.org/fhir/StructureDefinition/collection-location-gps (see Known Issues).

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [OpenELIS Specimen](StructureDefinition-openelis-specimen.md)
* Examples for this Extension: [Specimen/97b37d86-fd55-529b-bbd7-4766f3988fab](Specimen-97b37d86-fd55-529b-bbd7-4766f3988fab.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/org.openelisglobal.fhir|current/StructureDefinition/StructureDefinition-collection-location-gps.json)

### Formal Views of Extension Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-collection-location-gps.csv), [Excel](../StructureDefinition-collection-location-gps.xlsx), [Schematron](../StructureDefinition-collection-location-gps.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "collection-location-gps",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/collection-location-gps",
  "version" : "0.2.0",
  "name" : "OECollectionLocationGPS",
  "title" : "Collection location (GPS)",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-09-29T02:24:20+00:00",
  "publisher" : "OpenELIS Global (Digital Initiatives Group, University of Washington)",
  "contact" : [{
    "name" : "OpenELIS Global (Digital Initiatives Group, University of Washington)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://openelis-global.org"
    }]
  },
  {
    "name" : "OpenELIS Global community",
    "telecom" : [{
      "system" : "url",
      "value" : "https://uwdigi.atlassian.net/wiki/spaces/oeg/overview"
    }]
  }],
  "description" : "Where the specimen was collected, as captured on the device used at collection. Added to Specimen.collection when the order has GPS coordinates (SpecimenTransformServiceImpl.createGpsExtension). OpenELIS currently sends this extension with url http://openelis-global.org/fhir/StructureDefinition/collection-location-gps (see Known Issues).",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "001",
      "display" : "World"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "Specimen.collection"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Collection location (GPS)",
      "definition" : "Where the specimen was collected, as captured on the device used at collection. Added to Specimen.collection when the order has GPS coordinates (SpecimenTransformServiceImpl.createGpsExtension). OpenELIS currently sends this extension with url http://openelis-global.org/fhir/StructureDefinition/collection-location-gps (see Known Issues)."
    },
    {
      "id" : "Extension.extension:latitude",
      "path" : "Extension.extension",
      "sliceName" : "latitude",
      "short" : "Latitude in decimal degrees (WGS84)",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:latitude.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:latitude.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "latitude"
    },
    {
      "id" : "Extension.extension:latitude.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "decimal"
      }]
    },
    {
      "id" : "Extension.extension:longitude",
      "path" : "Extension.extension",
      "sliceName" : "longitude",
      "short" : "Longitude in decimal degrees (WGS84)",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:longitude.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:longitude.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "longitude"
    },
    {
      "id" : "Extension.extension:longitude.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "decimal"
      }]
    },
    {
      "id" : "Extension.extension:accuracy",
      "path" : "Extension.extension",
      "sliceName" : "accuracy",
      "short" : "Horizontal accuracy in metres",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:accuracy.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:accuracy.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "accuracy"
    },
    {
      "id" : "Extension.extension:accuracy.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "Extension.extension:method",
      "path" : "Extension.extension",
      "sliceName" : "method",
      "short" : "How the coordinates were captured (free code set by the client)",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:method.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:method.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "method"
    },
    {
      "id" : "Extension.extension:method.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "Extension.extension:captureTimestamp",
      "path" : "Extension.extension",
      "sliceName" : "captureTimestamp",
      "short" : "When the coordinates were captured",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Extension.extension:captureTimestamp.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:captureTimestamp.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "captureTimestamp"
    },
    {
      "id" : "Extension.extension:captureTimestamp.value[x]",
      "path" : "Extension.extension.value[x]",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/collection-location-gps"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
