#include <core/logger.h>
#include <core/asserts.h>

#include <platform/platform.h>

int main(void) {
    CFATAL("A test message: %f", 3.14f);
    CERROR("A test message: %f", 3.14f);
    CWARN("A test message: %f", 3.14f);
    CINFO("A test message: %f", 3.14f);
    CDEBUG("A test message: %f", 3.14f);
    CTRACE("A test message: %f", 3.14f);

    platform_state state;
    if (platform_startup(&state, "Clover Engine Testbed", 100, 100, 1280, 720)) {
        while (TRUE) {
            platform_pump_messages(&state);
        }
    }
    platform_shutdown(&state);

    return 0;
}