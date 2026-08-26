# الاختيار العالمي للمهارات — Maharat

**تاريخ المراجعة:** 26 أغسطس 2026

## الخلاصة التنفيذية

تم توسيع Maharat من **83 إلى 106 مهارات**، بزيادة 23 مهارة منتقاة. لم ننسخ حزمًا كاملة لمجرد أن عددها كبير؛ اخترنا وحدات صغيرة ذات وظيفة واضحة، ووثقنا المصدر والترخيص، وأضفنا مهارة محلية للتطوير الذاتي المنضبط. الهدف هو أن يختار OpenCode المهارة المناسبة من الوصف عند الحاجة، لا أن يحمّل كل شيء في كل مهمة.

> القاعدة التشغيلية: مهارة واحدة للمشكلة الواحدة، والمهارات المنسقة تستدعي المهارات المتخصصة بدل تكرار قواعدها.

## لماذا هذه المصادر؟

| المصدر | مؤشرات GitHub في تاريخ المراجعة | الحكم |
|---|---:|---|
| [wshobson/agents](https://github.com/wshobson/agents) | 39.1k نجمة، 4.2k fork، MIT، نشاط حديث، دعم OpenCode | مصدر قوي للهندسة، API، التصميم، وجودة البيانات؛ أخذنا وحدات محددة فقط. |
| [K-Dense-AI/scientific-agent-skills](https://github.com/K-Dense-AI/scientific-agent-skills) | 34.5k نجمة، 3.4k fork، MIT، 163 مهارة علمية | ممتاز للـEDA والإحصاء والتصور؛ لم ننسخ حزمة العلوم كلها. |
| [jakubkrehel/skills](https://github.com/jakubkrehel/skills) | 4.4k نجمة، 145 fork، MIT، يذكر OpenCode صراحة | أفضل مصدر modular لتفصيل UX/UI والألوان والطباعة وRTL والمراجعة. |
| [plugin87/ux-ui-agent-skills](https://github.com/plugin87/ux-ui-agent-skills) | 769 نجمة، 49 commit، نشاط حديث | قوي جدًا بصريًا، لكن GitHub API لم يثبت ترخيصًا واضحًا وملف LICENSE غير ظاهر في النسخة المفحوصة؛ لم نعد توزيعه. |
| [borghei/Claude-Skills](https://github.com/borghei/Claude-Skills) | 562 نجمة، GitHub license metadata = NOASSERTION | مرجع جيد للتطوير الذاتي، لكن المصدر يعلن MIT + Commons Clause؛ لذلك لم ننسخ ملفاته. |

## المهارات المضافة — واحدة واحدة

### أولًا: UX/UI والتصميم والرسومات

| المهارة | المسار | لماذا اخترناها؟ | طريقة الاستخدام |
|---|---|---|---|
| Better Interface | `skills/web/jakub-better-interface` | منسق شامل يوزع المراجعة على الوصول، التخطيط، الكتابة، الطباعة، الألوان، وصقل الواجهة، ثم يعطي حكمًا مرتبًا بالأدلة. | للمراجعة الشاملة لشاشة أو flow. ثبّت معه مهارات `jakub-better-*`. |
| Interface Review | `skills/web/jakub-interface-review` | يميز مراجعة التغيير أو الفرع أو Pull Request عن مراجعة شاشة جديدة؛ يمنع الادعاء بأن كل الواجهة فُحصت. | استدعاء يدوي عند مراجعة diff أو PR، وليس تلقائيًا لكل مهمة. |
| Better Colors | `skills/web/jakub-better-colors` | يبني ramps وsemantic roles وlight/dark themes ويقيس contrast وOKLCH بدل اختيار ألوان بالحدس. | عند palette أو dark mode أو contrast أو design tokens. |
| Better Typography | `skills/web/jakub-better-typography` | يعالج type scale وfont loading وline-height وwrapping وtruncation والنص المختلط RTL/LTR. | عند اختيار الخطوط أو إصلاح القراءة والتفاف النص. |
| Better Accessibility | `skills/web/jakub-better-accessibility` | يغطي keyboard وscreen reader وfocus وARIA وhit areas وreduced motion، ويفضل native controls على إعادة البناء. | عند بناء أو تدقيق مكونات الويب. |
| Better Layout | `skills/web/jakub-better-layout` | يضبط hierarchy وspacing وalignment وbreakpoints وcontainer queries وRTL والـadaptive layout. | عند توزيع الملفات البصرية أو عمل responsive/RTL. |
| Better UI | `skills/web/jakub-better-ui` | يضيف polish محسوبًا للـradius والـshadow والـmotion والـmicro-interactions بعد سلامة الأساس. | في مرحلة الصقل، وليس قبل الوصول والوصولية. |
| Better Writing | `skills/web/jakub-better-writing` | يحسن نصوص الأزرار والأخطاء وempty states والإعدادات بدل الحشو التسويقي. | عند كتابة copy داخل المنتج. |
| Design System Patterns | `skills/web/design-system-patterns` | يضع حدودًا للتوكنز والـtheming وcomponent architecture، ويقلل التكرار بين الشاشات. | عند تأسيس أو إعادة تنظيم design system. |
| Interaction Design | `skills/web/interaction-design` | يربط الحركة بالمعنى والfeedback وحالات loading، لا بإضافات بصرية عشوائية. | عند تصميم التفاعلات والانتقالات. |
| Responsive Design | `skills/web/responsive-design` | يستخدم container queries وfluid typography وCSS Grid وmobile-first بدل media queries عشوائية. | عند إنشاء واجهة تعمل على أحجام متعددة. |
| Visual Design Foundations | `skills/web/visual-design-foundations` | يوحّد مبادئ typography وcolor وspacing وiconography والـvisual hierarchy. | عند تأسيس اللغة البصرية قبل التنفيذ. |
| Visual Edit Precision | `skills/web/visual-edit-precision` | تعديلات بصرية دقيقة موجهة بلقطة شاشة أو annotation أو تحديد عنصر، مع تغيير أقل قدر ممكن. | عند تنفيذ تعديل بصري موضعي أو مقارنة screenshot. |

### ثانيًا: البيانات والتصورات والرسومات التحليلية

| المهارة | المسار | لماذا اخترناها؟ | طريقة الاستخدام |
|---|---|---|---|
| Exploratory Data Analysis | `skills/data/exploratory-data-analysis` | تحافظ على raw data، تفصل المشتق، تراجع missingness وleakage وoutliers، وتمنع الخلط بين exploratory وconfirmatory. | أول مهارة عند استلام dataset غير مألوف. |
| Scientific Visualization | `skills/data/scientific-visualization` | تختار وتدقق رسوم Matplotlib/Seaborn/Plotly، وتعرض uncertainty وmissing data وcontrast بصورة صادقة. | عند إنشاء charts أو تقارير أو لوحات بيانات. |
| Statistical Analysis | `skills/data/statistical-analysis` | تختار الاختبار، تفحص الافتراضات، تعرض effect sizes وpower والبدائل Bayesian، وتمنع استنتاجات سطحية. | عند مقارنة مجموعات أو اختبار فرضية أو تقرير إحصائي. |
| Data Quality Frameworks | `skills/data/data-quality-frameworks` | يحول جودة البيانات إلى data contracts واختبارات Great Expectations/dbt بدل اكتشاف الأخطاء بعد بناء الواجهة. | عند pipeline أو schema أو data validation. |
| Data Storytelling | `skills/data/data-storytelling` | يربط الرسم بالسياق والسؤال والقرار بدل عرض أرقام بلا narrative. | عند dashboard أو تقرير تنفيذي أو شرح نتيجة. |

### ثالثًا: هندسة الملفات والموديولات والخدمات

| المهارة | المسار | لماذا اخترناها؟ | الحماية من التضخم |
|---|---|---|---|
| Before You Build | `skills/workflow/before-you-build` | يعمل pre-mortem سريعًا: أعلى مخاطرة، أصغر validation، وما الذي يجب تأجيله. | يمنع بناء خدمة أو مجلد أو integration قبل إثبات الحاجة. |
| API Design Principles | `skills/architecture/api-design-principles` | يفرض عقد API واضحًا قبل إضافة endpoint أو خدمة جديدة. | يقلل الخدمات المتكررة وواجهات الربط غير الضرورية. |
| Architecture Patterns | `skills/architecture/architecture-patterns` | يطبق Clean/Hexagonal Architecture وDDD وbounded contexts وحدود الاعتماديات. | يبدأ من module وحدود واضحة، ولا يفترض microservices تلقائيًا. |
| Architecture Decision Records | `skills/architecture/architecture-decision-records` | يسجل القرار والبدائل والكلفة والسبب. | يمنع إعادة اتخاذ القرار أو إضافة طبقات بلا مبرر. |

### رابعًا: التطوير الذاتي المنضبط

| المهارة | المسار | لماذا اخترناها؟ |
|---|---|---|
| Bounded Self-Improvement | `skills/workflow/bounded-self-improvement` | مهارة محلية من Maharat تلتقط الدروس وتربطها بالدليل وتقترح patch أو PR صغيرًا. | لا تعدل إعدادات الوكيل أو skills أو permissions أو hooks أو credentials تلقائيًا، ولا تعتبر lesson قاعدة عامة من تجربة واحدة. |

## ما لم نضفه ولماذا

لم نضف `microservices-patterns` أو `monorepo-management` افتراضيًا؛ فهما مفيدان عند وجود حاجة مثبتة، لكنهما قد يدفعان المشروع إلى خدمات أو حزم أكثر مما يحتاج. ولم نضف `borghei/Claude-Skills` لأن ترخيصه المعلن يجمع MIT مع Commons Clause وبيانات GitHub لا تثبت ترخيصًا قابلاً لإعادة التوزيع. كما لم ننسخ `plugin87/ux-ui-agent-skills` رغم قوته لأننا لم نجد ملف ترخيص واضحًا في النسخة المفحوصة؛ يمكن استخدامه كمصدر دراسة بعد التحقق القانوني المباشر.

## التثبيت في OpenCode

لتحميل طبقة التصميم modular كاملة:

```bash
cd ~/maharat
for skill in \
  jakub-better-interface jakub-interface-review jakub-better-ui \
  jakub-better-typography jakub-better-colors jakub-better-accessibility \
  jakub-better-layout jakub-better-writing; do
  bash scripts/install-skill.sh "skills/web/$skill" ~/.config/opencode/skills
done
```

ولتحميل طبقة البيانات والهندسة والتطوير الذاتي:

```bash
bash scripts/install-skill.sh skills/data/exploratory-data-analysis ~/.config/opencode/skills
bash scripts/install-skill.sh skills/data/scientific-visualization ~/.config/opencode/skills
bash scripts/install-skill.sh skills/data/statistical-analysis ~/.config/opencode/skills
bash scripts/install-skill.sh skills/data/data-quality-frameworks ~/.config/opencode/skills
bash scripts/install-skill.sh skills/data/data-storytelling ~/.config/opencode/skills
bash scripts/install-skill.sh skills/workflow/before-you-build ~/.config/opencode/skills
bash scripts/install-skill.sh skills/architecture/api-design-principles ~/.config/opencode/skills
bash scripts/install-skill.sh skills/architecture/architecture-patterns ~/.config/opencode/skills
bash scripts/install-skill.sh skills/architecture/architecture-decision-records ~/.config/opencode/skills
bash scripts/install-skill.sh skills/workflow/bounded-self-improvement ~/.config/opencode/skills
```

`better-interface` و`interface-review` يحتاجان المهارات المتخصصة كي تكون المراجعة كاملة. أما `interface-review` فهو مصمم للاستدعاء اليدوي. لا تثبت كل مهارات التصميم المتشابهة من مصادر مختلفة في نفس مجلد OpenCode بأسماء متعارضة؛ هذه المجموعة اختيرت لتكون modular، بينما `UI UX Pro Max` يظل خيارًا شاملاً، ويُفضل استخدامه بدل طبقة `better-*` في المهمة التي تحتاج نظامًا شاملًا لا مراجعات منفصلة.

## مصادر أصلية

[1]: https://github.com/jakubkrehel/skills "jakubkrehel/skills"
[2]: https://github.com/wshobson/agents "wshobson/agents"
[3]: https://github.com/K-Dense-AI/scientific-agent-skills "K-Dense-AI/scientific-agent-skills"
[4]: https://github.com/plugin87/ux-ui-agent-skills "plugin87/ux-ui-agent-skills"
[5]: https://github.com/borghei/Claude-Skills "borghei/Claude-Skills"
