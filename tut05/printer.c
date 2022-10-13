#include <stdint.h>
#include <stdio.h>

uint8_t printerControl = 0; // 0b 0000 0000

// Whether the printer is out of ink
#define NO_INK (0x1)       // 0b 0000 0001
// Whether to print/scan in colour
#define COLOUR (0x2)       // 0b 0000 0010
// Select print mode
#define SELECT_PRINT (0x4) // 0b 0000 0100
// Select scan mode
#define SELECT_SCAN (0x8)  // 0b 0000 1000
// Start print/scan
#define START (0x10)       // 0b 0001 0000


void isOutOfInk() {
    if (!!(printerControl & NO_INK)) { //out of ink
        printf("Printer is out of ink\n");
    } else { //have ink
        printf("Printer has ink\n");
    }
}

void replaceInk() {
    printerControl = printerControl & ~NO_INK;
}


void scanColour() {
    printerControl = printerControl | COLOUR;
    printerControl = printerControl | SELECT_SCAN;
    printerControl = printerControl & ~SELECT_PRINT;
}

void toggleMode() {
    printerControl = printerControl ^ (SELECT_SCAN | SELECT_PRINT);
}

void startPrint() {
    if (!!(printerControl & SELECT_SCAN) && !!(printerControl & SELECT_PRINT)) {
        printf("Please select only one mode");
        return;
    }

    if (!(printerControl & SELECT_SCAN) && !(printerControl & SELECT_PRINT)) {
        printf("Please select only one mode");
        return;
    }

    if (!(!!(printerControl & SELECT_SCAN) ^ !!(printerControl & SELECT_PRINT))) {
        printf("Please select only one mode");
        return;
    }


    if (!!(printerControl & NO_INK)) { //out of ink
        printf("Printer is out of ink\n");
        return;
    }


    printerControl = printerControl & START;

    while (!!(printerControl & START));


    return;
}

int main() {

}