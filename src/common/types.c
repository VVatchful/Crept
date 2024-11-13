#include "common/types.h"
#include <string.h>

StreamData* create_stream_data(void) {
    StreamData* data = malloc(sizeof(StreamData));
    if (data) {
        memset(data, 0, sizeof(StreamData));
    }
    return data;
}

void destroy_stream_data(StreamData* data) {
    if (data) {
        if (data->data) {
            free(data->data);
        }
        free(data);
    }
}
