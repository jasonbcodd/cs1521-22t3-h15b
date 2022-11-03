//
// Created by Jason Codd on 3/11/2022.
//

#include <errno.h>

#include <stdio.h>
#include <string.h>
#include <err.h>

int main() {
    FILE *f = fopen("blah", "r");
    if (f == NULL) {
        perror("");

        char *error_message = strerror(errno);
        fprintf(stderr, "%s\n", error_message);


        warn(NULL);

        err(1, NULL);

        error(1, errno, NULL);
    }
}