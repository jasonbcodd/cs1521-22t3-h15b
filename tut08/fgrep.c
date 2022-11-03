//
// Created by Jason Codd on 3/11/2022.
//


// Write a C program, fgrep.c, which is given 1+ command-line arguments which is a string to search for.
//If there is only 1 command-line argument it should read lines from stdin and print them to stdout iff they contain the string specified as the first command line argument.
//
//If there are 2 or more command line arguments, it should treat arguments after the first as filenames and print any lines they contain which contain the string specified as the first command line arguments.
//
//When printing lines your program should prefix them with a line number.
//
//It should print suitable error messages if given an incorrect number of arguments or if there is an error opening a file.

#include <stdio.h>
#include <string.h>
#include <unistd.h>


#define MAX_LINE 1024

void search_stream(FILE *file, char *stream_name, char *search_text);

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);

        return 1;
    } else if (argc == 2) {
        search_stream(stdin, "STDIN", argv[1]);
    } else {
        for (int i = 2; i < argc; i++) {
            FILE *f = fopen(argv[i], "r");
            if (f == NULL) {
                perror(argv[i]);
                return 1;
            }

            search_stream(f, argv[i], argv[1]);


            fclose(f);
        }

        fseek(f, 1000, SEEK_CUR)
    }

    return 0;
}


void search_stream(FILE *file, char *stream_name, char *search_text) {
    char line[MAX_LINE];

    int line_number = 0;

    while (fgets(line, MAX_LINE, file) != NULL) {
        if (strstr(line, search_text) != NULL) {
            fprintf(stdout, "%s: %d: %s", stream_name, line_number, line);
        }
        line_number++;
    }
}