#ifndef STREAM_COMMON_TYPES_H
#define STREAM_COMMON_TYPES_H

#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

// Error codes
typedef enum ErrorCode {
    ERROR_NONE = 0,
    ERROR_MEMORY = -1,
    ERROR_INVALID_ARGUMENT = -2,
    ERROR_BUFFER_FULL = -3,
    ERROR_BUFFER_EMPTY = -4,
    ERROR_TIMEOUT = -5,
    ERROR_NETWORK = -6,
    ERROR_NOT_FOUND = -7,
    ERROR_ALREADY_EXISTS = -8
} ErrorCode;

// Log levels
typedef enum LogLevel {
    LOG_DEBUG,
    LOG_INFO,
    LOG_WARN,
    LOG_ERROR,
    LOG_FATAL
} LogLevel;

// Base data structure for stream processing
typedef struct StreamData {
    void* data;
    size_t size;
    char type[32];
    uint64_t timestamp;
    char source[64];
    int priority;
    void* metadata;
} StreamData;

// Result structure for operations
typedef struct Result {
    ErrorCode code;
    char message[256];
} Result;

// Function declarations
StreamData* create_stream_data(void);
void destroy_stream_data(StreamData* data);

#endif // STREAM_COMMON_TYPES_H
