#include <stdio.h>

#int main(void) {
#    int x;
#    printf("Enter a number: ");
#    scanf("%d", &x);

#    if (x > 100 && x < 1000) {
#        printf("medium\n");
#    } else {
#        printf("small/big\n");
#    }
#}

#    if (x > 100 && x < 1000) {
#        printf("medium\n");
#    } else {
#        printf("small/big\n");
#    }
#
#   if (x <= 100 || x >= 1000) {
#       printf("small/big\n");
#   } else {
#       printf("medium\n");
#   }
#
#
#
#
#

main:                       # int main(void) {

    li      $v0, 4
    la      $a0, prompt     # printf("Enter a number: ");
    syscall

    li      $v0, 5          # scanf("%d", &x);
    syscall

    move    $t0, $v0

    li      $t1, 100
    ble     $t0, $t1, print_small_big
    li      $t1, 1000
    bge     $t0, $t1, print_small_big


print_medium:
    li      $v0, 4          # printf("medium\n");
    la      $a0, medium
    syscall
    b       end

print_small_big:
    li      $v0, 4          # printf("small/big\n");
    la      $a0, small_big
    syscall


end:
    jr $ra




.data
prompt:
    .asciiz "Enter a number: "
medium:
    .asciiz "medium\n"
small_big:
    .asciiz "small/big\n"