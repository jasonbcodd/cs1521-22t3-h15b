main:
     li         $t0, 0                  # int length
     la         $t1, string             # char *s
     lb         $t2, ($t1)              # *s

loop_s__begin:
loop_s__cond:
        beqz    $t2, loop_s__end        # while (*s != 0)

        add     $t0, $t0, 1             # length++
        add     $t1, $t1, 1             # s++
        lb      $t2, ($t1)              # $t2 = *s

        j loop_s__cond
loop_s__end:
        move $a0, $t0                   # printf("%d", length)
        li $v0, 1
        syscall

        li $a0, '\n'                    # printf("%c", '\n')
        li   $v0, 11
        syscall

        jr $ra                          # return 0

.data
string:
        .asciiz "I love mips!!"