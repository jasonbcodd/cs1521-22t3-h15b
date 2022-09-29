N_SIZE = 10

main:

        li      $t0, 0                          # int i = 0

loop_i__begin:
loop_i__cond:
        bge     $t0, N_SIZE, loop_i__end        # while (i < N_SIZE)

        la      $t2, numbers                    # $t2 = &numbers[0]
        mul     $t1, $t0, 4                     # $t1 = 4 * i
        add     $t1, $t2, $t1                   # $t1 = &numbers[i]

        lw      $a0, ($t1)                      # $a0 = numbers[i]
        li      $v0, 1                          # printf("%d", numbers[i])
        syscall

        li      $a0, '\n'                       # printf("%c", '\n')
        li      $v0, 11
        syscall

        add $t0, $t0, 1                         # i++
        j loop_i__cond
loop_i__end:
        jr $ra                                  # return 0


.data
numbers:
        .word 0 .word 1 .word 2 .word 3 .word 4 .word 5 .word 6 .word 7 .word 8 .word 9