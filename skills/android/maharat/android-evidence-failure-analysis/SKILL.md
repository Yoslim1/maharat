---
name: android-evidence-failure-analysis
description: جمع وتحليل أدلة اختبارات Android من screenshots وUI dumps وlogcat وAppium وPerfetto وتقارير pytest. استخدمها عند فشل اختبار أو crash أو اختلاف بصري أو أداء غير مستقر.
---

# Android Evidence and Failure Analysis

لكل اختبار أنشئ `test_id` ونسخة APK وGit commit وserial منقحًا ووقت بدء. احفظ الأدلة في مجلد منفصل لا يختلط باختبار آخر.

## عند الفشل

اجمع بالترتيب: الحالة الحالية، Screenshot، UI dump أو page source، آخر logcat محدود بالزمن والتطبيق، سجل Appium/ADB، وtrace الأداء إن كان الاختبار يقيس startup أو jank أو ANR. لا تعِد تشغيل التطبيق قبل حفظ الدليل إلا إذا كان ذلك جزءًا من سيناريو الاستعادة.

## التصنيف

صنّف الفشل إلى: `device_disconnected`, `session_error`, `locator_or_visual_target`, `gesture_not_applied`, `assertion`, `crash_or_anr`, `visual_regression`, `performance`, أو `tooling`. اربط التصنيف بالدليل ولا تستخدم PASS لمجرد أن Appium `/status` سليم.

## التقارير

أخرج JSON قابلًا للمعالجة مع status وfailure_class وartifacts وretry_count وredactions. أرفق Screenshot قبل/بعد، واذكر ما إذا كانت النتيجة قابلة لإعادة الإنتاج. استخدم pytest-html أو Allure واحدًا فقط في المشروع، ولا تضف أكثر من نظام تقارير بلا حاجة.

## الخصوصية

نقّح tokens وIMEI وserial وعناوين الشبكة ومحتوى المستخدم قبل الرفع. لا ترفع bugreport أو `adb pull` أو screenshots إلى GitHub أو خدمة خارجية إلا عبر مسار مصرح. احتفظ بالسجلات لفترة محددة واحذف الملفات المؤقتة بعد التقرير.
