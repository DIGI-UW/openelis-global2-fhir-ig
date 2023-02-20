### Scope <a name="scope"> </a>
This is the Implementation Guide covering the OpenELIS GLOBAL2 implementation of FHIR Exchange between OpenELIS Global and other FHIR-enabled health information systems For example OpenMRS EMR

### Summary <a name="summary"> </a>
 This Implementation Guide contains standards-compliant, open specifications for the transmission of OpenELIS Global2 data between various health systems that  do support HL7 FHIR.The contained specifications cover, for example, the following scenario:
<ol>
    <li>A Lab Test Order is made using an Electronic Medical Record (EMR) system</li>
    <li>The order is sent to a Lab Information System (LIS)</li>
    <li>The Lab Test is performed and resulted</li>
    <li>The results are sent back to the EMR for review by the medical team and patients</li>
</ol>

 This IG is based on guidance from the FHIR documentation on the <a href="https://www.hl7.org/fhir/resourcelist.html">hl7 fhir Resources</a>

### About this IG
 The top menu allows quick navigation to the different sections, and a <a href="toc.html">Table of Contents</a> is provided with the entire content of this Implementation Guide. (Be aware that some pages have multiple tabs).

### Supported Resources

[OpenELIS Global2 Exchange](https://github.com/I-TECH-UW/dataexport/tree/4e7785d077a7f319c4b192d7465317b2da3ada2e) supports the export of the following FHIR Resources
  
  1. [Patient](https://i-tech-uw.github.io/openelis-global2-fhir-ig/StructureDefinition-openelis-patient.html)
  2. [Observation](https://i-tech-uw.github.io/openelis-global2-fhir-ig/StructureDefinition-open-elis-observation.html)
  3. [Practitioner](https://i-tech-uw.github.io/openelis-global2-fhir-ig/StructureDefinition-open-elispractitioner.html)
  4. [DiagnosticReport](https://i-tech-uw.github.io/openelis-global2-fhir-ig/StructureDefinition-openelis-diagnostic-report.html)
  5. [ServiceRequest](https://i-tech-uw.github.io/openelis-global2-fhir-ig/StructureDefinition-openelis-service-request.html)
  6. [Specimen](https://i-tech-uw.github.io/openelis-global2-fhir-ig/StructureDefinition-open-elis-specimen.html)
  7. [Task](https://i-tech-uw.github.io/openelis-global2-fhir-ig/StructureDefinition-openelis-task.html)
  8. [Organization](https://i-tech-uw.github.io/openelis-global2-fhir-ig/StructureDefinition-open-elisorganisation.html)

### Intellectual Property Considerations  <a name="ip"> </a>
While this implementation guide and the underlying FHIR are licensed as
public domain, this guide includes examples making use of terminologies such as LOINC, SNOMED CT and others which have more restrictive licensing requirements. Implementers should make themselves familiar with licensing and any other constraints of terminologies questionnaires, and other components used as part of their implementation process. In some cases,licensing requirements may limit the systems that data captured using certain questionnaires may be shared with.

### Disclaimer  <a name="disclaimer"> </a>
The specification herewith documented is a demo working specification, and may not be used for any implementation purposes. This draft is provided without warranty of completeness or consistency, and the official publication supersedes this draft. No liability can be inferred from the use or misuse of this specification, or its consequences.
