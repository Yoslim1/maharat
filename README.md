# مهارات | Maharat

مستودع تجميعي منظم لـ **Agent Skills** ومراجعها، مخصص لمساعدة الوكلاء في تصميم الويب، Android وJetpack Compose، UX/UI، أنظمة الألوان، تحليل البيانات، هندسة الملفات، الاختبار، والأداء.

> هذا المستودع لا يدّعي ملكية المهارات المضمّنة. كل مهارة منسوخة تحتفظ بمصدرها وترخيصها، والمحتوى غير المرخص بوضوح يُحفظ كرابط مصدر فقط ولا يُعاد توزيعه هنا.

## ما الذي يحتويه؟

المجلد `skills/` يحتوي المهارات القابلة للاستخدام أو التحويل بصيغة `SKILL.md`، مع مواردها المساندة عندما تكون مطلوبة. المجلد `licenses/` يحتوي نصوص التراخيص المتاحة للمصادر المنسوخة. المجلد `upstreams/` يحتوي سجل المصادر، وحالة الترخيص، والمهارات التي نوصي باستيرادها مباشرة من المصدر بدل نسخها.

| المجال | المسار | المحتوى |
|---|---|---|
| Web وUX/UI | `skills/web/` | Design System، frontend design، accessibility، React وReact Native. |
| Android | `skills/android/` | Compose، Material 3، Navigation 3، edge-to-edge، testing، architecture، الأداء. |
| Data | `skills/data/` | مرجع مصدر لمهارات EDA وجودة البيانات والـdashboards عند غياب ترخيص إعادة التوزيع. |
| Workflow | `skills/workflow/` | التخطيط، TDD، debugging، code review والتحقق قبل التسليم. |
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

لإنشاء موقع، ابدأ بـ `web/ui-ux-pro-max` لتحديد النظام البصري، ثم استخدم مهارات Vercel من مصدرها الأصلي لتدقيق الواجهة والأداء. لتطبيق Android، ابدأ بـ `android/google-jetpack-compose` و`android/material-3`، ثم استخدم مهارات `rcosteira79` أو Chris Banes عند الحاجة إلى architecture أو state أو performance. ابدأ كل مشروع مع `workflow/superpowers/writing-plans`، ثم شغّل `quality/guard-skills/clean-code-guard` و`quality/guard-skills/test-guard` بعد التعديل. لمراجعة واجهة ويب فعلية استخدم `web/ui-review-loop` ببيانات وهمية فقط. استخدم `workflow/review-skills/debate-review` أو `babysit-pr` فقط في مستودع يسمح بالنشر وبعد مراجعة بشرية صريحة. لا تستخدم عدة حزم شاملة متداخلة في الوقت نفسه دون تحديد مصدر أولوية.

## التحديثات

هذا المستودع **snapshot تجميعي** وليس forkًا آليًا لكل upstream. عند تحديث المصادر، افحص التغييرات، راجع الترخيص، حدّث `upstreams/manifest.json`، ثم نفّذ اختبارات البنية والروابط قبل عمل commit. لا تشغّل أي script من مصدر خارجي قبل مراجعة محتواه.

## الترخيص

ملفات الربط والفهرسة التي أنشأها هذا المستودع مرخصة تحت MIT كما هو موضح في `LICENSE`. أما المهارات المنسوخة فتخضع لتراخيص أصحابها الموضحة في `licenses/` و`ATTRIBUTION.md`. بعض المصادر غير المنسوخة لا تحتوي على ملف ترخيص واضح في لقطة المصدر؛ لذلك نحتفظ بروابطها فقط ولا نعيد توزيع ملفاتها.

## المراجع

المصادر الأساسية هي [UI UX Pro Max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)، [Android Skills الرسمي](https://github.com/android/skills)، [Material 3 Skill](https://github.com/hamen/material-3-skill)، [Chris Banes Skills](https://github.com/chrisbanes/skills)، [Anthropic Frontend Design](https://github.com/anthropics/claude-code/tree/main/plugins/frontend-design)، [Superpowers](https://github.com/obra/superpowers)، [Kotlin Agent Skills](https://github.com/Kotlin/kotlin-agent-skills)، [Android Ninja](https://github.com/Drjacky/claude-android-ninja)، [Compose Performance Skills](https://github.com/skydoves/compose-performance-skills)، [amElnagdy guard-skills](https://github.com/amElnagdy/guard-skills)، [amElnagdy ui-review-loop](https://github.com/amElnagdy/ui-review-loop)، و[amElnagdy review-skills](https://github.com/amElnagdy/review-skills). راجع `ATTRIBUTION.md` للقائمة الكاملة وحالة كل مصدر.
