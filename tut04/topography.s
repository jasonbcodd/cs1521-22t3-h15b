
# A topographic map!
# This helpful tool will tell explorers how much they need to climb to
# reach various points of interest.
#
# Given an array of points, `my_points`, it can look up individual cells
# in the 2D map and print their height.

# Constants
MAP_SIZE = 5
N_POINTS = 4

.text

main:
	# Registers:
	#   - $t0: int i, the loop counter
	#   - $t1: row of the current point
	#   - $t2: col of the current point
	#   - $t3: height of the current point
	#   - $t4: temporary result for array indexing
	#   - $t5: temporary result for array indexing
main__i_init:                                           # for (int i = 0; i < N_POINTS; i++)
        li              $t0, 0                          # int i = 0;
main__i_body:
        bge             $t0, N_POINTS, main__i_end

        la              $t4, my_points                  # $t4 = &my_points
        mul             $t5, $t0, 8                     # $t5 = i * sizeof(struct point2D)
        add             $t4, $t4, $t5                   # $t4 = &my_points[i]
        lw              $t1, ($t4)                      # $t1 = my_points[i].row
        lw              $t2, 4($t4)                     # $t2 = my_points[i].col


        mul             $t5, $t1, 4
        mul             $t5, $t5, MAP_SIZE              # $t5 = row_offset
        mul             $t4, $t2, 4
        add             $t5, $t5, $t4                   # $t5 = row_offset + col_offset

        la              $t4, topography_grid            # $t4 = &topography_grid
        add             $t4, $t4, $t5                   # $t4 = &topography_grid[row][col]
        lw              $t3, ($t4)                      # $t3 = &topography_grid[row][col]

        la              $a0, height_str                 # printf("Height at ")
        li              $v0, 4
        syscall

        move            $a0, $t1                        # printf("%d", row)
        li              $v0, 1
        syscall

        li              $a0, ','                        # printf(",")
        li              $v0, 11
        syscall

        move            $a0, $t2                        # printf("%d", col)
        li              $v0, 1
        syscall

        li              $a0, '='                        # printf("=")
        li              $v0, 11
        syscall

        move            $a0, $t3                        # printf("%d", height)
        li              $v0, 1
        syscall

        li              $a0, '\n'                       # printf("\n")
        li              $v0, 11
        syscall
main__i_iter:
        addi            $t0, $t0, 1                     # i++
        j main__i_body
main__i_end:
        li              $v0, 0                          # return 0
        jr              $ra


# 2D grid representing the height data for an area.
topography_grid:
	.word	0, 1, 1, 2, 3
	.word	1, 1, 2, 3, 4
	.word	1, 2, 3, 5, 7
	.word	3, 3, 4, 5, 6
	.word	3, 4, 5, 6, 7

# Points of interest to print heights for, as a 1D array of point2D_t structs.
# Note the memory layout of this array: each element requires 8 bytes, not 4.
my_points:
	.word	1, 2
	.word	2, 3
	.word	0, 0
	.word	4, 4

height_str: .asciiz "Height at "