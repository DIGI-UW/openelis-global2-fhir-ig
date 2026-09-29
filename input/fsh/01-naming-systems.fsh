// One NamingSystem per identifier system OpenELIS puts on the wire.
// Parameters must not contain unescaped commas.

// --- Patient (PatientTransformServiceImpl) ---
Instance: oe-ns-pat-uuid
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OEPatientUUID, http://openelis-global.org/pat_uuid, OpenELIS internal UUID of the patient. Equals Patient.id.)

Instance: oe-ns-pat-national-id
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OEPatientNationalId, http://openelis-global.org/pat_nationalId, National identifier entered in OpenELIS. Sent with Identifier.use = official.)

Instance: oe-ns-pat-subject-number
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OEPatientSubjectNumber, http://openelis-global.org/pat_subjectNumber, Subject (study or programme\) number entered in OpenELIS.)

Instance: oe-ns-pat-st-number
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OEPatientSTNumber, http://openelis-global.org/pat_stNumber, ST number entered in OpenELIS.)

Instance: oe-ns-pat-guid
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OEPatientGUID, http://openelis-global.org/pat_guid, Patient GUID held in OpenELIS. On import OpenELIS reads this system as the external patient id.)

// --- Site / facility ---
Instance: oe-ns-facility-id
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OEFacilityId, http://openelis-global.org/facility_id, Identifier of the OpenELIS site (org.openelisglobal.facility.id\). Added to most resources OpenELIS produces with the site Organization as assigner.)

// --- Order and test request ---
Instance: oe-ns-order-uuid
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OEOrderUUID, http://openelis-global.org/order_uuid, UUID of the OpenELIS order (Sample\). Carried on Task.)

Instance: oe-ns-order-accession
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OEOrderAccessionNumber, http://openelis-global.org/order_accessionNumber, Lab (accession\) number of the OpenELIS order. Carried on Task.)

Instance: oe-ns-analysis-uuid
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OEAnalysisUUID, http://openelis-global.org/analysis_uuid, UUID of the OpenELIS test request (Analysis\). Carried on ServiceRequest.)

Instance: oe-ns-samp-labno
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OESampleLabNumber, http://openelis-global.org/samp_labNo, Lab (accession\) number of the order. Carried in ServiceRequest.requisition.)

// --- Specimen ---
Instance: oe-ns-sampleitem-uuid
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OESampleItemUUID, http://openelis-global.org/sampleItem_uuid, UUID of the OpenELIS sample item. Carried on Specimen.identifier.)

Instance: oe-ns-sampleitem-labno
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OESampleItemLabNumber, http://openelis-global.org/sampleItem_labNo, Accession number of the sample item: the order lab number followed by -{sortOrder}. Carried in Specimen.accessionIdentifier.)

// --- Results ---
Instance: oe-ns-result-uuid
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OEResultUUID, http://openelis-global.org/result_uuid, UUID of the OpenELIS result. Carried on Observation.)

Instance: oe-ns-analysis-result-uuid
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OEAnalysisResultUUID, http://openelis-global.org/analysisResult_uuid, Identifier of a DiagnosticReport. The value is the Analysis UUID so it equals the matching ServiceRequest id.)

// --- Practitioner / Organization ---
Instance: oe-ns-provider-uuid
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OEProviderUUID, http://openelis-global.org/provider_uuid, UUID of the OpenELIS provider. Carried on Practitioner.)

Instance: oe-ns-org-uuid
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OEOrganizationUUID, http://openelis-global.org/org_uuid, UUID of the OpenELIS organization.)

Instance: oe-ns-org-code
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OEOrganizationCode, http://openelis-global.org/org_code, Organization code configured in OpenELIS.)

Instance: oe-ns-org-shortname
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OEOrganizationShortName, http://openelis-global.org/org_shortName, Organization short name configured in OpenELIS.)

Instance: oe-ns-org-clianum
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OEOrganizationCLIANumber, http://openelis-global.org/org_cliaNum, CLIA (or equivalent accreditation\) number of the organization.)

// --- Analyzer ---
Instance: oe-ns-analyzer-uuid
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OEAnalyzerUUID, http://openelis-global.org/analyzer_uuid, UUID of the OpenELIS analyzer. Carried on Device.)

Instance: oe-ns-analyzer-bridge-connection
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OEAnalyzerBridgeConnection, http://openelis-global.org/analyzer_bridge_connection, Connection id of the analyzer in the OpenELIS analyzer bridge. On import OpenELIS accepts any system ending in /analyzer_bridge_connection.)

// --- Storage and shipment (hard-coded http://openelis.org base) ---
Instance: oe-ns-storage-location-code
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OEStorageLocationCode, http://openelis.org/storage-location-code, Hierarchical code of a storage location (room / equipment / shelf / rack / box\) joined with hyphens.)

Instance: oe-ns-shipment-box-id
InstanceOf: NamingSystem
Usage: #definition
* insert OEIdentifierNamingSystem(OEShipmentBoxId, http://openelis.org/shipment/box-id, Identifier of a shipping box. Carried on SupplyDelivery.)
