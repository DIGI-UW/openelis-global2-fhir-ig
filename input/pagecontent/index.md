### Scope
This is the Implementation Guide covering the OpenELIS GLOBAL2 implementation of FHIR Exchange between OpenELIS Global and other FHIR-enabled health information systems For example OpenMRS EMR

### Summary
 This Implementation Guide contains standards-compliant, open specifications for the transmission of OpenELIS Global2 data between various health systems that  do support HL7 FHIR.The contained specifications cover, for example, the following scenario:
<ol>
    <li>A Lab Test Order is made using an Electronic Medical Record (EMR) system</li>
    <li>The order is sent to a Lab Information System (LIS)</li>
    <li>The Lab Test is performed and resulted</li>
    <li>The results are sent back to the EMR for review by the medical team and patients</li>
</ol>

 This IG is based on guidance from the FHIR documentation on the <a href="{{site.data.fhir.path}}resourcelist.html">HL7 FHIR Resources</a>

### About this IG
 The top menu allows quick navigation to the different sections, and a <a href="toc.html">Table of Contents</a> is provided with the entire content of this Implementation Guide. (Be aware that some pages have multiple tabs).

### FHIR Exchange Workflow Diagram

This IG contains the technical artifacts describing how to implement this workflow using FHIR Resources.

![workflow](assets/images/exchange_workflow.png)

### Supported Resources

[OpenELIS Global2 Exchange](https://github.com/DIGI-UW/dataexport) supports the export of the following FHIR Resources

  1. [Patient](StructureDefinition-openelis-patient.html)
  2. [Observation](StructureDefinition-open-elis-observation.html)
  3. [Practitioner](StructureDefinition-open-elispractitioner.html)
  4. [DiagnosticReport](StructureDefinition-openelis-diagnostic-report.html)
  5. [ServiceRequest](StructureDefinition-openelis-service-request.html)
  6. [Specimen](StructureDefinition-open-elis-specimen.html)
  7. [Task](StructureDefinition-openelis-task.html)
  8. [Organization](StructureDefinition-open-elisorganisation.html)

### Intellectual Property Considerations
While this implementation guide and the underlying FHIR are licensed as
public domain, this guide includes examples making use of terminologies such as LOINC, SNOMED CT and others which have more restrictive licensing requirements. Implementers should make themselves familiar with licensing and any other constraints of terminologies questionnaires, and other components used as part of their implementation process. In some cases,licensing requirements may limit the systems that data captured using certain questionnaires may be shared with.

### Disclaimer
The specification herewith documented is a demo working specification, and may not be used for any implementation purposes. This draft is provided without warranty of completeness or consistency, and the official publication supersedes this draft. No liability can be inferred from the use or misuse of this specification, or its consequences.
