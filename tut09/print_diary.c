//
// Created by Jason Codd on 10/11/2022.
//

#include <stdlib.h>
#include <string.h>
#include <stdio.h>

const char *basename = ".diary";


int main(int argc, char **argv) {
    char *homepath = getenv("HOME");

    if (homepath == NULL) {
        homepath = ".";
    }

    int diary_path_len = strlen(homepath) + strlen(basename) + 2;

    char *path = malloc(diary_path_len * sizeof(char));
    snprintf(path, diary_path_len, "%s/%s", homepath, basename);

    FILE *diary_file = fopen(path, "r");
    if (diary_file == NULL) {
        perror(path);
        return 1;
    }


    int letter;
    while ((letter = fgetc(diary_file)) != EOF) {
        fputc(letter, stdout);
    }

    free(path);
    fclose(diary_file);
}