# // Prints the square of a number

#include <stdio.h>

# int main(void) {
#    int x, y;

#    printf("Enter a number: ");
#    scanf("%d", &x);

#    y = x * x;

#    printf("%d\n", y);

#    return 0;
# }


#############################


# Prints the square of a number


main:                       # int main(void) {
    la      $a0, prompt     #    printf("Enter a number: ");
    li      $v0, 4
    syscall

    li      $v0, 5          #    scanf("%d", &x);
    syscall

    move    $t0, $v0
    mul     $t1, $t0, $t0   #    y = x * x;

    move    $a0, $t1        #    printf("%d\n", y);
    li      $v0, 1
    syscall

    li      $a0, '\n'
    li      $v0, 11
    syscall

    jr      $ra             #    return 0;
.data
prompt:
     .asciiz    "Enter a number: "