# Attribution and License Map

هذا الملف جزء من حزمة الفهرسة التي أنشأها Maharat. لا يغيّر ترخيص أي محتوى منسوخ.

## Vendored skills

| Local path | Upstream source | License evidence | Notes |
|---|---|---|---|
| `skills/web/ui-ux-pro-max` | https://github.com/nextlevelbuilder/ui-ux-pro-max-skill | `licenses/nextlevelbuilder-ui-ux-pro-max-MIT` | Includes the selected skill, data, references, and scripts needed by the design-system workflow. |
| `skills/web/anthropic-frontend-design` | https://github.com/anthropics/claude-code/tree/main/plugins/frontend-design | `licenses/anthropics-claude-code-license.md` | Copied as a standalone frontend-design skill package. |
| `skills/android/google-jetpack-compose` | https://github.com/android/skills/tree/main/jetpack-compose | `licenses/android-skills-Apache-2.0.txt` | Google Android source; includes adaptive, migration, and theming/style paths. |
| `skills/android/google-navigation-3` | https://github.com/android/skills/tree/main/navigation/navigation-3 | `licenses/android-skills-Apache-2.0.txt` | Official Android Navigation 3 skill. |
| `skills/android/google-edge-to-edge` | https://github.com/android/skills/tree/main/system/edge-to-edge | `licenses/android-skills-Apache-2.0.txt` | Official Android edge-to-edge skill. |
| `skills/android/google-testing-setup` | https://github.com/android/skills/tree/main/testing/testing-setup | `licenses/android-skills-Apache-2.0.txt` | Official Android testing setup skill. |
| `skills/android/material-3` | https://github.com/hamen/material-3-skill | `licenses/hamen-material-3-MIT` | Material 3 references, tokens, theming, and audit workflow. |
| `skills/android/chrisbanes-*` | https://github.com/chrisbanes/skills | `licenses/chrisbanes-skills-license` | Focused Compose state/effects, performance, component design, and focus navigation. |
| `skills/android/rcosteira79` | https://github.com/rcosteira79/android-skills | `licenses/rcosteira79-android-skills-MIT` | Android/KMP architecture, data layer, Compose, Gradle, testing, and related skills. |
| `skills/android/android-ninja` | https://github.com/Drjacky/claude-android-ninja | `licenses/drjacky-android-ninja-Apache-2.0.md` | Standalone Android reference with references and templates. |
| `skills/android/skydoves-compose-performance` | https://github.com/skydoves/compose-performance-skills | `licenses/skydoves-compose-performance-Apache-2.0` | Compose performance-specific skills and audit workflow. |
| `skills/kotlin/jetbrains` | https://github.com/Kotlin/kotlin-agent-skills | `licenses/kotlin-agent-skills-Apache-2.0` | Kotlin tooling and migration skills from the Kotlin incubator repository. |
| `skills/workflow/superpowers/*` | https://github.com/obra/superpowers | `licenses/obra-superpowers-license` | Selected planning, TDD, debugging, review, and verification skills. |

## Additional vendored skills from amElnagdy

| Local path | Upstream source | License evidence | Notes |
|---|---|---|---|
| `skills/quality/guard-skills/*` | https://github.com/amElnagdy/guard-skills | `licenses/amelnagdy-guard-skills-MIT.txt` | Five quality guards: clean code, tests, docs, WordPress, and WooCommerce. |
| `skills/web/ui-review-loop` | https://github.com/amElnagdy/ui-review-loop | `licenses/amelnagdy-ui-review-loop-Apache-2.0.txt` | Includes the recorder, review server, references, and templates. Video and form values may contain sensitive data. |
| `skills/workflow/review-skills/*` | https://github.com/amElnagdy/review-skills | `licenses/amelnagdy-review-skills-MIT.txt` | Debate-review and babysit-pr. Requires authenticated forge CLI and explicit operational approval before posting. |

## Reference-only sources

The following sources are linked but not copied because a clear redistributable license file or GitHub license metadata was not available in the checked snapshot:

| Source | Useful skills | Local reference |
|---|---|---|
| https://github.com/vercel-labs/agent-skills | `web-design-guidelines`, `react-best-practices`, `react-native-skills`, `composition-patterns` | `upstreams/vercel-agent-skills.md` |
| https://github.com/nimrodfisher/data-analytics-skills | `programmatic-eda`, `data-quality-audit`, `schema-mapper`, `query-validation`, `visualization-builder`, `dashboard-specification`, `insight-synthesis`, `analysis-planning` | `upstreams/data-analytics-skills.md` |

## Operational safety notes

`skills/web/ui-review-loop` must be run with synthetic data or explicit redaction planning because video pixels are not redacted. `skills/workflow/review-skills` can post comments and resolve threads through the user's forge account; keep it in an advanced category and preview with dry-run where available. `skills/quality/guard-skills` are review lenses and do not replace project tests, linters, or security review.

## Redistribution rules

Keep this file and the relevant license file beside any redistributed copy. Do not remove upstream copyright notices or attribution. Check the upstream repository and its current license before updating or shipping a copied skill in a commercial product. A public GitHub repository is not, by itself, a license to copy content.
