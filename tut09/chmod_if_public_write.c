//
// Created by Jason Codd on 10/11/2022.
//

#include <sys/stat.h>
#include <stdio.h>
#include <stdlib.h>

void chmod_if_needed(char *pathname);


int main(int argc, char **argv) {
    for (int i = 0; i < argc; i++) {
        chmod_if_needed(argv[i]);
    }

    return 0;
}

void chmod_if_needed(char *pathname) {
    struct stat s;
    int out = stat(pathname, &s);
    if (out != 0) {
        perror(pathname);
        exit(EXIT_FAILURE);
    }

    mode_t mode = s.st_mode;
    if (!(mode & S_IWOTH)) {
        printf("%s is not publically writable\n", pathname);
        return;
    }

    mode_t new_mode = mode & ~S_IWOTH;

    out = chmod(pathname, new_mode);
    if (out != 0) {
        perror(pathname);
        exit(EXIT_FAILURE);
    }
    printf("removing public write from %s\n", pathname);
}

