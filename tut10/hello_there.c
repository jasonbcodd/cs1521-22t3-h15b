//
// Created by Jason Codd on 17/11/2022.
//
#include <stdio.h>
#include <stdbool.h>
#include <pthread.h>


void *print_other(void *data) {
    while (true) {
        printf("%s", (char *) data);
    }

    return NULL;
}

int main() {
    char *data = "Hello\n";

    pthread_t thread;
    pthread_create(&thread, NULL, print_other, data);
    while (true) {
        printf("there!\n");
    }

    pthread_join(thread, NULL);
}