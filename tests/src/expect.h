#include <core/logger.h>
#include <math/cmath.h>

#define expect_should_be(expected, actual)                                                             \
    if (actual != expected) {                                                                          \
        CERROR("--> Expected %lld, but got: %lld. File: %s:%d", expected, actual, __FILE__, __LINE__); \
        return false;                                                                                  \
    }                                                                                                  

#define expect_should_not_be(expected, actual)                                                                  \
    if (actual == expected) {                                                                                   \
        CERROR("--> Expected %d != %d, but they are equal. File: %s:%d", expected, actual, __FILE__, __LINE__); \
        return false;                                                                                           \
    }

#define expect_float_to_be(expected, actual)                                                       \
    if (cabs(expected, actual) > 0.001f) {                                                         \
        CERROR("--> Expected %f, but got: %f. File: %s:%d", expected, actual, __FILE__, __LINE__); \
        return false;                                                                              \
    }

#define expect_to_be_true(actual)                                                     \
    if (actual != true) {                                                             \
        CERROR("--> Expected true, but got: false. File: %s:%d", __FILE__, __LINE__); \
        return false;                                                                 \
    }

#define expect_to_be_false(actual)                                                    \
    if (actual != false) {                                                            \
        CERROR("--> Expected false, but got: true. File: %s:%d", __FILE__, __LINE__); \
        return false;                                                                 \
    }