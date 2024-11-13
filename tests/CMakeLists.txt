cmake_minimum_required(VERSION 3.10)

# Enable testing
enable_testing()

# Find Unity test framework
find_package(Threads REQUIRED)

# Add Unity test framework
add_library(unity STATIC
    ${CMAKE_CURRENT_SOURCE_DIR}/unity/unity.c
)
target_include_directories(unity PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/unity
)

# Compile test files
file(GLOB_RECURSE TEST_SOURCES
    "unit/*.c"
    "integration/*.c"
)

# Create test executable
add_executable(run_tests ${TEST_SOURCES})
target_link_libraries(run_tests
    unity
    stream_processor
    pthread
)

# Add tests
add_test(NAME unit_tests COMMAND run_tests)

# Create test directory structure
file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/test_output)
