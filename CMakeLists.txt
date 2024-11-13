cmake_minimum_required(VERSION 3.10)
project(stream_processor VERSION 1.0.0)

# Set C standard
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Build type
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

# Find required packages
find_package(Threads REQUIRED)

# Compiler flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra")
set(CMAKE_C_FLAGS_DEBUG "-g")
set(CMAKE_C_FLAGS_RELEASE "-O3")

# Output directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

# Build dependencies first
add_subdirectory(lib)

# Source files
set(COMMON_SOURCES
    src/common/types.c
    src/common/logging.c
)


# Main library
add_library(stream_processor SHARED ${COMMON_SOURCES})

target_include_directories(stream_processor
    PUBLIC
        ${PROJECT_SOURCE_DIR}/include
    PRIVATE
        ${CMAKE_BINARY_DIR}/msgpack/include
        ${PROJECT_SOURCE_DIR}/lib/mongoose
        ${PROJECT_SOURCE_DIR}/lib/raft
)

# Add explicit dependency on msgpack
add_dependencies(stream_processor msgpack_external)

# Link directories
target_link_directories(stream_processor
    PRIVATE
        ${CMAKE_BINARY_DIR}/msgpack/lib
)

target_link_libraries(stream_processor
    PRIVATE
        msgpack-c  # Fixed library name
        mongoose
        raft
        json-c
        zmq
        ${CMAKE_THREAD_LIBS_INIT}
)

# Executable
add_executable(stream_processor_exe src/main.c)
set_target_properties(stream_processor_exe
    PROPERTIES OUTPUT_NAME "stream_processor"
)
target_link_libraries(stream_processor_exe
    PRIVATE
        stream_processor
)

# Print configuration
message(STATUS "")
message(STATUS "=== Build Configuration ===")
message(STATUS "Build Type: ${CMAKE_BUILD_TYPE}")
message(STATUS "MessagePack Include: ${CMAKE_BINARY_DIR}/msgpack/include")
message(STATUS "MessagePack Library: ${CMAKE_BINARY_DIR}/msgpack/lib/libmsgpack-c.a")
message(STATUS "==========================")
message(STATUS "")

# Installation
install(TARGETS stream_processor stream_processor_exe
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)

install(DIRECTORY include/
    DESTINATION include/stream_processor
    FILES_MATCHING PATTERN "*.h"
)
