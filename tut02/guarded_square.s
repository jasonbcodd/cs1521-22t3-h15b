# // Squares a number, unless its square is too big for a 32-bit integer.
# // If it is too big, prints an error message instead.

#include <stdio.h>

#define SQUARE_MAX 46340

#int main(void) {
#    int x, y;

#    printf("Enter a number: ");
#    scanf("%d", &x);

#    if (x > SQUARE_MAX) {
#        printf("square too big for 32 bits\n");
#    } else {
#        y = x * x;
#        printf("%d\n", y);
#    }

#    return 0;
#}

# Prints the square of a number


main:                       # int main(void) {
    la      $a0, prompt     #    printf("Enter a number: ");
    li      $v0, 4
    syscall

    li      $v0, 5          #    scanf("%d", &x);
    syscall

    move    $t0, $v0


    li      $t2, 46340

    ble     $t0, $t2, can_square
    li      $v0, 4
    la      $a0, exceed_max
    syscall
    b end


can_square:
    mul     $t1, $t0, $t0   #    y = x * x;

    move    $a0, $t1        #    printf("%d\n", y);
    li      $v0, 1
    syscall

    li      $a0, '\n'
    li      $v0, 11
    syscall
end:
    jr      $ra             #    return 0;
.data
prompt:
     .asciiz    "Enter a number: "
exceed_max:
    .asciiz     "square too big for 32 bits\n"