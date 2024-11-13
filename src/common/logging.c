#include "common/logging.h"
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <pthread.h>

static LogConfig current_config;
static FILE* log_file = NULL;
static pthread_mutex_t log_mutex = PTHREAD_MUTEX_INITIALIZER;

static const char* level_strings[] = {
    "DEBUG", "INFO", "WARN", "ERROR", "FATAL"
};

void init_logging(const LogConfig* config) {
    pthread_mutex_lock(&log_mutex);

    memcpy(&current_config, config, sizeof(LogConfig));

    if (config->file_output && config->log_file) {
        log_file = fopen(config->log_file, "a");
        if (!log_file) {
            fprintf(stderr, "Failed to open log file: %s\n", config->log_file);
        }
    }

    pthread_mutex_unlock(&log_mutex);
}

void log_message(LogLevel level, const char* format, ...) {
    if (level < current_config.min_level) return;

    va_list args;
    va_start(args, format);
    log_messagev(level, format, args);
    va_end(args);
}

void log_messagev(LogLevel level, const char* format, va_list args) {
    pthread_mutex_lock(&log_mutex);

    time_t now = time(NULL);
    struct tm* tm_info = localtime(&now);
    char timestamp[26];
    strftime(timestamp, sizeof(timestamp), LOG_TIME_FORMAT, tm_info);

    char message[LOG_MAX_MESSAGE];
    vsnprintf(message, sizeof(message), format, args);

    if (current_config.console_output) {
        fprintf(stderr, "[%s] [%s] %s\n",
                timestamp, level_strings[level], message);
        fflush(stderr);
    }

    if (current_config.file_output && log_file) {
        fprintf(log_file, "[%s] [%s] %s\n",
                timestamp, level_strings[level], message);
        fflush(log_file);
    }

    pthread_mutex_unlock(&log_mutex);
}

void cleanup_logging(void) {
    pthread_mutex_lock(&log_mutex);

    if (log_file) {
        fclose(log_file);
        log_file = NULL;
    }

    pthread_mutex_unlock(&log_mutex);
}
