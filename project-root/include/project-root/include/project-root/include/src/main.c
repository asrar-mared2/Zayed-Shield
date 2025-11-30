#include <stdio.h>
#include "syscalls.h"
#include "events.h"
#include "shortcuts.h"
#include "utils.h"

int main(void) {
    int c;

    init_events();
    init_shortcuts();
    init_utils();

    printf("🔰 بدء تشغيل مشروع درع زايد\n");
    printf("أدخل نص وسيتم عرضه مرة أخرى:\n");

    while ((c = getchar()) != EOF) {

        // 🔥 تمرير الحدث لنظام الأحداث
        dispatch_event(EVENT_KEYPRESS, c);

        // 🔥 تمرير الحرف لنظام الاختصارات
        if (handle_shortcut(c))
            continue;  // لو shortcut تم، ما نطبع الحرف نفسه

        // 🔥 الوظيفة القديمة
        putchar(c);
    }

    printf("\n✅ انتهى التنفيذ.\n");
    return 0;
}
