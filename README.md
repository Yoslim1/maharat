# مهارات | Maharat

مستودع تجميعي منظم لـ **Agent Skills** ومراجعها، مخصص لمساعدة الوكلاء في تصميم الويب، Android وJetpack Compose، UX/UI، أنظمة الألوان، تحليل البيانات، هندسة الملفات، الاختبار، والأداء.

> هذا المستودع لا يدّعي ملكية المهارات المضمّنة. كل مهارة منسوخة تحتفظ بمصدرها وترخيصها، والمحتوى غير المرخص بوضوح يُحفظ كرابط مصدر فقط ولا يُعاد توزيعه هنا.

## ما الذي يحتويه؟

المجلد `skills/` يحتوي المهارات القابلة للاستخدام أو التحويل بصيغة `SKILL.md`، مع مواردها المساندة عندما تكون مطلوبة. المجلد `licenses/` يحتوي نصوص التراخيص المتاحة للمصادر المنسوخة. المجلد `upstreams/` يحتوي سجل المصادر، وحالة الترخيص، والمهارات التي نوصي باستيرادها مباشرة من المصدر بدل نسخها.

| المجال | المسار | المحتوى |
|---|---|---|
| Web وUX/UI | `skills/web/` | Design System، frontend design، accessibility، React وReact Native. |
| Android | `skills/android/` | Compose، Material 3، Navigation 3، edge-to-edge، testing، architecture، الأداء. |
| Data | `skills/data/` | EDA، scientific visualization، statistical analysis، data quality، وdata storytelling. |
| Architecture | `skills/architecture/` | API design، Clean/Hexagonal Architecture، bounded contexts، وADRs. |
| Workflow | `skills/workflow/` | التخطيط، TDD، debugging، code review، pre-build risk، والتحقق قبل التسليم. |
| Quality | `skills/quality/` | حواجز مراجعة للكود والاختبارات والتوثيق وWordPress وWooCommerce. |
| Kotlin | `skills/kotlin/` | مهارات Kotlin وtooling من مصدر JetBrains/Kotlin. |

## طريقة استخدام أي مهارة

انسخ مجلد المهارة المطلوب إلى مجلد المهارات الذي يقرأه وكيلك. غالبًا يكون المسار واحدًا من `.agents/skills/` أو `.claude/skills/` أو `.github/skills/` أو مجلدًا خاصًا بالوكيل. يجب أن يبقى ملف `SKILL.md` في جذر مجلد المهارة، ويمكن نسخ `references/` و`scripts/` معه إذا كانا موجودين.

```bash
# مثال عام لوكيل يقرأ .agents/skills/
cp -a skills/web/ui-ux-pro-max .agents/skills/

# مثال لمهارة Android
cp -a skills/android/material-3 .agents/skills/
```

يمكن أيضًا استخدام المصدر الأصلي مباشرة عندما يكون ذلك أفضل للتحديثات أو عندما لا نملك ترخيص إعادة توزيع واضحًا. راجع `CATALOG.md` و`ATTRIBUTION.md` قبل نشر أي نسخة أخرى أو إدخالها في منتج تجاري.

## ترتيب الأولوية المقترح

لإنشاء موقع، ابدأ بـ `workflow/before-you-build` لتحديد الحاجة والنطاق، ثم اختر **طبقة تصميم واحدة**: إما `web/ui-ux-pro-max` كنظام شامل، أو مجموعة `web/jakub-*` عندما تريد مراجعة modular. استخدم `web/jakub-better-interface` للمراجعة الشاملة، والمهارات المتخصصة للألوان والطباعة والوصولية والتخطيط فقط عند الحاجة. بعد ذلك استخدم `web/design-system-patterns` و`web/responsive-design`، ثم `web/interaction-design` للصقل. لتطبيق Android، ابدأ بـ `android/google-jetpack-compose` و`android/material-3`، ثم استخدم Chris Banes أو Android Ninja عند الحاجة إلى state أو performance أو architecture. للبيانات، ابدأ بـ `data/exploratory-data-analysis`، ثم `data/data-quality-frameworks`، واستخدم `data/scientific-visualization` و`data/statistical-analysis` حسب السؤال. لهندسة المشروع، استخدم `architecture/architecture-patterns` و`architecture/api-design-principles` قبل إنشاء خدمة جديدة، وسجل القرار في `architecture/architecture-decision-records`. بعد التعديل شغّل `quality/guard-skills/clean-code-guard` و`quality/guard-skills/test-guard`، ويمكن استخدام `workflow/bounded-self-improvement` لتسجيل lessons واقتراح تحسينات بموافقة بشرية. لا تستخدم عدة حزم شاملة متداخلة في الوقت نفسه.

## التحديثات

هذا المستودع **snapshot تجميعي** وليس forkًا آليًا لكل upstream، لكن توجد الآن مزامنة تلقائية آمنة عبر `.github/workflows/sync-skills.yml`. تعمل المزامنة أسبوعيًا أو يدويًا من تبويب Actions، وتقرأ فقط المسارات الموجودة في `upstreams/sync-manifest.json`، ثم تشغّل `scripts/validate-maharat.sh` وتفتح Pull Request عند وجود تغييرات. لا يتم الدمج تلقائيًا؛ يجب مراجعة الفرق والتراخيص والملفات الجديدة قبل الدمج.

للمزامنة اليدوية من جهازك:

```bash
python3 scripts/sync_sources.py --check  # فحص المصادر دون تعديل
python3 scripts/sync_sources.py          # مزامنة المسارات المسموح بها
bash scripts/validate-maharat.sh
```

لا تشغّل أي script من مصدر خارجي قبل مراجعة محتواه. المزامنة نفسها لا تنفذ ملفات upstream؛ هي تجلب وتنسخ المسارات المسجلة فقط.

## الترخيص

ملفات الربط والفهرسة التي أنشأها هذا المستودع مرخصة تحت MIT كما هو موضح في `LICENSE`. أما المهارات المنسوخة فتخضع لتراخيص أصحابها الموضحة في `licenses/` و`ATTRIBUTION.md`. بعض المصادر غير المنسوخة لا تحتوي على ملف ترخيص واضح في لقطة المصدر؛ لذلك نحتفظ بروابطها فقط ولا نعيد توزيع ملفاتها.

## المراجع

المصادر الأساسية هي [UI UX Pro Max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)، [jakubkrehel/skills](https://github.com/jakubkrehel/skills)، [wshobson/agents](https://github.com/wshobson/agents)، و[K-Dense scientific-agent-skills](https://github.com/K-Dense-AI/scientific-agent-skills)، إلى جانب [Android Skills الرسمي](https://github.com/android/skills)، [Material 3 Skill](https://github.com/hamen/material-3-skill)، [Chris Banes Skills](https://github.com/chrisbanes/skills)، [Anthropic Frontend Design](https://github.com/anthropics/claude-code/tree/main/plugins/frontend-design)، [Superpowers](https://github.com/obra/superpowers)، [Kotlin Agent Skills](https://github.com/Kotlin/kotlin-agent-skills)، [Android Ninja](https://github.com/Drjacky/claude-android-ninja)، [Compose Performance Skills](https://github.com/skydoves/compose-performance-skills)، [amElnagdy guard-skills](https://github.com/amElnagdy/guard-skills)، [amElnagdy ui-review-loop](https://github.com/amElnagdy/ui-review-loop)، و[amElnagdy review-skills](https://github.com/amElnagdy/review-skills)، و[addyosmani/agent-skills](https://github.com/addyosmani/agent-skills). راجع `CATALOG.md` و`ATTRIBUTION.md` للقائمة الكاملة وحالة كل مصدر، و`docs/global-skill-selection-ar.md` لشرح الاختيارات العالمية.

## تحديث OpenCode تلقائيًا

تحديث GitHub Actions للمصادر لا يغيّر مجلد OpenCode على جهازك مباشرة. لتحديث OpenCode تلقائيًا من آخر نسخة مدمجة في Maharat، استخدم `scripts/update-opencode-skills.sh`. السكربت يرفض العمل إذا كان Maharat يحتوي تغييرات محلية، يسحب الفرع المحدد بـ`MAHARAT_BRANCH`، يشغّل الفحص، ثم ينسخ كل مجلد يحتوي `SKILL.md` إلى `~/.config/opencode/skills` أو إلى المسار المحدد في `OPENCODE_SKILLS_DIR`.

للتشغيل اليدوي:

```bash
cd ~/maharat
bash scripts/update-opencode-skills.sh
```

ولتشغيله يوميًا عبر cron على الجهاز الذي يستخدم OpenCode:

```bash
(crontab -l 2>/dev/null; echo '17 4 * * * cd /root/maharat && /bin/bash scripts/update-opencode-skills.sh >> /root/.cache/maharat-opencode-update.log 2>&1') | crontab -
```

إذا كان المستخدم أو المسار مختلفًا، غيّر `/root/maharat` وملف السجل. هذا التحديث يثبت آخر نسخة موجودة في `master` فقط؛ أما تحديث المصادر الأصلية فيمر أولًا عبر GitHub Actions وPull Request، ولا يدخل إلى `master` إلا بعد المراجعة والدمج. بعد التحديث، أعد تشغيل OpenCode إذا كانت الجلسة الحالية لا تكتشف المهارات الجديدة.
