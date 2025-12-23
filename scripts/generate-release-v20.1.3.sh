#!/bin/bash
# إنشاء مجلد RELEASES إذا لم يكن موجود
mkdir -p RELEASES

# مسار ملف الإصدار الجديد
RELEASE_FILE="RELEASES/v20.1.3.md"

# الحصول على التاريخ الحالي
RELEASE_DATE=$(date +"%Y-%m-%d")

# دمج كل الإصدارات السابقة إذا وجد CHANGELOG.md
if [ -f "CHANGELOG.md" ]; then
    PREVIOUS_LOG=$(cat CHANGELOG.md)
else
    PREVIOUS_LOG=""
fi

# إنشاء ملف الإصدار الجديد
cat > "$RELEASE_FILE" << EOL
# Zayed-Shield Release v20.1.3

**تاريخ الإصدار:** $RELEASE_DATE  
**الإصدار الحالي:** v20.1.3  
**درجة الأمان:** Ultra-Critical

## ملخص الإصدار
- تحديثات أمنية شاملة لجميع الفروع.
- حماية الفروع: main و security-signals مفعلة بالكامل.
- مراجعة Pull Request مطلوبة لجميع التغييرات.
- CI/CD إلزامي قبل أي تحديث.
- توقيعات رقمية مطلوبة للدمج.
- منع Force Push وحذف الفروع المحمية.
- تكوين سر البيئة: ZAYED_EXECUTION_LOCK.

## حماية الفروع
- **Branches Protected:** main, security-signals
- **CI/CD Checks:** ci/cd-check
- **Pull Request Reviews:** Required, minimum 1, Code Owner approval
- **Signed Commits:** Required
- **Force Push:** Disabled
- **Branch Deletion:** Disabled
- **Admins Enforcement:** Enabled

## تغييرات إضافية
- تحسين آلية الدمج ومرونة فحص الشيفرة.
- دعم بيئة الإنتاج مع قفل التنفيذ الآمن.
- تحديثات وثائقية و README.

## CHANGELOG السابق
$PREVIOUS_LOG

## تعليمات الاستخدام
1. تحديث المستودع المحلي:  
   \`\`\`bash
   git pull origin main
   \`\`\`
2. تحقق من حماية الفروع:  
   \`\`\`bash
   gh api repos/asrar-mared2/Zayed-Shield/branches/main/protection
   \`\`\`
3. دمج التحديثات فقط عبر Pull Request.
4. لا تحاول حذف أو Force Push على الفروع المحمية.

**ملاحظة:** هذا الإصدار مخصص للإنتاج، وكل التحديثات تم فحصها أمنياً.

EOL

echo "تم إنشاء ملف الإصدار بنجاح: \$RELEASE_FILE"
