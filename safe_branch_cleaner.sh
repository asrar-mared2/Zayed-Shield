#!/bin/bash

#═══════════════════════════════════════════════════════════════════════════════
# 🦅 Zayed Balance - Safe Branch Cleaner v2.0
# منظومة تنظيف الفروع السيادية المتقدمة
#═══════════════════════════════════════════════════════════════════════════════
# الوصف: سكربت ذكي لتنظيف الفروع المدموجة مع حماية كاملة من فقدان البيانات
# المطور: فريق الأمن السيبراني السيادي
# الإصدار: 2.0.0
# التاريخ: 2025-12-14
#═══════════════════════════════════════════════════════════════════════════════

# 🎨 الألوان والتنسيق
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'
RESET='\033[0m'

# 📊 متغيرات الإحصائيات
DELETED_COUNT=0
KEPT_COUNT=0
PROTECTED_COUNT=0
REMOTE_DELETED_COUNT=0
STALE_REMOTE_COUNT=0

# 🛡️ الفروع المحمية (لا يمكن حذفها أبدًا)
PROTECTED_BRANCHES=("main" "master" "production" "staging" "development" "dev")

# 📝 ملف السجل
LOG_FILE="branch_cleanup_$(date +%Y%m%d_%H%M%S).log"

#═══════════════════════════════════════════════════════════════════════════════
# 🔧 الدوال المساعدة
#═══════════════════════════════════════════════════════════════════════════════

# دالة طباعة الرأسية
print_header() {
    echo -e "\n${CYAN}${BOLD}═══════════════════════════════════════════════════════════════${RESET}"
    echo -e "${CYAN}${BOLD}   🦅 Zayed Balance – منظومة تنظيف الفروع السيادية v2.0${RESET}"
    echo -e "${CYAN}${BOLD}═══════════════════════════════════════════════════════════════${RESET}\n"
}

# دالة التسجيل
log_action() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# دالة التحقق من وجود Git
check_git_repo() {
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        echo -e "${RED}${BOLD}❌ خطأ: لست داخل مستودع Git!${RESET}"
        exit 1
    fi
}

# دالة التحقق من الاتصال بالإنترنت
check_internet() {
    if ! git ls-remote --exit-code origin > /dev/null 2>&1; then
        echo -e "${YELLOW}⚠️  تحذير: لا يوجد اتصال بـ origin (وضع غير متصل)${RESET}"
        return 1
    fi
    return 0
}

# دالة التحقق من الفرع المحمي
is_protected_branch() {
    local branch=$1
    for protected in "${PROTECTED_BRANCHES[@]}"; do
        if [[ "$branch" == "$protected" ]]; then
            return 0
        fi
    done
    return 1
}

# دالة عرض شريط التقدم
show_progress() {
    local current=$1
    local total=$2
    local percent=$((current * 100 / total))
    local filled=$((percent / 2))
    local empty=$((50 - filled))
    
    printf "\r${CYAN}التقدم: [${GREEN}"
    printf "%${filled}s" | tr ' ' '█'
    printf "${CYAN}"
    printf "%${empty}s" | tr ' ' '░'
    printf "${CYAN}] ${BOLD}%d%%${RESET}" "$percent"
}

#═══════════════════════════════════════════════════════════════════════════════
# 🎯 الوظائف الرئيسية
#═══════════════════════════════════════════════════════════════════════════════

# 1️⃣ التحقق من الفرع الحالي والانتقال إلى main
switch_to_main() {
    echo -e "${BLUE}${BOLD}📍 المرحلة 1: التحقق من الفرع الرئيسي${RESET}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    
    CURRENT_BRANCH=$(git branch --show-current)
    log_action "الفرع الحالي: $CURRENT_BRANCH"
    
    # تحديد الفرع الرئيسي (main أو master)
    if git show-ref --verify --quiet refs/heads/main; then
        MAIN_BRANCH="main"
    elif git show-ref --verify --quiet refs/heads/master; then
        MAIN_BRANCH="master"
    else
        echo -e "${RED}❌ لم يتم العثور على فرع main أو master!${RESET}"
        exit 1
    fi
    
    echo -e "📌 الفرع الرئيسي المكتشف: ${BOLD}$MAIN_BRANCH${RESET}"
    
    if [[ "$CURRENT_BRANCH" != "$MAIN_BRANCH" ]]; then
        echo -e "${YELLOW}⚡ الانتقال إلى $MAIN_BRANCH...${RESET}"
        if git checkout "$MAIN_BRANCH" 2>/dev/null; then
            log_action "تم الانتقال إلى $MAIN_BRANCH"
            echo -e "${GREEN}✅ تم الانتقال بنجاح${RESET}"
        else
            echo -e "${RED}❌ فشل الانتقال إلى $MAIN_BRANCH${RESET}"
            exit 1
        fi
    else
        echo -e "${GREEN}✅ أنت بالفعل على الفرع $MAIN_BRANCH${RESET}"
    fi
    
    # سحب آخر التحديثات
    if check_internet; then
        echo -e "\n${BLUE}🔄 سحب آخر التحديثات من origin/$MAIN_BRANCH...${RESET}"
        if git pull origin "$MAIN_BRANCH" --quiet 2>/dev/null; then
            log_action "تم تحديث $MAIN_BRANCH من origin"
            echo -e "${GREEN}✅ تم تحديث $MAIN_BRANCH بنجاح${RESET}"
        else
            echo -e "${YELLOW}⚠️  تحذير: فشل التحديث من origin${RESET}"
        fi
    fi
    
    echo ""
}

# 2️⃣ تنظيف الفروع المحلية
clean_local_branches() {
    echo -e "${BLUE}${BOLD}📍 المرحلة 2: فحص وتنظيف الفروع المحلية${RESET}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}\n"
    
    # جمع جميع الفروع المحلية (ما عدا الفرع الحالي)
    mapfile -t LOCAL_BRANCHES < <(git for-each-ref --format='%(refname:short)' refs/heads/)
    
    local total_branches=${#LOCAL_BRANCHES[@]}
    local current_index=0
    
    if [[ $total_branches -eq 1 ]]; then
        echo -e "${GREEN}✅ لا توجد فروع محلية أخرى للتنظيف${RESET}\n"
        return
    fi
    
    echo -e "${CYAN}🔍 تم العثور على ${BOLD}$total_branches${RESET}${CYAN} فرع محلي${RESET}\n"
    
    for branch in "${LOCAL_BRANCHES[@]}"; do
        ((current_index++))
        show_progress $current_index $total_branches
        
        # تخطي الفرع الحالي
        if [[ "$branch" == "$MAIN_BRANCH" ]]; then
            continue
        fi
        
        echo -e "\n\n${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
        echo -e "${CYAN}🔍 فحص الفرع: ${BOLD}$branch${RESET}"
        
        # التحقق من الحماية
        if is_protected_branch "$branch"; then
            echo -e "${YELLOW}🛡️  فرع محمي – سيتم الاحتفاظ به${RESET}"
            log_action "محمي: $branch"
            ((PROTECTED_COUNT++))
            continue
        fi
        
        # التحقق من الدمج
        if git merge-base --is-ancestor "$branch" "$MAIN_BRANCH" 2>/dev/null; then
            echo -e "${GREEN}✅ تم دمجه في $MAIN_BRANCH${RESET}"
            
            # عرض آخر commit
            LAST_COMMIT=$(git log -1 --format="%s" "$branch" 2>/dev/null)
            echo -e "${CYAN}   📝 آخر commit: ${LAST_COMMIT:0:50}...${RESET}"
            
            # الحذف
            echo -e "${RED}🗑️  جاري الحذف...${RESET}"
            if git branch -D "$branch" > /dev/null 2>&1; then
                log_action "حُذف: $branch"
                echo -e "${GREEN}✅ تم الحذف بنجاح${RESET}"
                ((DELETED_COUNT++))
            else
                echo -e "${RED}❌ فشل الحذف${RESET}"
                ((KEPT_COUNT++))
            fi
        else
            echo -e "${YELLOW}⚠️  لم يتم دمجه – سيتم الاحتفاظ به${RESET}"
            
            # عرض عدد الـ commits غير المدموجة
            UNMERGED_COMMITS=$(git rev-list --count "$MAIN_BRANCH..$branch" 2>/dev/null || echo "0")
            echo -e "${YELLOW}   📊 commits غير مدموجة: $UNMERGED_COMMITS${RESET}"
            
            log_action "محتفظ به: $branch (غير مدموج)"
            ((KEPT_COUNT++))
        fi
    done
    
    echo -e "\n"
}

# 3️⃣ تنظيف الفروع البعيدة الميتة
clean_remote_branches() {
    if ! check_internet; then
        return
    fi
    
    echo -e "\n${BLUE}${BOLD}📍 المرحلة 3: تنظيف المراجع البعيدة${RESET}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}\n"
    
    echo -e "${CYAN}🔄 فحص الفروع البعيدة الميتة...${RESET}"
    
    # حذف المراجع البعيدة الميتة
    PRUNE_OUTPUT=$(git remote prune origin --dry-run 2>&1)
    
    if [[ -n "$PRUNE_OUTPUT" ]]; then
        STALE_REMOTE_COUNT=$(echo "$PRUNE_OUTPUT" | grep -c "refs/remotes" || echo "0")
        echo -e "${YELLOW}⚠️  تم العثور على $STALE_REMOTE_COUNT مرجع بعيد ميت${RESET}\n"
        echo -e "$PRUNE_OUTPUT\n"
        
        read -p "$(echo -e ${CYAN}هل تريد حذف المراجع البعيدة الميتة؟ [y/N]: ${RESET})" -n 1 -r
        echo
        if [[ $REPLY =~ ^[YyنNsS]$ ]]; then
            git remote prune origin
            log_action "تم تنظيف $STALE_REMOTE_COUNT مرجع بعيد"
            echo -e "${GREEN}✅ تم التنظيف بنجاح${RESET}\n"
        fi
    else
        echo -e "${GREEN}✅ لا توجد مراجع بعيدة ميتة${RESET}\n"
    fi
}

# 4️⃣ عرض التقرير النهائي
show_final_report() {
    echo -e "${CYAN}${BOLD}═══════════════════════════════════════════════════════════════${RESET}"
    echo -e "${CYAN}${BOLD}   🎯 التقرير النهائي للتنظيف${RESET}"
    echo -e "${CYAN}${BOLD}═══════════════════════════════════════════════════════════════${RESET}\n"
    
    echo -e "${GREEN}🗑️  الفروع المحذوفة:      ${BOLD}$DELETED_COUNT${RESET}"
    echo -e "${YELLOW}📂 الفروع المحتفظ بها:    ${BOLD}$KEPT_COUNT${RESET}"
    echo -e "${BLUE}🛡️  الفروع المحمية:       ${BOLD}$PROTECTED_COUNT${RESET}"
    
    if check_internet; then
        echo -e "${MAGENTA}🌐 المراجع البعيدة المنظفة: ${BOLD}$STALE_REMOTE_COUNT${RESET}"
    fi
    
    echo -e "\n${CYAN}📊 إجمالي الفروع المعالجة: ${BOLD}$((DELETED_COUNT + KEPT_COUNT + PROTECTED_COUNT))${RESET}"
    
    # حساب النسبة المئوية
    if [[ $((DELETED_COUNT + KEPT_COUNT + PROTECTED_COUNT)) -gt 0 ]]; then
        local cleanup_percent=$((DELETED_COUNT * 100 / (DELETED_COUNT + KEPT_COUNT + PROTECTED_COUNT)))
        echo -e "${CYAN}📈 نسبة التنظيف:          ${BOLD}${cleanup_percent}%${RESET}"
    fi
    
    echo -e "\n${GREEN}${BOLD}✅ اكتملت العملية بنجاح!${RESET}"
    echo -e "${CYAN}📝 السجل المحفوظ في: ${BOLD}$LOG_FILE${RESET}\n"
    
    log_action "انتهى التنظيف - محذوف: $DELETED_COUNT, محتفظ: $KEPT_COUNT, محمي: $PROTECTED_COUNT"
}

# 5️⃣ عرض الفروع المتبقية
show_remaining_branches() {
    echo -e "${BLUE}${BOLD}📋 الفروع المتبقية:${RESET}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}\n"
    
    git branch -vv --color=always
    echo ""
}

#═══════════════════════════════════════════════════════════════════════════════
# 🚀 التنفيذ الرئيسي
#═══════════════════════════════════════════════════════════════════════════════

main() {
    print_header
    log_action "بدء عملية تنظيف الفروع"
    
    # التحققات الأولية
    check_git_repo
    
    # تنفيذ المراحل
    switch_to_main
    clean_local_branches
    clean_remote_branches
    show_final_report
    show_remaining_branches
    
    # رسالة ختامية
    echo -e "${CYAN}${BOLD}═══════════════════════════════════════════════════════════════${RESET}"
    echo -e "${GREEN}${BOLD}       🦅 Zayed Balance - عملية ناجحة وسيادية 🦅${RESET}"
    echo -e "${CYAN}${BOLD}═══════════════════════════════════════════════════════════════${RESET}\n"
}

# تشغيل البرنامج
main
