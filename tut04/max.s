# Recursive maximum of array function

# Register usage:
# - `a' is in $a0 (only before function call)
# - `length' is in $a1 (only before function call)
# - `first_element' is in $s0
# - `max_so_far' is in $t0 (only after function call)

# s0 & s1 used for a and first_element because they need
# to keep their value across recursive call
max:
        push    $ra                             # save registers onto stack
        push    $s0
        push    $s1

        lw      $s0, 0($a0)                     # int first_element = array[0]
        bne     $a1, 1, max__length_ne_one      # if (length == 1) {
        move    $t0, $s0                        # max_so_far = first_element
        j       max__return

max__length_ne_one:                             # else {
        addi    $a1, $a1, -1
        addi    $a0, $a0, 4
        jal     max                             # ... = max(&array[1], length - 1)
        move    $t0, $v0                        # max_so_far = ...

        ble     $s0, $t0, max__return           # if (first_element > max_so_far)
        move    $t0, $s0                        # max_so_far = first_element

max__return:
       pop      $s1                             # restore registers
       pop      $s0
       pop      $ra
       move     $v0, $t0                        # return max_so_far
       jr       $ra
# some test code which calls max
main:
        addi    $sp, $sp, -4    # create stack frame
        sw      $ra, 0($sp)     # save return address for after the function call

        la      $a0, array
        li      $a1, 10
        jal     max             # call max(array, 10)

        move    $a0, $v0        # printf ("%d")
        li      $v0, 1
        syscall

        li      $a0, '\n'       # printf("%c", '\n');
        li      $v0, 11
        syscall

                                # clean up stack frame
        lw      $ra, 0($sp)     # restore $ra
        addi    $sp, $sp, 4     # restore sp

        li      $v0, 0          # return 0
        jr      $ra


.data
array:
    .word 1, 2, 3, 4, 5, 6, 4, 3, 2, 1