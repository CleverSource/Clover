#pragma once

#include "defines.h"

typedef struct clock {
    f64 start_time;
    f64 elapsed;
} clock;

CAPI void clock_update(clock* clock);
CAPI void clock_start(clock* clock);
CAPI void clock_stop(clock* clock);