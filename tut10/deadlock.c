//
// Created by Jason Codd on 17/11/2022.
//

#include <pthread.h>
#include <stdio.h>
#include <unistd.h>

pthread_mutex_t mutex1;
pthread_mutex_t mutex2;


void *thread1_fn(void *data) {
    pthread_mutex_lock(&mutex1);
    usleep(500);

    pthread_mutex_lock(&mutex2);

    //do something with second var
    pthread_mutex_unlock(&mutex2);

    pthread_mutex_unlock(&mutex1);

    return NULL;
}

void *thread2_fn(void *data) {
    pthread_mutex_lock(&mutex2);
    usleep(500);

    pthread_mutex_lock(&mutex1);

    //do something with first var
    pthread_mutex_unlock(&mutex1);

    pthread_mutex_unlock(&mutex2);

    return NULL;
}


int main() {
    pthread_t thread1;
    pthread_t thread2;

    pthread_create(&thread1, NULL, thread1_fn, NULL);
    pthread_create(&thread2, NULL, thread2_fn, NULL);

    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    printf("finished our program!\n");
}