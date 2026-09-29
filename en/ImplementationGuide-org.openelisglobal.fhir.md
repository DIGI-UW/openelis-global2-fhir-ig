# Resource OpenELIS Global FHIR Implementation Guide



## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "org.openelisglobal.fhir",
  "language" : "en",
  "url" : "https://digi-uw.github.io/openelis-global2-fhir-ig/ImplementationGuide/org.openelisglobal.fhir",
  "version" : "0.2.0",
  "name" : "OpenELISGlobalImplementationGuide",
  "title" : "OpenELIS Global FHIR Implementation Guide",
  "status" : "draft",
  "experimental" : false,
  "date" : "2026-09-29",
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
  "description" : "Profiles, extensions, identifier systems and exchange workflows for the HL7 FHIR R4 interfaces of OpenELIS Global, an open-source laboratory information system: lab orders and results with EMRs such as OpenMRS, lab-to-lab referral, specimen shipment, sample storage, analyzers, and the OpenELIS FHIR REST API.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "http://unstats.un.org/unsd/methods/m49/m49.htm",
      "code" : "001",
      "display" : "World"
    }]
  }],
  "packageId" : "org.openelisglobal.fhir",
  "license" : "CC-BY-SA-4.0",
  "fhirVersion" : ["4.0.1"],
  "dependsOn" : [{
    "id" : "hl7tx",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on HL7 Terminology"
    }],
    "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
    "packageId" : "hl7.terminology.r4",
    "version" : "7.4.0"
  },
  {
    "id" : "hl7ext",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on the HL7 Extension Pack"
    }],
    "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
    "packageId" : "hl7.fhir.uv.extensions.r4",
    "version" : "5.3.0"
  }],
  "definition" : {
    "extension" : [{
      "extension" : [{
        "url" : "code",
        "valueString" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2021+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "show-inherited-invariants"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid-template"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid-template"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "https://digi-uw.github.io/openelis-global2-fhir-ig/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "i18n-default-lang"
      },
      {
        "url" : "value",
        "valueString" : "en"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
      "valueCode" : "hl7.fhir.uv.tools.r4#1.1.2"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2021+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "show-inherited-invariants"
      },
      {
        "url" : "value",
        "valueString" : "false"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid-template"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid-template"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "https://digi-uw.github.io/openelis-global2-fhir-ig/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "i18n-default-lang"
      },
      {
        "url" : "value",
        "valueString" : "en"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    }],
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Device"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Device-ff2b5d6a-ff46-5f20-b254-4eaa0615d555.html"
      }],
      "reference" : {
        "reference" : "Device/ff2b5d6a-ff46-5f20-b254-4eaa0615d555"
      },
      "name" : "Analyzer Device",
      "description" : "A chemistry analyzer connected through the OpenELIS analyzer bridge.",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-analyzer-device"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-analyzer-last-activated.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/analyzer-last-activated"
      },
      "name" : "Analyzer last activated",
      "description" : "When the analyzer was last activated in OpenELIS. OpenELIS currently sends this extension with url http://openelis.org/fhir/StructureDefinition/analyzer-last-activated (see Known Issues).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-analyzer-operational-status.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/analyzer-operational-status"
      },
      "name" : "Analyzer operational status",
      "description" : "OpenELIS's own analyzer lifecycle status, unmapped. Device.status carries the mapped FHIR value. Ignored on import. OpenELIS currently sends this extension with url http://openelis.org/fhir/StructureDefinition/analyzer-operational-status (see Known Issues).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-analyzer-test-units.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/analyzer-test-units"
      },
      "name" : "Analyzer test units",
      "description" : "The OpenELIS test units (lab sections) the analyzer serves. OpenELIS currently sends this extension with url http://openelis.org/fhir/StructureDefinition/analyzer-test-units (see Known Issues).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-collection-location-gps.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/collection-location-gps"
      },
      "name" : "Collection location (GPS)",
      "description" : "Where the specimen was collected, as captured on the device used at collection. Added to Specimen.collection when the order has GPS coordinates (SpecimenTransformServiceImpl.createGpsExtension). OpenELIS currently sends this extension with url http://openelis-global.org/fhir/StructureDefinition/collection-location-gps (see Known Issues).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Task"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Task-07ed1bd1-1bdf-58ae-a661-ee0703fcab70.html"
      }],
      "reference" : {
        "reference" : "Task/07ed1bd1-1bdf-58ae-a661-ee0703fcab70"
      },
      "name" : "EMR lab order Task",
      "description" : "Written by the EMR to the shared FHIR server. OpenELIS finds it with Task?status=requested&owner=Practitioner/0f1c6d3a-6b6e-4a55-9a77-5b1b1b0b3e21.",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-lab-order-request-task"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Practitioner"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Practitioner-0f1c6d3a-6b6e-4a55-9a77-5b1b1b0b3e21.html"
      }],
      "reference" : {
        "reference" : "Practitioner/0f1c6d3a-6b6e-4a55-9a77-5b1b1b0b3e21"
      },
      "name" : "EMR service user representing OpenELIS",
      "description" : "The Practitioner in the EMR that stands for OpenELIS. Its reference is the value of org.openelisglobal.remote.source.identifier (Practitioner/0f1c6d3a-...) and the owner of every Task OpenELIS should pick up.",
      "exampleBoolean" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ServiceRequest"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ServiceRequest-35acd1d2-f076-5434-9105-683254702ff1.html"
      }],
      "reference" : {
        "reference" : "ServiceRequest/35acd1d2-f076-5434-9105-683254702ff1"
      },
      "name" : "EMR ServiceRequest: glucose",
      "description" : "The EMR's test order. OpenELIS matches the test by the LOINC coding.",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-lab-order-request-service-request"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ServiceRequest"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ServiceRequest-24224471-e4bb-58c0-acbf-b6180b053e05.html"
      }],
      "reference" : {
        "reference" : "ServiceRequest/24224471-e4bb-58c0-acbf-b6180b053e05"
      },
      "name" : "EMR ServiceRequest: HBsAg",
      "description" : "The EMR's test order. OpenELIS matches the test by the LOINC coding.",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-lab-order-request-service-request"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-eqa-cycle.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/eqa-cycle"
      },
      "name" : "EQA cycle",
      "description" : "External quality assessment cycle the consignment belongs to. Only sent for EQA boxes. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/eqa-cycle (see Known Issues).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-rack-grid-dimensions.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/rack-grid-dimensions"
      },
      "name" : "Grid dimensions",
      "description" : "Grid of a storage box as the string \"{rows} × {columns}\" (U+00D7 multiplication sign, with spaces), for example \"9 × 9\". Parsed on import. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/rack-grid-dimensions (see Known Issues).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-openelis-lab-order-request-service-request.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/openelis-lab-order-request-service-request"
      },
      "name" : "Lab Order Request ServiceRequest (EMR to OpenELIS)",
      "description" : "A test ordered by an external system. OpenELIS matches the test or panel by the LOINC coding in ServiceRequest.code (TaskInterpreterImpl.createTestFromFHIR / createPanelFromFHIR). The OpenELIS test must be configured with the same LOINC code.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-openelis-lab-order-request-task.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/openelis-lab-order-request-task"
      },
      "name" : "Lab Order Request Task (EMR to OpenELIS)",
      "description" : "The Task an ordering system (for example OpenMRS with the Lab on FHIR module) writes to the shared FHIR server so OpenELIS picks the order up. OpenELIS polls each org.openelisglobal.remote.source.uri for Task?status=requested&owner={one of org.openelisglobal.remote.source.identifier} (FhirApiWorkFlowServiceImpl.beginTaskImportOrderPath).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-analysis-result-uuid.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-analysis-result-uuid"
      },
      "name" : "oe-ns-analysis-result-uuid",
      "description" : "Identifier of a DiagnosticReport. The value is the Analysis UUID so it equals the matching ServiceRequest id.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-analysis-uuid.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-analysis-uuid"
      },
      "name" : "oe-ns-analysis-uuid",
      "description" : "UUID of the OpenELIS test request (Analysis). Carried on ServiceRequest.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-analyzer-bridge-connection.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-analyzer-bridge-connection"
      },
      "name" : "oe-ns-analyzer-bridge-connection",
      "description" : "Connection id of the analyzer in the OpenELIS analyzer bridge. On import OpenELIS accepts any system ending in /analyzer_bridge_connection.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-analyzer-uuid.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-analyzer-uuid"
      },
      "name" : "oe-ns-analyzer-uuid",
      "description" : "UUID of the OpenELIS analyzer. Carried on Device.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-facility-id.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-facility-id"
      },
      "name" : "oe-ns-facility-id",
      "description" : "Identifier of the OpenELIS site (org.openelisglobal.facility.id). Added to most resources OpenELIS produces with the site Organization as assigner.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-order-accession.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-order-accession"
      },
      "name" : "oe-ns-order-accession",
      "description" : "Lab (accession) number of the OpenELIS order. Carried on Task.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-order-uuid.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-order-uuid"
      },
      "name" : "oe-ns-order-uuid",
      "description" : "UUID of the OpenELIS order (Sample). Carried on Task.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-org-clianum.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-org-clianum"
      },
      "name" : "oe-ns-org-clianum",
      "description" : "CLIA (or equivalent accreditation) number of the organization.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-org-code.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-org-code"
      },
      "name" : "oe-ns-org-code",
      "description" : "Organization code configured in OpenELIS.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-org-shortname.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-org-shortname"
      },
      "name" : "oe-ns-org-shortname",
      "description" : "Organization short name configured in OpenELIS.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-org-uuid.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-org-uuid"
      },
      "name" : "oe-ns-org-uuid",
      "description" : "UUID of the OpenELIS organization.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-pat-guid.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-pat-guid"
      },
      "name" : "oe-ns-pat-guid",
      "description" : "Patient GUID held in OpenELIS. On import OpenELIS reads this system as the external patient id.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-pat-national-id.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-pat-national-id"
      },
      "name" : "oe-ns-pat-national-id",
      "description" : "National identifier entered in OpenELIS. Sent with Identifier.use = official.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-pat-st-number.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-pat-st-number"
      },
      "name" : "oe-ns-pat-st-number",
      "description" : "ST number entered in OpenELIS.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-pat-subject-number.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-pat-subject-number"
      },
      "name" : "oe-ns-pat-subject-number",
      "description" : "Subject (study or programme) number entered in OpenELIS.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-pat-uuid.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-pat-uuid"
      },
      "name" : "oe-ns-pat-uuid",
      "description" : "OpenELIS internal UUID of the patient. Equals Patient.id.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-provider-uuid.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-provider-uuid"
      },
      "name" : "oe-ns-provider-uuid",
      "description" : "UUID of the OpenELIS provider. Carried on Practitioner.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-result-uuid.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-result-uuid"
      },
      "name" : "oe-ns-result-uuid",
      "description" : "UUID of the OpenELIS result. Carried on Observation.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-samp-labno.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-samp-labno"
      },
      "name" : "oe-ns-samp-labno",
      "description" : "Lab (accession) number of the order. Carried in ServiceRequest.requisition.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-sampleitem-labno.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-sampleitem-labno"
      },
      "name" : "oe-ns-sampleitem-labno",
      "description" : "Accession number of the sample item: the order lab number followed by -{sortOrder}. Carried in Specimen.accessionIdentifier.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-sampleitem-uuid.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-sampleitem-uuid"
      },
      "name" : "oe-ns-sampleitem-uuid",
      "description" : "UUID of the OpenELIS sample item. Carried on Specimen.identifier.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-shipment-box-id.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-shipment-box-id"
      },
      "name" : "oe-ns-shipment-box-id",
      "description" : "Identifier of a shipping box. Carried on SupplyDelivery.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "NamingSystem-oe-ns-storage-location-code.html"
      }],
      "reference" : {
        "reference" : "NamingSystem/oe-ns-storage-location-code"
      },
      "name" : "oe-ns-storage-location-code",
      "description" : "Hierarchical code of a storage location (room / equipment / shelf / rack / box) joined with hyphens.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-openelis-analyzer-device.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/openelis-analyzer-device"
      },
      "name" : "OpenELIS Analyzer Device",
      "description" : "An analyzer as OpenELIS produces it (DeviceTransformServiceImpl), serves it from /fhir/Device, and includes it in result bundles when Observation.device references it. OpenELIS currently declares meta.profile = http://openelis.org/fhir/StructureDefinition/openelis-analyzer-device, which is not this profile's URL (see Known Issues).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CodeSystem-oe-analyzer-operational-status.html"
      }],
      "reference" : {
        "reference" : "CodeSystem/oe-analyzer-operational-status"
      },
      "name" : "OpenELIS Analyzer Operational Status",
      "description" : "OpenELIS's own analyzer lifecycle status, sent unchanged (enum name, a plain code with no system) in the analyzer-operational-status extension. This CodeSystem exists only so the IG can bind that code. Device.status carries the FHIR mapping of the same value.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-oe-analyzer-operational-status.html"
      }],
      "reference" : {
        "reference" : "ValueSet/oe-analyzer-operational-status"
      },
      "name" : "OpenELIS Analyzer Operational Statuses",
      "description" : "All analyzer operational statuses.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-openelis-diagnostic-report.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/openelis-diagnostic-report"
      },
      "name" : "OpenELIS DiagnosticReport",
      "description" : "The report for one ordered test, grouping its results (DiagnosticReportTransformServiceImpl), served from /fhir/DiagnosticReport (read, search and delete only). The id is the Analysis UUID, the same as the matching ServiceRequest id.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "DiagnosticReport"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "DiagnosticReport-48549f60-c400-5510-97da-2e2497627e81.html"
      }],
      "reference" : {
        "reference" : "DiagnosticReport/48549f60-c400-5510-97da-2e2497627e81"
      },
      "name" : "OpenELIS DiagnosticReport: glucose",
      "description" : "The report for the glucose test. Same id as its ServiceRequest (both are the Analysis UUID).",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-diagnostic-report"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "DiagnosticReport"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "DiagnosticReport-3b2c3407-5430-5878-9c61-c4c9b9c013c4.html"
      }],
      "reference" : {
        "reference" : "DiagnosticReport/3b2c3407-5430-5878-9c61-c4c9b9c013c4"
      },
      "name" : "OpenELIS DiagnosticReport: HBsAg",
      "description" : "The report for the HBsAg test.",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-diagnostic-report"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CapabilityStatement"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CapabilityStatement-OpenELISFhirServer.html"
      }],
      "reference" : {
        "reference" : "CapabilityStatement/OpenELISFhirServer"
      },
      "name" : "OpenELIS Global FHIR REST server",
      "description" : "The FHIR R4 REST API OpenELIS Global serves at {server}/api/OpenELIS-Global/fhir. It reads from and writes to the OpenELIS database directly. It is not the co-resident HAPI FHIR store. See api.html.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-openelis-observation.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/openelis-observation"
      },
      "name" : "OpenELIS Observation",
      "description" : "One result value as OpenELIS produces it (ObservationTransformServiceImpl) and serves it from /fhir/Observation. A multi-component test produces one Observation per component.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-b73bf11f-06ff-55ad-935d-476bc270350a.html"
      }],
      "reference" : {
        "reference" : "Observation/b73bf11f-06ff-55ad-935d-476bc270350a"
      },
      "name" : "OpenELIS Observation: glucose (numeric)",
      "description" : "A validated numeric result produced on an analyzer.",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-observation"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Observation"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Observation-8330c79d-ccd9-5ef4-876d-2b176e5e86a5.html"
      }],
      "reference" : {
        "reference" : "Observation/8330c79d-ccd9-5ef4-876d-2b176e5e86a5"
      },
      "name" : "OpenELIS Observation: HBsAg (coded)",
      "description" : "A validated dictionary (coded) result: a LOINC answer coding plus the OpenELIS dictionary entry.",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-observation"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-openelis-order-task.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/openelis-order-task"
      },
      "name" : "OpenELIS Order Task",
      "description" : "The Task OpenELIS writes for each order (Sample) to track its state (TaskTransformServiceImpl). When the order came from an EMR Task, partOf points at that Task. When the order is finished, one output per test references its DiagnosticReport.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Task"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Task-ed860000-5fab-5072-a257-83bbe38c27f4.html"
      }],
      "reference" : {
        "reference" : "Task/ed860000-5fab-5072-a257-83bbe38c27f4"
      },
      "name" : "OpenELIS order Task (finished)",
      "description" : "OpenELIS's Task for the order, once finished: one output per test.",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-order-task"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-openelis-organization.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/openelis-organization"
      },
      "name" : "OpenELIS Organization",
      "description" : "An organization as OpenELIS produces it (OrganizationTransformServiceImpl) and serves it from /fhir/Organization: referring sites, reference labs, and the site's own facility Organization (FhirFacilityOrganizationServiceImpl).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-openelis-patient.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/openelis-patient"
      },
      "name" : "OpenELIS Patient",
      "description" : "A patient as OpenELIS produces it (PatientTransformServiceImpl.transformToFhirPatient) and serves it from /fhir/Patient. Environmental and vector orders have no patient.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-openelis-practitioner.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/openelis-practitioner"
      },
      "name" : "OpenELIS Practitioner",
      "description" : "A requesting provider as OpenELIS produces it (PractitionerTransformServiceImpl) and serves it from /fhir/Practitioner.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-openelis-referral-task.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/openelis-referral-task"
      },
      "name" : "OpenELIS Referral Task",
      "description" : "The Task a referring OpenELIS writes when it refers a test to another laboratory (FhirReferralServiceImpl.createReferralTask). The reference lab polls for it with the same mechanism as EMR orders. When results are entered at the referring lab from a paper report, it publishes the Task as completed with an output referencing the DiagnosticReport. A referral marked lost sets the Task to cancelled. A referral rejected at the referring lab sets it to rejected.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-openelis-service-request.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/openelis-service-request"
      },
      "name" : "OpenELIS ServiceRequest",
      "description" : "One ordered test (an OpenELIS Analysis) as OpenELIS produces it (ServiceRequestTransformServiceImpl) and serves it from /fhir/ServiceRequest. The id is the Analysis UUID. The DiagnosticReport for the same test has the same id.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ServiceRequest"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ServiceRequest-48549f60-c400-5510-97da-2e2497627e81.html"
      }],
      "reference" : {
        "reference" : "ServiceRequest/48549f60-c400-5510-97da-2e2497627e81"
      },
      "name" : "OpenELIS ServiceRequest: glucose",
      "description" : "One ordered test. The id is the Analysis UUID.",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-service-request"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ServiceRequest"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ServiceRequest-3b2c3407-5430-5878-9c61-c4c9b9c013c4.html"
      }],
      "reference" : {
        "reference" : "ServiceRequest/3b2c3407-5430-5878-9c61-c4c9b9c013c4"
      },
      "name" : "OpenELIS ServiceRequest: HBsAg",
      "description" : "One ordered test. The id is the Analysis UUID.",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-service-request"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-openelis-shipment-box.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/openelis-shipment-box"
      },
      "name" : "OpenELIS Shipment Box",
      "description" : "A box of specimens shipped from one OpenELIS site to another (ShippingBoxFhirTransform). Written to the sender's FHIR store on creation and on every status change. The receiving OpenELIS polls each remote source for SupplyDelivery?status=in-progress (ShipmentFhirImportService). SupplyDelivery is not served from /fhir.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-openelis-specimen.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/openelis-specimen"
      },
      "name" : "OpenELIS Specimen",
      "description" : "A sample item as OpenELIS produces it (SpecimenTransformServiceImpl) and serves it from /fhir/Specimen.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Specimen"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Specimen-97b37d86-fd55-529b-bbd7-4766f3988fab.html"
      }],
      "reference" : {
        "reference" : "Specimen/97b37d86-fd55-529b-bbd7-4766f3988fab"
      },
      "name" : "OpenELIS Specimen: serum",
      "description" : "The serum sample item both tests run on, with GPS collection location.",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-specimen"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-openelis-storage-location.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/openelis-storage-location"
      },
      "name" : "OpenELIS Storage Location",
      "description" : "A level of the OpenELIS sample storage hierarchy: room, storage device (equipment), shelf, rack or box (StorageLocationFhirTransform). Served from /fhir/Location with read, create, update, delete and search (including _tag and _include=Location:partof). Every change is also mirrored to the FHIR store. The level is carried in meta.tag.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Patient-5b6f3f86-2a44-4c3c-9d0c-6f0c4a2d7e11.html"
      }],
      "reference" : {
        "reference" : "Patient/5b6f3f86-2a44-4c3c-9d0c-6f0c4a2d7e11"
      },
      "name" : "Patient",
      "description" : "A patient as OpenELIS publishes it. A patient received with an EMR order keeps the EMR's Patient id as its OpenELIS FHIR UUID.",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-patient"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-position-occupancy.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/position-occupancy"
      },
      "name" : "Position occupancy",
      "description" : "Whether any position in the storage box is occupied. Always sent on box-level Locations. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/position-occupancy (see Known Issues).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-rack-position-schema-hint.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/rack-position-schema-hint"
      },
      "name" : "Position schema hint",
      "description" : "How positions in the box are labelled (for example letter-number). Free text. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/rack-position-schema-hint (see Known Issues).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Organization"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Organization-32a104cd-6337-5d1b-b1a9-6849e98b2200.html"
      }],
      "reference" : {
        "reference" : "Organization/32a104cd-6337-5d1b-b1a9-6849e98b2200"
      },
      "name" : "Reference laboratory: National Reference Laboratory",
      "description" : "The laboratory tests are referred to.",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-organization"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Task"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Task-1adff0e3-109a-55fe-b3b7-74736ef4ff6d.html"
      }],
      "reference" : {
        "reference" : "Task/1adff0e3-109a-55fe-b3b7-74736ef4ff6d"
      },
      "name" : "Referral Task (requested)",
      "description" : "HBsAg referred for confirmation. The reference lab's OpenELIS picks it up by polling.",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-referral-task"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Organization"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Organization-d3619aef-5abf-5b4f-a76c-06f378deca13.html"
      }],
      "reference" : {
        "reference" : "Organization/d3619aef-5abf-5b4f-a76c-06f378deca13"
      },
      "name" : "Referring site: Riverside Health Centre",
      "description" : "A referring clinic configured in OpenELIS.",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-organization"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Practitioner"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Practitioner-cc90c222-c1fa-5cb0-bb01-a2b35ac26244.html"
      }],
      "reference" : {
        "reference" : "Practitioner/cc90c222-c1fa-5cb0-bb01-a2b35ac26244"
      },
      "name" : "Requesting provider",
      "description" : "The clinician who ordered the tests.",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-practitioner"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "SupplyDelivery"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "SupplyDelivery-0e8e2c05-d198-51b0-8fa2-ac80c118c73e.html"
      }],
      "reference" : {
        "reference" : "SupplyDelivery/0e8e2c05-d198-51b0-8fa2-ac80c118c73e"
      },
      "name" : "Shipment box (sent)",
      "description" : "A box with one specimen sent to the reference laboratory. type is omitted, the recommended fix for Known Issue 4. OpenELIS currently sends supply-item-type#medication with the display Specimen Shipment, which fails the required binding.",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-shipment-box"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-shipment-capacity.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/shipment-capacity"
      },
      "name" : "Shipment box capacity",
      "description" : "Number of specimens the box can hold. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/shipment-capacity (see Known Issues).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-shipment-content-item.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/shipment-content-item"
      },
      "name" : "Shipment content item",
      "description" : "One row of the box manifest. Repeats once per item in the box. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/shipment-content-item (see Known Issues).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-shipment-destination-org.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/shipment-destination-org"
      },
      "name" : "Shipment destination organization id",
      "description" : "UUID of the destination Organization. Kept for receivers that do not read the contained destination Location. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/shipment-destination-org (see Known Issues).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-shipment-non-conformity.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/shipment-non-conformity"
      },
      "name" : "Shipment non-conformity",
      "description" : "A problem recorded when the box was received (damaged, leaked, missing, rejected). SNOMED CT by default. Codes can be overridden per site. Only sent after reception. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/shipment-non-conformity (see Known Issues).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-shipment-notes.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/shipment-notes"
      },
      "name" : "Shipment notes",
      "description" : "Free-text notes on the box. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/shipment-notes (see Known Issues).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-shipment-source-org.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/shipment-source-org"
      },
      "name" : "Shipment source laboratory",
      "description" : "Name of the sending OpenELIS site (its configuration name). OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/shipment-source-org (see Known Issues).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-shipment-specimen-type-summary.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/shipment-specimen-type-summary"
      },
      "name" : "Shipment specimen type summary",
      "description" : "Count of items in the box per sample type. One repetition per distinct type, in no guaranteed order. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/shipment-specimen-type-summary (see Known Issues).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-shipment-temperature.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/shipment-temperature"
      },
      "name" : "Shipment temperature requirement",
      "description" : "Temperature the box must be kept at in transit. Free text (for example 2-8 °C). OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/shipment-temperature (see Known Issues).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-shipment-specimen.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/shipment-specimen"
      },
      "name" : "Shipped specimen",
      "description" : "A Specimen in the box. Repeats once per sample item with a FHIR id. The receiving site uses these references at reception. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/shipment-specimen (see Known Issues).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Organization"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Organization-a845f2db-10e5-5117-ac75-553f615e301a.html"
      }],
      "reference" : {
        "reference" : "Organization/a845f2db-10e5-5117-ac75-553f615e301a"
      },
      "name" : "Site Organization: Example District Hospital Laboratory",
      "description" : "The OpenELIS site's own facility Organization as pushed to the FHIR store at start-up (FhirFacilityOrganizationServiceImpl). It is the assigner of every facility identifier.",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-organization"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-storage-capacity.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/storage-capacity"
      },
      "name" : "Storage capacity",
      "description" : "Capacity of the location: the capacity limit of a device or shelf. On a box it is rows x columns and is only sent with rack-grid-dimensions. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/storage-capacity (see Known Issues).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-device-communication-protocol.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/device-communication-protocol"
      },
      "name" : "Storage device communication protocol",
      "description" : "Protocol used to talk to a connected storage device. Free text. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/device-communication-protocol (see Known Issues).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-device-ip-address.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/device-ip-address"
      },
      "name" : "Storage device IP address",
      "description" : "Network address of a connected storage device (for example a monitored freezer). OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/device-ip-address (see Known Issues).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-device-port.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/device-port"
      },
      "name" : "Storage device port",
      "description" : "Network port of a connected storage device. OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/device-port (see Known Issues).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Location"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Location-613ff118-ceeb-5472-9793-dc241d0d032c.html"
      }],
      "reference" : {
        "reference" : "Location/613ff118-ceeb-5472-9793-dc241d0d032c"
      },
      "name" : "Storage level: box",
      "description" : "A 9 x 9 cryobox in the rack. The physicalType follows the recommended fix for Known Issue 17. OpenELIS currently sends co with the display Container.",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-storage-location"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Location"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Location-3d2a1373-14d8-5bef-ae7e-817917e5a4fd.html"
      }],
      "reference" : {
        "reference" : "Location/3d2a1373-14d8-5bef-ae7e-817917e5a4fd"
      },
      "name" : "Storage level: device (freezer)",
      "description" : "A monitored -80 freezer in the room. The physicalType follows the recommended fix for Known Issue 17. OpenELIS currently sends ve (Vehicle).",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-storage-location"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Location"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Location-5a9cc354-9495-5090-91d7-b67b0d2ef5dc.html"
      }],
      "reference" : {
        "reference" : "Location/5a9cc354-9495-5090-91d7-b67b0d2ef5dc"
      },
      "name" : "Storage level: rack",
      "description" : "A rack on the shelf. The physicalType follows the recommended fix for Known Issue 17. OpenELIS currently sends co with the display Container.",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-storage-location"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Location"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Location-1fa151e6-afa2-531c-b70c-fd63b88c10f0.html"
      }],
      "reference" : {
        "reference" : "Location/1fa151e6-afa2-531c-b70c-fd63b88c10f0"
      },
      "name" : "Storage level: room",
      "description" : "Top of the storage hierarchy.",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-storage-location"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Location"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "Location-8264f454-03c2-597b-996d-b9ea0998f326.html"
      }],
      "reference" : {
        "reference" : "Location/8264f454-03c2-597b-996d-b9ea0998f326"
      },
      "name" : "Storage level: shelf",
      "description" : "A shelf in the freezer. The physicalType follows the recommended fix for Known Issue 17. OpenELIS currently sends co with the display Container.",
      "exampleCanonical" : "https://digi-uw.github.io/openelis-global2-fhir-ig/StructureDefinition/openelis-storage-location"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-storage-temperature.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/storage-temperature"
      },
      "name" : "Storage temperature",
      "description" : "Temperature setting of a storage device. The unit is not carried on the wire (see Known Issues). OpenELIS currently sends this extension with url http://openelis.org/fhir/extension/storage-temperature (see Known Issues).",
      "exampleBoolean" : false
    }],
    "page" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
        "valueUrl" : "toc.html"
      }],
      "nameUrl" : "toc.html",
      "title" : "Table of Contents",
      "generation" : "html",
      "page" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "index.html"
        }],
        "nameUrl" : "index.html",
        "title" : "Home",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "workflows.html"
        }],
        "nameUrl" : "workflows.html",
        "title" : "Exchange Workflows",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "api.html"
        }],
        "nameUrl" : "api.html",
        "title" : "OpenELIS FHIR REST API",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "identifiers.html"
        }],
        "nameUrl" : "identifiers.html",
        "title" : "Identifiers, Code Systems and URLs",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "known-issues.html"
        }],
        "nameUrl" : "known-issues.html",
        "title" : "Known Issues",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "changes.html"
        }],
        "nameUrl" : "changes.html",
        "title" : "Change Log",
        "generation" : "markdown"
      }]
    },
    "parameter" : [{
      "code" : "path-resource",
      "value" : "input/capabilities"
    },
    {
      "code" : "path-resource",
      "value" : "input/examples"
    },
    {
      "code" : "path-resource",
      "value" : "input/extensions"
    },
    {
      "code" : "path-resource",
      "value" : "input/models"
    },
    {
      "code" : "path-resource",
      "value" : "input/operations"
    },
    {
      "code" : "path-resource",
      "value" : "input/profiles"
    },
    {
      "code" : "path-resource",
      "value" : "input/resources"
    },
    {
      "code" : "path-resource",
      "value" : "input/vocabulary"
    },
    {
      "code" : "path-resource",
      "value" : "input/maps"
    },
    {
      "code" : "path-resource",
      "value" : "input/testing"
    },
    {
      "code" : "path-resource",
      "value" : "input/history"
    },
    {
      "code" : "path-resource",
      "value" : "fsh-generated/resources"
    },
    {
      "code" : "path-pages",
      "value" : "template/config"
    },
    {
      "code" : "path-pages",
      "value" : "input/assets"
    },
    {
      "code" : "path-pages",
      "value" : "input/images"
    },
    {
      "code" : "path-tx-cache",
      "value" : "input-cache/txcache"
    }]
  }
}

```
