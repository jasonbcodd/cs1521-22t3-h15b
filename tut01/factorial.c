#include <stdio.h>

int factorial(int x);

int main(void) {
    int x;
    printf("Enter a number: ");
    scanf("%d", &x);


    printf("%d! = %d\n", x, factorial(x));
}

int factorial(int x) {
    if (x < 0) return -1;

    if (x == 0) return 1;
    return x * factorial(x - 1);

    /*if (x < 0) {
        return -1;
    }
    int result = 1;

    while (x > 0) {
        result = result * x;
        x = x - 1;
    }

    return result;*/
}
