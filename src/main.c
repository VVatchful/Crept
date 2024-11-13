#include "common/logging.h"
#include "common/types.h"
#include <stdio.h>

int main(int argc, char *argv[]) {
    (void)argc;  // Unused for now
    (void)argv;  // Unused for now

    // Initialize logging
    LogConfig log_config = {
        .min_level = LOG_INFO,
        .console_output = true,
        .file_output = false,
        .log_file = NULL,
        .max_file_size = 0,
        .max_backup_files = 0
    };

    init_logging(&log_config);

    LOG_INFO("Stream Processing System Starting...");

    // Main loop would go here

    cleanup_logging();
    return 0;
}
