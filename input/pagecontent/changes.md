### 0.2.2 (October 2026)

The remaining Known Issues were rechecked against OpenELIS `develop` at commit `f863283` (14 October 2026).

* Known Issue 31 is removed: `_sort` is no longer silently ignored. The REST server now refuses any search parameter
  it cannot apply with `400` and an OperationOutcome (see [REST API](api.html#search)); `Prefer: handling=lenient`
  drops them instead. The other items are still true and keep their numbers.
* Known Issues now link the OpenELIS Jira ticket for each item.
* CapabilityStatement: Patient search adds `address-city`, `address-state`, `address-postalcode`, `address-country`,
  `telecom`, `email` and `phone`.
* REST API page: strict search, malformed ids (`400`), records without a UUID left out of searches, and how updates
  behave.
* Observation: a coded result carries one coding per code the answer has in any terminology (LOINC, SNOMED CT, CIEL,
  OCL), then the OpenELIS dictionary entry.
* Patient: blank telecom values are not sent.

### 0.2.1 (October 2026)

Known Issues 2, 3, 5, 6, 8 to 15, 22 and 28 are fixed in OpenELIS `develop` and removed. The remaining items keep
their numbers.

* ServiceRequest: `subject` is required. An order without a patient has its sampling site's Location or a contained
  Group. `locationReference` and that subject point at the new **Site Location** profile (an organization's Location,
  same id), which OpenELIS now writes to the FHIR store and serves. `authoredOn` is the request date, else the entry
  date. `basedOn` names the incoming ServiceRequest by id.
* Order Task: every status maps to a value, and `output.type` is `{base}/task_output#DiagnosticReport`.
* Specimen: `collection.collector` carries the collector's name, and `container.specimenQuantity` sends a UCUM code
  only when the unit has one.
* Observation: `performer` is the validating user (display only), on finalized results.
* Patient: `gender` maps O to other and anything unrecognised to unknown.
* Identifiers are never sent without a value; the Organization `org_uuid` identifier is sent whenever the
  organization has a UUID.

### 0.2.0 (September 2026)

A full revision, aligning the guide with OpenELIS Global 3.x (`develop` at commit `889166b`).

**Build and publication**

* The canonical URL is now `https://digi-uw.github.io/openelis-global2-fhir-ig`, where the guide is published. The old
  canonical (`http://digi-uw.github.io/openelis-global-ig`) did not resolve.
* The package id is now `org.openelisglobal.fhir`.
* The local template now builds on `fhir2.base.template`. The old base, `fhir.base.template`, was withdrawn after the
  [March 2026 FHIR package security notice](https://www.fhir.org/guides/security-notices/2026-03-npm-dependencies.html).
* The menu is generated from `sushi-config.yaml`. The CI workflows use current GitHub Actions versions.

**Profiles**

* Renamed profile ids to a consistent `openelis-*` pattern (for example `open-elisorganisation` became
  `openelis-organization`).
* Every existing profile was corrected against the code. Among the fixes:
  * Patient identifiers are no longer all required.
  * `ServiceRequest.requisition` now carries the lab number (`samp_labNo` was previously modelled as an identifier).
  * `DiagnosticReport.result` now allows several Observations.
  * Observation values can be Quantity, CodeableConcept or string.
  * Practitioner no longer requires a telephone number.
  * Specimen collector and ServiceRequest encounter, which OpenELIS never sends, are no longer expected.
* Added the facility identifier slice OpenELIS puts on most resources.
* Added profiles:
  * Lab Order Request Task and ServiceRequest (what an EMR must send)
  * Order Task and Referral Task
  * Storage Location
  * Shipment Box (SupplyDelivery)
* The Device profile now matches the analyzer Device OpenELIS sends. The unused communication-mode, protocol-version, transport, location and identifier-pattern
  extensions were removed.
* The Location "facility" profile, which OpenELIS never produced, was replaced by the Storage Location profile.

**Extensions, terminology and identifiers**

* Added definitions for the 22 extensions OpenELIS sends (collection GPS, analyzer, storage and shipment). Each one
  names the URL OpenELIS currently uses. The Identifiers & URLs page maps wire URLs to definitions.
* Replaced the grouped NamingSystems with one NamingSystem per identifier system. Added the missing systems:
  `order_uuid`, `order_accessionNumber`, `provider_uuid`, `facility_id`, `analyzer_uuid`, `analyzer_bridge_connection`,
  `storage-location-code` and `shipment/box-id`.
* Documented OpenELIS's local code systems and added a CodeSystem for the analyzer operational status.

**Pages and examples**

* Added a CapabilityStatement for the OpenELIS FHIR REST API, and new pages: FHIR API, Identifiers & URLs, Known
  Issues.
* Rewrote the Home and Workflows pages. They now cover EMR orders, lab-to-lab referral, specimen shipment, the
  subscriber push and registry imports, with configuration properties and new sequence diagrams. They link to the
  OpenELIS Global Confluence documentation.
* Replaced the examples with one fictional worked scenario that references itself consistently: order, specimen,
  results, referral, analyzer, storage and shipment.

### 0.1.0 (2021)

* Initial version, based on FHIR R4.
