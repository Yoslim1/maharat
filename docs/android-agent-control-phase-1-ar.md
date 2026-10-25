# المرحلة الأولى: التحكم الوكيلي واختبار Android

## ما أُضيف

أضيفت مهارات خارجية مرخصة MIT أو Apache-2.0 بعد فحص صفحة GitHub وملف الترخيص: `agent-device` للتحكم بالـsnapshots والـselectors والأدلة، `native-ai-tester` للتفاعل البصري مع التطبيقات والألعاب وCanvas، مهارة DragonJAR للتدقيق الأمني المصرح، ومجموعة ADB المنتقاة من Skydoves. كما أضيفت خمس مهارات محلية تضبط الحجز، التفاعل البصري، الأدلة، اختيار الأدوات، وبوابة الأمن.

## قرار عدم التكرار

لم تُعد إضافة ADB أو Appium أو UiAutomator2 أو pytest أو Pillow. بقيت هذه مكونات الأساس في بيئة الهاتف. الإضافات الجديدة تعمل فوقها أو تغطي فجوة الألعاب والرؤية والأدلة والأمن. لا يستخدم الوكيل أكثر من مسار تحكم واحد في جلسة الاختبار.

## سياسة التشغيل

يسمح للوكيل بتثبيت وتجربة الأدوات داخل بيئة اختبار مخصصة، مع فحص المصدر والترخيص والإصدار وتشغيل smoke test. تمنع المهارات تلقائيًا فتح الخدمات للعامة، أو التعامل مع بيانات إنتاج، أو تنفيذ حذف/مسح/إعادة ضبط/استخراج بيانات خاصة دون نطاق صريح وسياج أمان. مهارة التدقيق الأمني مخصصة للتطبيقات والأجهزة المصرح بها فقط.

## ما لم يُثبت بعد

لم تُثبت هذه الجلسة تشغيل الأدوات على هاتفك الفعلي، ولم تثبت دقة OCR العربية أو ثبات التفاعل مع Godot/Unity/Unreal أو توافق كل أداة مع PRoot. لذلك لا تُثبت الأدوات على الهاتف الآن تلقائيًا؛ الخطوة التالية هي تجربة كل مرشح في بيئة مؤقتة وتسجيل النتيجة.

## المراجع

- [agent-device](https://github.com/callstack/agent-device) — MIT.
- [native-ai-tester](https://github.com/danielehrhardt/native-ai-tester) — MIT.
- [Android-Pentesting-Skill](https://github.com/DragonJAR/Android-Pentesting-Skill) — Apache-2.0.
- [android-testing-skills](https://github.com/skydoves/android-testing-skills) — Apache-2.0.
- [LayerSort Environment Guide](../../upload/LayerSort_Environment_Complete_Guide_AR-1.md) — مرجع البيئة المقدم من المستخدم، وليس جزءًا من المستودع.
