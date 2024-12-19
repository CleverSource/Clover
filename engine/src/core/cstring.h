#pragma once

#include "defines.h"

CAPI u64 string_length(const char* str);

CAPI char* string_duplicate(const char* str);

CAPI b8 strings_equal(const char* str0, const char* str1);

CAPI i32 string_format(char* dest, const char* format, ...);

CAPI i32 string_format_v(char* dest, const char* format, void* va_list);