# تحليل فجوات Maharat — 2026-08-27

## النتيجة العامة

حزمة Maharat الحالية قوية جدًا في Android وJetpack Compose وKotlin وUX/UI والبيانات والمعمارية والاختبارات. عددها الحالي 112 مهارة قبل هذه الإضافة، وكل الأسماء المعلنة فريدة. الإضافة العشوائية لمهارات أكثر قد تزيد تداخل الاختيار، لذلك المعيار هو سد فجوة تشغيلية واضحة لا زيادة العدد.

## الفجوات العملية

| المجال | حالة Maharat الحالية | الفجوة | القرار |
|---|---|---|---|
| Web UI runtime | تصميم UX/UI وreview موجودان | لا توجد مهارة مستقلة لفحص DOM وconsole وnetwork وCore Web Vitals في المتصفح الحي | إضافة `browser-testing-with-devtools` |
| Frontend implementation | التصميم والـresponsive موجودان | لا توجد مهارة مستقلة تربط التصميم بتنفيذ frontend قابل للصيانة | إضافة `frontend-ui-engineering` |
| CI/CD | الاختبارات والـguards موجودة | لا توجد بوابة موحدة تربط lint/typecheck/tests/build/security قبل الدمج | إضافة `ci-cd-and-automation` |
| Git | التخطيط والمراجعة موجودان | لا توجد قواعد يومية مستقلة للفروع القصيرة والـatomic commits والـversioning | إضافة `git-workflow-and-versioning` |
| Production operations | debugging وCompose performance موجودان | لا توجد مهارة عامة للـlogging والـmetrics والـtracing والتنبيهات | إضافة `observability-and-instrumentation` |
| Performance العامة | تركيز قوي على Compose | لا توجد مهارة مستقلة للأداء العام في الويب/backend | إضافة `performance-optimization` |
| تقسيم التنفيذ | architecture وbefore-you-build موجودان | لا توجد قاعدة مستقلة لتقسيم التغيير الكبير إلى slices صغيرة قابلة للتحقق | إضافة `incremental-implementation` |
| مصادر الحقيقة | مهارات Android موجودة | لا توجد مهارة عامة تلزم الوكيل بالرجوع إلى التوثيق الرسمي والاستشهاد به | إضافة `source-driven-development` |

## مهارات لا نضيفها الآن

`code-review-and-quality` يتداخل بقوة مع `clean-code-guard` و`requesting-code-review`. `debugging-and-error-recovery` يتداخل مع `systematic-debugging`. `planning-and-task-breakdown` و`spec-driven-development` يتداخلان جزئيًا مع `writing-plans` و`before-you-build`. `shipping-and-launch` مفيد عند النشر الفعلي، لكنه ليس أولوية للمشروع الحالي. `using-agent-skills` مفيد كمرشد عام، لكنه ليس Skill Router حقيقيًا؛ الأفضل تصميم Router محلي لاحقًا بعد تثبيت القواعد الفعلية للاختيار.

## قرار الإضافة

أُضيفت سابقًا ست مهارات من مستودع `addyosmani/agent-skills`: `code-simplification`, `api-and-interface-design`, `deprecation-and-migration`, `documentation-and-adrs`, `security-and-hardening`, و`context-engineering`.

وبعد مراجعة الفجوات، أُضيفت ثماني مهارات أخرى من المصدر نفسه: `browser-testing-with-devtools`, `frontend-ui-engineering`, `ci-cd-and-automation`, `git-workflow-and-versioning`, `observability-and-instrumentation`, `performance-optimization`, `incremental-implementation`, و`source-driven-development`. يعلن المصدر ترخيص MIT. أُضيفت المهارات عبر allow-list في `upstreams/sync-manifest.json` فقط، مع حفظ ملف الترخيص، ولن تُنسخ بقية حزمة Addy تلقائيًا.

المصدر: https://github.com/addyosmani/agent-skills
