//
// Created by Jason Codd on 17/11/2022.
//

#include <pthread.h>
#include <stdio.h>
#include <stdbool.h>
#include <unistd.h>


void *thread_function(void *data) {
    while (true) {
        printf("feed me input!\n");
        sleep(1);
    }

    return NULL;
}

int main() {
    pthread_t thread;
    pthread_create(&thread, NULL, thread_function, NULL);

    char line[1024];
    while (fgets(line, 1024, stdin)) {
        printf("you entered: %s", line);
    }

    pthread_cancel(thread);
    return 0;
}