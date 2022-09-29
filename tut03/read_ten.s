N_SIZE = 10

main:                                           # int main(void) {
        li              $t0, 0                  # int i = 0;

loop_i_begin:
loop_i_cond:
    bge                 $t0, N_SIZE, loop_i_end # while(i < N_SIZE)
loop_i_body:
    li                  $v0, 5                  # scanf("%d", &v0)
    syscall
    la                  $t1, numbers            # $t1 = &numbers[0]
    mul                 $t2, $t0, 4             # $t2 = i * 4
    add                 $t2, $t2, $t1           # $t2 = &numbers[i]
    sw                  $v0, ($t2)              # numbers[i] = v0


    add                 $t0, $t0, 1             # i++
    j                   loop_i_cond
loop_i_end:
        jr $ra                                  # return

.data
numbers:
        .word 0:N_SIZE