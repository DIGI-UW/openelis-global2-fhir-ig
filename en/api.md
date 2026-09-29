# OpenELIS FHIR REST API - OpenELIS Global FHIR Implementation Guide v0.2.0

## OpenELIS FHIR REST API

OpenELIS includes a FHIR R4 REST server built on HAPI FHIR. It reads from and writes to the OpenELIS database directly, so what it returns is always current. The co-resident FHIR store is a separate server (see [Home](index.md#how-openelis-uses-fhir)). The machine-readable description is the [OpenELIS Global FHIR REST server CapabilityStatement](CapabilityStatement-OpenELISFhirServer.md).

### Base URL

| | |
| :--- | :--- |
| Through the bundled nginx proxy | `https://{host}/api/OpenELIS-Global/fhir` |
| Direct to Tomcat | `https://{host}:8443/api/OpenELIS-Global/fhir` |

`GET {base}/metadata` returns the server's generated CapabilityStatement. Like every other request, it needs authentication.

### Authentication

* TLS is required.
* Send the credentials of an OpenELIS user with HTTP Basic authentication (`Authorization: Basic ...`). Create a dedicated user for each integration.
* Browser sessions of logged-in OpenELIS users also work (CSRF protection applies to writes).
* Sites can additionally enable client-certificate and OAuth2 / OIDC login.
* Requests with no credentials are redirected to the OpenELIS login page. A client sees an HTTP redirect, not a FHIR OperationOutcome.

### Resources and interactions

| | | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Patient | Patient | yes | yes | yes | yes | FHIR store copy only (see below) |
| ServiceRequest | Analysis (one per ordered test) | yes | yes | yes | yes | soft (cancels the test) |
| DiagnosticReport | Analysis | yes | yes | no | no | soft (cancels the test) |
| Observation | Result | yes | yes | yes | yes | soft |
| Specimen | Sample item | yes | yes | yes | yes | soft (cancels the sample item) |
| Practitioner | Provider | yes | yes | yes | yes (name, telecom) | soft (active = false) |
| Organization | Organization | yes | yes | yes | yes (name, active, partOf) | soft (inactive) |
| Location | Storage room / device / shelf / rack / box | yes | yes | yes | yes | soft (inactive) |
| Device | Analyzer | yes | yes | yes | yes | soft (inactive) |

Task, SupplyDelivery, Questionnaire and QuestionnaireResponse are **not** served by this API. Read them from the co-resident FHIR store.

Not supported: vread, history, patch, conditional create / update / delete, batch and transaction, and operations.

### Search

* Every resource supports `_id`, `identifier`, `_lastUpdated`, `_count` and `_offset`. Other parameters, and the supported `_include` / `_revinclude` values, are listed per resource in the [CapabilityStatement](CapabilityStatement-OpenELISFhirServer.md).
* Paging is by offset. The default page size is 20. `Bundle.total` is populated.
* `_sort` is accepted but has no effect. Results are returned in database insertion order.
* String parameters match case-insensitively from the start of the value. `:exact` and `:contains` are supported.
* `patient` and `subject` are interchangeable on ServiceRequest, Specimen, Observation and DiagnosticReport.

Useful searches:

```
GET {base}/Patient?identifier=http://openelis-global.org/pat_nationalId|NID-000-123-456
GET {base}/Specimen?accession=EDH26000000417-1&_include=Specimen:patient
GET {base}/ServiceRequest?patient=Patient/{id}&_revinclude=DiagnosticReport:based-on
GET {base}/Observation?based-on=ServiceRequest/{id}&status=final
GET {base}/DiagnosticReport?patient=Patient/{id}&issued=ge2026-09-01&_include=DiagnosticReport:result
GET {base}/Location?_tag=http://openelis.org/fhir/tag/storage-hierarchy|device&_include=Location:partof

```

### Behaviour to know about

* **Ids.** Ids are OpenELIS FHIR UUIDs. A ServiceRequest and the DiagnosticReport for the same test have the same id. Some older records without a UUID are served with their numeric database id.
* **Soft delete.** `DELETE` cancels or deactivates the record. A later `GET` still returns it (200, not 410), with the cancelled or inactive status.
* **Creating a ServiceRequest** requires `subject` (an existing Patient), `code`, and `specimen` (an existing Specimen, which supplies the lab number and sample item).
* **Deleting a Patient** leaves the OpenELIS patient unchanged. It only marks the copy in the FHIR store `active = false`.
* **Organization addresses** are limited by legacy columns (line and city 30 characters, state 2, postal code 10). Longer values are rejected with 422 naming the field.
* **Most writes are mirrored** to the co-resident FHIR store, so subscribers see them too. Specimen delete is not.

Gaps between this behaviour and the FHIR specification are tracked on [Known Issues](known-issues.md).

