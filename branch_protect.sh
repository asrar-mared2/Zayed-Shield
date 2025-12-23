#!/bin/bash
# سكربت إنشاء فرع أمني وربطه بقواعد حماية صارمة مع إشارات ومساهمات

BRANCH_NAME="security-signals"
REPO="asrar-mared2/Zayed-Shield"

# 1️⃣ إنشاء الفرع محليًا من main
git checkout main
git pull origin main
git checkout -b $BRANCH_NAME

# 2️⃣ رفع الفرع للبعيد
git push origin $BRANCH_NAME

# 3️⃣ تفعيل حماية الفرع عبر GitHub API
gh api --method PUT /repos/$REPO/branches/$BRANCH_NAME/protection \
  -F required_status_checks='{"strict":true,"contexts":["ci/cd-check"]}' \
  -F enforce_admins=true \
  -F required_pull_request_reviews='{"dismiss_stale_reviews":true,"require_code_owner_reviews":true}' \
  -F restrictions='{"users":[],"teams":["Developer Consultants Group","مجموعة المحارب"]}'

# 4️⃣ إنشاء سكربت لتوسيم كل commit بالإشارات الأمنية
SIGNAL_FILE=".security_signals.log"
touch $SIGNAL_FILE
git add $SIGNAL_FILE
git commit -m "chore: initialize security signals log"

echo "### إضافة إشارات أمنيّة تلقائية لكل commit ###"
echo "# Usage: ./signal_commit.sh \"Commit message\""
cat << 'EOF' > signal_commit.sh
#!/bin/bash
MSG="$1"
[ -z "$MSG" ] && echo "يرجى تمرير رسالة commit." && exit 1
echo "$(date '+%Y-%m-%d %H:%M:%S') | $MSG" >> .security_signals.log
git add .security_signals.log
git commit -m "security: $MSG"
git push origin security-signals
EOF
chmod +x signal_commit.sh

echo "✅ الفرع $BRANCH_NAME تم إنشاؤه وربطه بقواعد حماية صارمة."
echo "✅ يمكنك الآن استخدام ./signal_commit.sh \"وصف المساهمة\" لتسجيل كل مساهمة بإشارة أمنية."
