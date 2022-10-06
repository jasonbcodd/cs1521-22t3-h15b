# This program prints out a danish flag, by
# looping through the rows and columns of the flag.
# Each element inside the flag is a single character.
# (i.e., 1 byte).
#
# (Dette program udskriver et dansk flag, ved at
# sløjfe gennem rækker og kolonner i flaget.)
#

# Constants
FLAG_ROWS = 6
FLAG_COLS = 12

# Registers:
# - row in $t0
# - col in $t1
# - row offset in $t2
# - row+col offset in $t3
main:
main__row_init:                         # for (int row = 0; row < FLAG_ROWS; row++) {
        li      $t0, 0                  # int row = 0
main__row_body:
        bge     $t0, FLAG_ROWS, main__row_end
main__col_init:                         # for (int col = 0; col < FLAG_COLS; col++) {
        li      $t1, 1                  # int col = 0
main__col_body:
        bge     $t1, FLAG_COLS, main__col_end

        la      $t4, flag               # $t4 = &flag[0]
        mul     $t2, $t0, FLAG_COLS     $ $t2 = row * FLAG_COLS
        add     $t3, $t2, $t1           # $t3 = row * FLAG_COLS + col
        add     $t4, $t4, $t3           # $t4 = &flag[row][col]
        lb      $a0, ($t4)              # $a0 = flag[row][col]

        li      $v0, 11                 # printf("%c", flag[row][col])
        syscall
main__col_iter:
        addi    $t1, $t1, 1             # col++;
        j       main__col_body
main__col_end:
        li      $a0, '\n'               # printf('\n');
        li      $v0, 11
        syscall
main__row_iter:
        addi    $t0, $t0, 1             # row++;
        j       main__row_body
main__row_end:
        jr      $ra                     # return

.data
# This label inside the data region refers to the bytes of the flag.
# Note that even thought the bytes are listed on separate lines,
# they are actually stored as a single contiguous chunk or 'string' in memory.
flag:
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
        .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'