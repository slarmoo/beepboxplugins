#include "bpbxplug.h"

// #include <stdarg.h>
#include <string.h>

// logs formatted message
// static void bpbxplug_logf(const char *fmt, ...) {
// 	// C's version of "string interpolation"
// 	static char buf[128];
// 	va_list va;
// 	va_start(va, fmt);
// 	vsnprintf(buf, 128, fmt, va);
// 	va_end(va);

// 	bpbxplug_log(buf);
// }

void bpbxplug_entry(void) {
    const char *str = "Hello, world!";
    bpbxplug_log((char*)strlen(str));
}