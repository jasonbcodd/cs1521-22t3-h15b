//
// Created by Jason Codd on 3/11/2022.
//

#include <stdio.h>

int main(int argc, char **argv) {
    // Write a C program, first_line.c, which is given one command-line argument,
    // the name of a file, and which prints the first line of that file to stdout.
    //
    // If given an incorrect number of arguments, or if there was an error opening the file,
    // it should print a suitable error message.


    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);

        return 1;
    }

    FILE *stream = fopen(argv[1], "r");
    if (stream == NULL) {
        perror(argv[1]);
        return 1;
    }


    int c = 0;

    while ((c = fgetc(stream)) != EOF) {
        fputc(c, stdout);
        if (c == '\n') break;
    }


    fclose(stream);
    return 0;
}