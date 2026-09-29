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
* The Device profile now matches the analyzer Device OpenELIS sends. Its URL is pinned to the `meta.profile` value
  OpenELIS uses. The unused communication-mode, protocol-version, transport, location and identifier-pattern
  extensions were removed.
* The Location "facility" profile, which OpenELIS never produced, was replaced by the Storage Location profile.

**Extensions, terminology and identifiers**

* Added the 22 extensions OpenELIS sends, with their URLs pinned to the wire: collection GPS, analyzer, storage and
  shipment.
* Replaced the grouped NamingSystems with one NamingSystem per identifier system. Added the missing systems:
  `order_uuid`, `order_accessionNumber`, `provider_uuid`, `facility_id`, `analyzer_uuid`, `analyzer_bridge_connection`,
  `storage-location-code` and `shipment/box-id`.
* Added CodeSystems for the storage hierarchy, storage device types, analyzer operational status and OpenELIS's local
  code systems.

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
