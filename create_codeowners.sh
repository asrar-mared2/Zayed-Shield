#!/bin/bash

# =============================================================================
# إنشاء ملف CODEOWNERS احترافي لمشروع درع زايد
# =============================================================================

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
NC='\033[0m'

echo -e "${PURPLE}🛡️ إنشاء ملف CODEOWNERS لمشروع درع زايد${NC}"
echo "================================================"

# إنشاء مجلد .github إذا لم يكن موجوداً
mkdir -p .github

# إنشاء ملف CODEOWNERS
cat > .github/CODEOWNERS << 'EOF'
# =============================================================================
# CODEOWNERS ملف مالكي الكود
# =============================================================================
# هذا الملف يحدد من هو المسؤول عن مراجعة التغييرات في أجزاء مختلفة من المشروع
# 
# كيفية العمل:
# - عند إنشاء Pull Request، سيتم إشعار المالكين المعنيين تلقائياً
# - يجب الحصول على موافقة المالكين قبل دمج التغييرات
# - استخدم @ لتحديد المستخدمين أو الفرق
#
# التنسيق: pattern @username1 @username2 @team
# =============================================================================

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                          المالك الرئيسي للمشروع                          ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# المالك الافتراضي لجميع الملفات في المشروع
* @asrar-mared

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                              الوثائق والتوثيق                            ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# ملفات الوثائق الرئيسية
*.md @asrar-mared
README.md @asrar-mared
CONTRIBUTING.md @asrar-mared
LICENSE @asrar-mared
SECURITY.md @asrar-mared
CODE_OF_CONDUCT.md @asrar-mared

# مجلد الوثائق
/docs/ @asrar-mared
/docs/**/*.md @asrar-mared

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                            السكريبتات الأساسية                          ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# سكريبتات النواة الأساسية - تحتاج مراجعة دقيقة
/scripts/core/ @asrar-mared
/scripts/core/**/*.sh @asrar-mared
/scripts/core/**/*.py @asrar-mared

# سكريبت الإعداد الرئيسي - حرج جداً
/scripts/core/setup_security_lab.sh @asrar-mared

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                             أدوات الشبكة                                 ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# أدوات الشبكة والمسح
/scripts/network/ @asrar-mared
/scripts/network/**/*.py @asrar-mared
/scripts/network/**/*.sh @asrar-mared

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                            أدوات الأمان                                  ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# أدوات الأمان والاختراق - حساسة جداً
/scripts/security/ @asrar-mared
/scripts/security/**/*.py @asrar-mared
/scripts/security/**/*.sh @asrar-mared

# أدوات كسر التشفير
/scripts/security/hash_cracker.py @asrar-mared
/scripts/security/password_generator.py @asrar-mared

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                          الطب الشرعي الرقمي                             ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# أدوات الطب الشرعي
/scripts/forensics/ @asrar-mared
/scripts/forensics/**/*.py @asrar-mared

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                            الأتمتة والتقارير                            ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# سكريبتات الأتمتة
/scripts/automation/ @asrar-mared
/scripts/automation/**/*.py @asrar-mared
/scripts/automation/**/*.sh @asrar-mared

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                          ملفات التكوين                                   ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# ملفات التكوين الرئيسية
/config/ @asrar-mared
/config/**/*.json @asrar-mared
/config/**/*.yml @asrar-mared
/config/**/*.yaml @asrar-mared
/config/**/*.conf @asrar-mared

# الإعدادات الحساسة
/config/settings/ @asrar-mared
/config/templates/ @asrar-mared

# قوائم الكلمات - حساسة
/config/wordlists/ @asrar-mared

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                        أدوات البرمجة والتطوير                           ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# Python Tools
/tools/python/ @asrar-mared
/tools/python/**/*.py @asrar-mared
requirements.txt @asrar-mared
setup.py @asrar-mared

# Node.js Tools
/tools/nodejs/ @asrar-mared
/tools/nodejs/**/*.js @asrar-mared
package.json @asrar-mared
package-lock.json @asrar-mared

# Go Tools
/tools/go/ @asrar-mared
/tools/go/**/*.go @asrar-mared
go.mod @asrar-mared
go.sum @asrar-mared

# Rust Tools
/tools/rust/ @asrar-mared
/tools/rust/**/*.rs @asrar-mared
Cargo.toml @asrar-mared
Cargo.lock @asrar-mared

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                          واجهة الويب والـ API                            ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# لوحة التحكم
/web/dashboard/ @asrar-mared
/web/dashboard/**/*.html @asrar-mared
/web/dashboard/**/*.css @asrar-mared
/web/dashboard/**/*.js @asrar-mared

# API Endpoints
/web/dashboard/api/ @asrar-mared
/web/dashboard/api/**/*.php @asrar-mared
/web/dashboard/api/**/*.py @asrar-mared

# نظام المصادقة - حرج جداً
/web/auth/ @asrar-mared

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                         التطبيقات المحمولة                               ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# تطبيق Android
/mobile/android/ @asrar-mared
/mobile/android/**/*.java @asrar-mared
/mobile/android/**/*.kt @asrar-mared

# تطبيق iOS
/mobile/ios/ @asrar-mared
/mobile/ios/**/*.swift @asrar-mared

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                             Docker والحاويات                             ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# ملفات Docker
/docker/ @asrar-mared
Dockerfile @asrar-mared
docker-compose.yml @asrar-mared
.dockerignore @asrar-mared

# صور Docker
/docker/images/ @asrar-mared

# سكريبتات النشر
/docker/scripts/ @asrar-mared

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                          الاختبارات والجودة                             ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# اختبارات الوحدة
/tests/ @asrar-mared
/tests/unit/ @asrar-mared
/tests/unit/**/*.py @asrar-mared

# اختبارات التكامل
/tests/integration/ @asrar-mared

# اختبارات الأداء
/tests/performance/ @asrar-mared

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                        GitHub Actions & CI/CD                            ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# ملفات GitHub
/.github/ @asrar-mared
/.github/**/*.yml @asrar-mared
/.github/**/*.yaml @asrar-mared

# GitHub Actions Workflows - حرج جداً
/.github/workflows/ @asrar-mared
/.github/workflows/**/*.yml @asrar-mared

# قوالب Issues و PR
/.github/ISSUE_TEMPLATE/ @asrar-mared
/.github/PULL_REQUEST_TEMPLATE.md @asrar-mared

# ملف CODEOWNERS نفسه
/.github/CODEOWNERS @asrar-mared

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                         ملفات النظام والتكوين                           ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# ملفات Git
.gitignore @asrar-mared
.gitattributes @asrar-mared
.gitmodules @asrar-mared

# ملفات التكوين
.editorconfig @asrar-mared
.prettierrc @asrar-mared
.eslintrc @asrar-mared
.pylintrc @asrar-mared

# ملف المشروع
Makefile @asrar-mared

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                            البيانات والموارد                             ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# البيانات الحساسة
/data/reports/ @asrar-mared
/data/backups/ @asrar-mared

# الموارد
/resources/ @asrar-mared
/resources/images/ @asrar-mared

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                        ملفات الأمان والحماية                            ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# سكريبتات الحماية - حرجة جداً
*protection*.sh @asrar-mared
*security*.sh @asrar-mared
*firewall*.sh @asrar-mared

# ملفات الأمان
SECURITY.md @asrar-mared
PROTECTION_LICENSE @asrar-mared
.protection_key @asrar-mared

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                         ملفات خاصة ومخصصة                               ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# ملفات التشفير - لا تُعدل أبداً بدون موافقة صريحة
*.enc @asrar-mared
*.key @asrar-mared
*.pem @asrar-mared
*.p12 @asrar-mared
*.pfx @asrar-mared

# سكريبتات فك التشفير
decrypt*.sh @asrar-mared
decrypt*.py @asrar-mared

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                            ملاحظات مهمة                                  ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# ملاحظات للمساهمين:
# 
# 1. جميع التغييرات على الملفات الحرجة تحتاج موافقة @asrar-mared
# 2. سكريبتات الأمان يجب مراجعتها بدقة قبل الدمج
# 3. ملفات التشفير لا تُعدل إلا بإذن صريح
# 4. التغييرات على GitHub Actions تحتاج اختبار شامل
# 5. أي تغيير على نظام الحماية يتطلب مراجعة أمنية
#
# للأسئلة أو الاستفسارات:
# - فتح Issue في المستودع
# - التواصل عبر: security@zayed-shield.com
# - Discord: https://discord.gg/zayed-shield
# - Telegram: https://t.me/zayed_shield
#
# شكراً لمساهماتكم في تطوير درع زايد! 🛡️

# =============================================================================
# نهاية ملف CODEOWNERS
# آخر تحديث: $(date +"%Y-%m-%d")
# المشروع: درع زايد - Zayed Shield
# المطور الرئيسي: @asrar-mared
# =============================================================================
EOF

echo -e "${GREEN}✅ تم إنشاء ملف CODEOWNERS بنجاح${NC}"

# إنشاء ملف توضيحي إضافي
cat > CODEOWNERS_GUIDE.md << 'EOF'
# 📖 دليل استخدام ملف CODEOWNERS

## 🎯 ما هو CODEOWNERS؟

ملف **CODEOWNERS** هو ملف خاص في GitHub يحدد من هو المسؤول عن مراجعة التغييرات في أجزاء مختلفة من المشروع.

## ✨ الفوائد

### 🔐 **الأمان**
- ضمان مراجعة التغييرات الحساسة من قبل الخبراء
- منع التغييرات غير المصرح بها
- حماية الملفات الحرجة

### 🚀 **الكفاءة**
- توجيه المراجعات للأشخاص المناسبين تلقائياً
- تقليل وقت المراجعة
- توزيع واضح للمسؤوليات

### 👥 **التعاون**
- الجميع يعرف من يراجع ماذا
- سهولة إضافة مراجعين جدد
- شفافية في عملية المراجعة

## 📋 كيفية العمل

### 1️⃣ **عند إنشاء Pull Request**
```
عندما يُنشئ شخص PR يُعدّل ملفاً:
┌─────────────────────────────────┐
│  PR: تحديث /scripts/core/*.sh  │
└─────────────────────────────────┘
         ↓
┌─────────────────────────────────┐
│  GitHub يقرأ ملف CODEOWNERS    │
└─────────────────────────────────┘
         ↓
┌─────────────────────────────────┐
│  إشعار @asrar-mared تلقائياً   │
└─────────────────────────────────┘
         ↓
┌─────────────────────────────────┐
│  انتظار الموافقة للدمج         │
└─────────────────────────────────┘
```

### 2️⃣ **الموافقة والدمج**
- المالك يستلم إشعار
- يراجع التغييرات
- يوافق أو يطلب تعديلات
- بعد الموافقة يمكن الدمج

## 🎨 التنسيق

```bash
# تنسيق أساسي
pattern @username

# أمثلة:
*.py @asrar-mared                    # جميع ملفات Python
/scripts/core/ @asrar-mared          # مجلد محدد
*.md @asrar-mared @contributor2      # عدة مالكين
```

## 🔧 التعديل والتخصيص

### إضافة مالكين جدد

```bash
# افتح الملف
nano .github/CODEOWNERS

# أضف سطر جديد
/scripts/network/ @asrar-mared @network-expert

# احفظ وارفع
git add .github/CODEOWNERS
git commit -m "إضافة مالك جديد لأدوات الشبكة"
git push
```

### إضافة فريق كامل

```bash
# إذا كان لديك فريق في GitHub Organization
/scripts/security/ @asrar-mared @security-team
```

## ⚙️ الإعدادات المتقدمة

### حماية الفروع (Branch Protection)

لجعل CODEOWNERS إلزامياً:

1. اذهب إلى **Settings** → **Branches**
2. أضف قاعدة حماية للفرع `main`
3. فعّل: **Require review from Code Owners**
4. احفظ التغييرات

### متطلبات إضافية

```yaml
- Require approvals: 1
- Dismiss stale reviews: نعم
- Require review from Code Owners: نعم
- Require status checks: نعم
```

## 📊 أفضل الممارسات

### ✅ **افعل**
- حدد مالكين واضحين لكل قسم
- استخدم أنماط محددة
- حدّث الملف بانتظام
- وثّق التغييرات

### ❌ **لا تفعل**
- لا تجعل شخص واحد مالك لكل شيء
- لا تستخدم أنماط غامضة
- لا تنسى تحديث الملف
- لا تتجاهل طلبات المراجعة

## 🛡️ للمساهمين

### قبل إنشاء PR

```bash
# 1. تحقق من الملفات التي ستُعدّلها
git status

# 2. اقرأ CODEOWNERS لمعرفة من سيراجع
cat .github/CODEOWNERS | grep "scripts/security"

# 3. تأكد من جودة الكود
pylint your_script.py

# 4. أنشئ PR مع وصف واضح
```

### أثناء المراجعة

- كن صبوراً
- استجب للملاحظات بسرعة
- اطرح أسئلة إذا لم تفهم
- احترم قرارات المراجعين

## 📞 الدعم

### إذا واجهت مشكلة:

1. **تحقق من الوثائق**
   - اقرأ هذا الدليل
   - راجع [GitHub Docs](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)

2. **افتح Issue**
   - اشرح المشكلة بالتفصيل
   - أرفق لقطات شاشة

3. **تواصل معنا**
   - البريد: security@zayed-shield.com
   - Discord: [درع زايد](https://discord.gg/zayed-shield)
   - Telegram: [@zayed_shield](https://t.me/zayed_shield)

## 🎓 مصادر إضافية

- [GitHub Docs - CODEOWNERS](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)
- [وثائق درع زايد](https://github.com/asrar-mared/Zayed-Shield/docs)
- [دليل المساهمة](CONTRIBUTING.md)

---

<div align="center">

**🛡️ درع زايد - حماية قوية لعالم رقمي آمن**

صُنع بـ ❤️ في دولة الإمارات العربية المتحدة 🇦🇪

</div>
EOF

echo -e "${GREEN}✅ تم إنشاء دليل CODEOWNERS${NC}"

# إنشاء سكريبت للتحقق من CODEOWNERS
cat > validate_codeowners.sh << 'EOF'
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
EOF

chmod +x validate_codeowners.sh

echo -e "${GREEN}✅ تم إنشاء سكريپت التحقق${NC}"

echo ""
echo -e "${PURPLE}================================================${NC}"
echo -e "${CYAN}🎉 تم إنشاء ملفات CODEOWNERS الاحترافية!${NC}"
echo -e "${PURPLE}================================================${NC}"
echo ""
echo -e "${YELLOW}📁 الملفات التي تم إنشاؤها:${NC}"
echo "  ✅ .github/CODEOWNERS - الملف الرئيسي"
echo "  ✅ CODEOWNERS_GUIDE.md - دليل الاستخدام"
echo "  ✅ validate_codeowners.sh - سكريپت التحقق"
echo ""
echo -e "${CYAN}🎯 الخطوات التالية:${NC}"
echo "  1️⃣  راجع ملف .github/CODEOWNERS"
echo "  2️⃣  عدّل المالكين حسب فريقك"
echo "  3️⃣  شغّل: ./validate_codeowners.sh للتحقق"
echo "  4️⃣  ارفع على GitHub:"
echo ""
echo "     git add .github/CODEOWNERS CODEOWNERS_GUIDE.md"
echo "     git commit -m '📝 إضافة ملف CODEOWNERS احترافي'"
echo "     git push origin main"
echo ""
echo -e "${GREEN}🔐 لتفعيل الحماية الكاملة:${NC}"
echo "  1. اذهب لـ Settings → Branches"
echo "  2. أضف Branch Protection Rule للـ main"
echo "  3. فعّل: Require review from Code Owners"
echo "  4. احفظ التغييرات"
echo ""
echo -e "${BLUE}💡 نصيحة:${NC} CODEOWNERS يحمي مشروعك من التغييرات غير المصرح بها!"
echo ""
echo -e "${GREEN}🛡️ درع زايد - حماية متقدمة لكودك!${NC}"
