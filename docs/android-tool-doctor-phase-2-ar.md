# المرحلة الثانية: فحص أدوات Android والمقارنة العملية

## النطاق

هذه المرحلة تجهز فحصًا محليًا للبيئة قبل تجربة أدوات التحكم الوكيلي. لا تثبت أدوات ولا تعدل الهاتف تلقائيًا. تستخدم تطبيق اختبار أو لعبة تجريبية غير حساسة فقط.

## السكربت الجديد

`/scripts/android-tool-doctor.sh` سكربت read-only يفحص:

- ADB وNode.js وnpm وPython وpytest.
- Appium وagent-device وnative-ai-tester (`nat`) وscrcpy.
- Tesseract وOpenCV وmobsfscan وPerfetto كأدوات اختيارية.
- `ANDROID_SDK_ROOT` أو `ANDROID_HOME`.
- ظهور جهاز Android أو محاكي في `adb devices`.
- حالة Appium المحلية على `127.0.0.1:4723/status`.

لا يشغل `curl | bash`، ولا يثبت حزمًا، ولا ينفذ `install` أو `pm clear` أو `reboot` أو `adb pull/push`.

## التشغيل على جهازك

```bash
cd ~/maharat
git pull origin master
bash scripts/android-tool-doctor.sh
```

لإجبار الفحص على اعتبار غياب الجهاز فشلًا:

```bash
REQUIRE_DEVICE=1 bash scripts/android-tool-doctor.sh
```

للاستخدام البرمجي:

```bash
bash scripts/android-tool-doctor.sh --json
```

## ترتيب التجربة

1. شغل الفحص على المحاكي أولًا.
2. اختر أداة واحدة لمسار التحكم الوكيلي: `agent-device` أو `nat`.
3. نفذ smoke test غير مدمّر: فتح تطبيق تجريبي، قراءة الشاشة، tap، ثم screenshot للتحقق.
4. قارن: ثبات القراءة، دعم Canvas، وضوح الأخطاء، الأدلة، استهلاك الموارد، والعمل دون خدمة خارجية.
5. بعد نجاح المحاكي فقط، كرر على الهاتف الحقيقي المخصص للاختبار.
6. إذا فشل المسار، ارجع إلى Appium/ADB الموجودين بدل تثبيت محرك تحكم ثانٍ.

## الأمن

يبدأ المسار الأمني بـ`mobsfscan` أو MobSF والتحليل الساكن على APK اختبارية. تؤجل Frida وbypass إلى مرحلة منفصلة وبموافقة ونطاق مصرحين. لا ترفع screenshots أو logcat أو APK إلى خدمة خارجية دون تنقيح وسياسة بيانات واضحة.

## معيار القرار

لا تضاف أداة إلى البيئة الدائمة إلا إذا سدت فجوة مثبتة، وكان مصدرها وترخيصها واضحين، ونجح smoke test، ولم تسبب تعارضًا مع Appium/ADB، وكان لها مسار إزالة وتراجع.
