//
// Created by Jason Codd on 15/9/2022.
//
#include <stdio.h>

int main(void) {
    char str[10] = {0};
    str[0] = 'H';
    str[1] = 'i';
    printf("%s\n", str);

    // code

    str[2] = '!';
    printf("%s\n", str);
    return 0;
}