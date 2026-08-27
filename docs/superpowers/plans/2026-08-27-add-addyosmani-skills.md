# Add Addy Osmani Agent Skills Implementation Plan

**Goal:** إضافة ست مهارات منتقاة من `addyosmani/agent-skills` إلى Maharat مع الحفاظ على الترخيص والمزامنة الآمنة والتثبيت التلقائي في OpenCode.

**Architecture:** سيُضاف مصدر واحد إلى `upstreams/sync-manifest.json` مع مسارات منتقاة فقط. ستجلب GitHub Actions المسارات المسموح بها أسبوعيًا وتفتح Pull Request للمراجعة، ثم يثبت updater المحلي النسخة المدمجة في `master` داخل OpenCode.

**Tech Stack:** Git, GitHub Actions, Python synchronization script, Markdown `SKILL.md` files.

**Spec:** طلب المستخدم إضافة المهارات الست المقترحة من `addyosmani/agent-skills` إلى Maharat.

## Global Constraints

- لا تُنسخ إلا المهارات الست المطلوبة، وليس حزمة المصدر كاملة.
- لا تُنفذ ملفات المصدر الخارجي أثناء المزامنة.
- يجب الاحتفاظ بترخيص المصدر MIT ونسبته.
- لا يُدمج تحديث upstream تلقائيًا؛ يظل الدمج عبر Pull Request والمراجعة.
- يجب أن يظل كل `SKILL.md` صالحًا لفحص Maharat.

---

### Task 1: Register the upstream source

**Files:**
- Modify: `upstreams/sync-manifest.json`
- Create/Update: `licenses/addyosmani-agent-skills-MIT`

- [ ] إضافة المصدر `addyosmani-agent-skills` ومسارات المهارات الست إلى manifest.
- [ ] تحديد وجهات منظمة وفريدة تحت `skills/workflow/addyosmani`, `skills/architecture/addyosmani`, و`skills/quality/addyosmani`.
- [ ] ربط ملف `LICENSE` من المصدر بملف الترخيص المحلي.

### Task 2: Synchronize and validate

**Files:**
- Create: المهارات الست تحت `skills/`
- Modify: `upstreams/source-commits.txt`, `upstreams/skill-files.txt`, `CATALOG.md`, `ATTRIBUTION.md`

- [ ] تشغيل مزامنة المصادر المسجلة.
- [ ] تشغيل `bash scripts/validate-maharat.sh`.
- [ ] مراجعة diff والتأكد من عدم وجود ملفات تنفيذية أو أسرار أو مسارات خارج المهارات الست.

### Task 3: Commit and publish

**Files:**
- Commit all validated changes on `master`.

- [ ] تنفيذ فحص الحالة والاختبارات النهائية.
- [ ] إنشاء commit واضح.
- [ ] دفع commit إلى `origin/master` حتى يراه updater المحلي في تشغيله القادم.
