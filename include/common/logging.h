#ifndef STREAM_COMMON_LOGGING_H
#define STREAM_COMMON_LOGGING_H

#include "common/types.h"
#include <stdarg.h>

#define LOG_MAX_MESSAGE 1024
#define LOG_TIME_FORMAT "%Y-%m-%d %H:%M:%S"

// Logging configuration
typedef struct LogConfig {
    LogLevel min_level;
    const char* log_file;
    bool console_output;
    bool file_output;
    size_t max_file_size;
    int max_backup_files;
} LogConfig;

// Function declarations
void init_logging(const LogConfig* config);
void log_message(LogLevel level, const char* format, ...);
void log_messagev(LogLevel level, const char* format, va_list args);
void cleanup_logging(void);

// Convenience macros
#define LOG_DEBUG(...) log_message(LOG_DEBUG, __VA_ARGS__)
#define LOG_INFO(...) log_message(LOG_INFO, __VA_ARGS__)
#define LOG_WARN(...) log_message(LOG_WARN, __VA_ARGS__)
#define LOG_ERROR(...) log_message(LOG_ERROR, __VA_ARGS__)
#define LOG_FATAL(...) log_message(LOG_FATAL, __VA_ARGS__)

#endif // STREAM_COMMON_LOGGING_H
