#include <stdint.h>
#include <stdio.h>


//
// Created by Jason Codd on 27/10/2022.
//

uint32_t six_middle_bits(uint32_t bits) {
    return (bits >> 13) & (63);
}

uint32_t six_middle_bits_2(uint32_t bits) {
    return ((bits << 13) >> 26);
}

int main() {

    //1010 0110 0110 0111 1010 0110 0110 0111

    printf("%d\n", six_middle_bits(0xA667A667));
    printf("%d\n", six_middle_bits_2(0xA667A667));


}


