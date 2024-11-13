cmake_minimum_required(VERSION 3.10)

# External dependencies configuration
include(ExternalProject)

# Find required packages
find_package(Threads REQUIRED)

# MessagePack configuration
set(MSGPACK_PREFIX "${CMAKE_BINARY_DIR}/msgpack")
set(MSGPACK_STATIC_LIB "${MSGPACK_PREFIX}/lib/libmsgpack-c.a")  # Fixed library name
set(MSGPACK_INCLUDE_DIR "${MSGPACK_PREFIX}/include")

# Print library locations for debugging
message(STATUS "MessagePack library will be built at: ${MSGPACK_STATIC_LIB}")

ExternalProject_Add(msgpack_external
    SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/msgpack-c"
    PREFIX "${MSGPACK_PREFIX}"
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${MSGPACK_PREFIX}
        -DMSGPACK_BUILD_EXAMPLES=OFF
        -DMSGPACK_BUILD_TESTS=OFF
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    BUILD_BYPRODUCTS "${MSGPACK_STATIC_LIB}"
    INSTALL_COMMAND
        ${CMAKE_COMMAND} --build . --target install
)

# Create the static library target for msgpack
add_library(msgpack-c STATIC IMPORTED GLOBAL)  # Fixed target name
file(MAKE_DIRECTORY "${MSGPACK_INCLUDE_DIR}")
set_target_properties(msgpack-c PROPERTIES
    IMPORTED_LOCATION "${MSGPACK_STATIC_LIB}"
    INTERFACE_INCLUDE_DIRECTORIES "${MSGPACK_INCLUDE_DIR}"
)
add_dependencies(msgpack-c msgpack_external)

# Mongoose
add_library(mongoose STATIC
    "${CMAKE_CURRENT_SOURCE_DIR}/mongoose/mongoose.c"
)
target_include_directories(mongoose PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}/mongoose"
)
target_link_libraries(mongoose PRIVATE ${CMAKE_THREAD_LIBS_INIT})

# Raft
if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/raft/libraft.a")
    add_library(raft STATIC IMPORTED GLOBAL)
    set_target_properties(raft PROPERTIES
        IMPORTED_LOCATION "${CMAKE_CURRENT_SOURCE_DIR}/raft/libraft.a"
        INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}/raft"
    )
else()
    message(FATAL_ERROR "Raft library not found at ${CMAKE_CURRENT_SOURCE_DIR}/raft/libraft.a")
endif()

# System libraries
find_library(JSON_C_LIBRARY json-c REQUIRED)
find_library(ZMQ_LIBRARY zmq REQUIRED)

add_library(json-c INTERFACE)
target_link_libraries(json-c INTERFACE ${JSON_C_LIBRARY})

add_library(zmq INTERFACE)
target_link_libraries(zmq INTERFACE ${ZMQ_LIBRARY})
