#// Print every third number from 24 to 42.
#include <stdio.h>

#int main(void) {
#    // This 'for' loop is effectively equivalent to a while loop.
#    // i.e. it is a while loop with a counter built in.
#    for (int x = 24; x < 42; x += 3) {
#        printf("%d\n", x);
#    }
#}


main:

for_x__init:            # for (int x = 24; x < 42; x += 3) {
    li      $t0, 24
for_x__cond:
    bge     $t0, 42, for_x__end
for_x__body:
    li      $v0, 1      # printf("%d\n", x);
    move    $a0, $t0
    syscall

    li      $v0, 11
    li      $a0, '\n'
    syscall
for_x__iter:
    addiu   $t0, $t0, 3
    b       for_x__cond
for_x__end:
    jr      $ra

