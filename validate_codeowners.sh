#!/bin/bash

# سكريبت للتحقق من صحة ملف CODEOWNERS

echo "🔍 التحقق من ملف CODEOWNERS..."

if [ ! -f ".github/CODEOWNERS" ]; then
    echo "❌ ملف CODEOWNERS غير موجود!"
    exit 1
fi

echo "✅ ملف CODEOWNERS موجود"

# التحقق من التنسيق
echo "🔍 فحص التنسيق..."

# عد عدد القواعد
RULES_COUNT=$(grep -v "^#" .github/CODEOWNERS | grep -v "^$" | wc -l)
echo "📊 عدد القواعد: $RULES_COUNT"

# التحقق من وجود المالك الأساسي
if grep -q "^\* @asrar-mared" .github/CODEOWNERS; then
    echo "✅ المالك الأساسي محدد"
else
    echo "⚠️  المالك الأساسي غير محدد"
fi

# عرض ملخص الأقسام
echo ""
echo "📋 أقسام الحماية:"
grep "^/" .github/CODEOWNERS | head -10

echo ""
echo "✨ التحقق اكتمل!"
