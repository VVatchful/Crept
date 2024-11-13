#include "unity.h"
#include "common/types.h"

void setUp(void) {
    // Set up test
}

void tearDown(void) {
    // Clean up test
}

void test_basic_initialization(void) {
    // Basic test to ensure testing framework works
    TEST_ASSERT_TRUE(1);
}

int main(void) {
    UNITY_BEGIN();
    RUN_TEST(test_basic_initialization);
    return UNITY_END();
}
