//
// Created by Jason Codd on 3/11/2022.
//

#include <stdio.h>

int main(int argc, char **argv) {
    // Write a C program, append_line.c, which is given one command-line argument,
    // the name of a file, and which reads a line from stdin and appends it to the specified file.

    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);

        return 1;
    }

    FILE *stream = fopen(argv[1], "a");
    if (stream == NULL) {
        perror(argv[1]);
        return 1;
    }

    int c = 0;
    while ((c = fgetc(stdin)) != EOF) {
        fputc(c, stream);
        if (c == '\n') {
            break;
        }
    }


    fclose(stream);
    return 0;
}