# OpenELIS Global FHIR Implementation Guide

This repository holds the HL7 FHIR R4 Implementation Guide for [OpenELIS Global](https://openelis-global.org). The
guide covers profiles, extensions, identifier systems, the OpenELIS FHIR REST API, and the exchange workflows OpenELIS
supports: EMR lab orders and results, lab-to-lab referral, specimen shipment, sample storage and analyzers.

* **Published guide (CI build):** https://digi-uw.github.io/openelis-global2-fhir-ig/
* **Documentation (Confluence):** [FHIR Implementation Guide](https://uwdigi.atlassian.net/wiki/spaces/oeg/pages/1683488769/FHIR+Implementation+Guide) in the
  [OpenELIS Global space](https://uwdigi.atlassian.net/wiki/spaces/oeg/overview)
* **OpenELIS source:** https://github.com/DIGI-UW/OpenELIS-Global-2

The profiles describe what OpenELIS actually sends and accepts. When OpenELIS changes, update the profiles in the
same release. Gaps between OpenELIS and FHIR are listed in
[`input/pagecontent/known-issues.md`](input/pagecontent/known-issues.md).

## Repository layout

| Path | Contents |
|---|---|
| `sushi-config.yaml` | IG metadata, pages and menu |
| `input/fsh/` | FHIR Shorthand: aliases and rule sets, naming systems, terminology, extensions, profiles, examples, CapabilityStatement |
| `input/pagecontent/` | Narrative pages (Markdown) |
| `input/images/` | Sequence diagrams (SVG) |
| `local-template/` | OpenELIS branding on top of `fhir2.base.template` |
| `.github/workflows/` | `test.yml` builds every pull request. `publish.yml` publishes `main` to GitHub Pages. |

## Building locally

Prerequisites: Java 17 or later, Node.js 18 or later, Ruby and Jekyll.

```sh
npm install -g fsh-sushi      # FHIR Shorthand compiler
gem install jekyll            # used by the IG Publisher to render pages
./_updatePublisher.sh         # downloads the latest IG Publisher into input-cache/
./_genonce.sh                 # runs SUSHI and the IG Publisher
open output/index.html
```

To check only the FHIR Shorthand, which is much faster, run `sushi build .`. Review `output/qa.html` after a full build.
Pull requests upload the QA report as a build artifact named `ig-qa-report`.

## Conventions

* One NamingSystem per identifier system. Identifier systems use the default OpenELIS base
  `http://openelis-global.org` (property `org.openelisglobal.oe.fhir.system`).
* All definitions use the IG canonical. Where OpenELIS sends a different URL today, the definition's description says
  so, and `identifiers.md` maps wire URLs to definitions.
* Each profile has a `Mapping` to the OpenELIS data model (`Target: https://github.com/DIGI-UW/OpenELIS-Global-2`).
* Examples are one fictional scenario that references itself consistently. Do not use real people's names.

## Licence

CC-BY-SA-4.0. See [LICENSE.md](LICENSE.md).
