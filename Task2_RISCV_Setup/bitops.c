#include <stdio.h>
#include "unique.h"

unsigned int set_bit(unsigned int num, int pos) {
    return num | (1U << pos);
}

unsigned int clear_bit(unsigned int num, int pos) {
    return num & ~(1U << pos);
}

unsigned int toggle_bit(unsigned int num, int pos) {
    return num ^ (1U << pos);
}

int check_bit(unsigned int num, int pos) {
    return (num >> pos) & 1U;
}

int main() {
    unsigned int num = 0b1010; // binary 10
    printf("Initial: %u\n", num);

    num = set_bit(num, 1);
    printf("After setting bit 1: %u\n", num);

    num = clear_bit(num, 3);
    printf("After clearing bit 3: %u\n", num);

    num = toggle_bit(num, 0);
    printf("After toggling bit 0: %u\n", num);

    printf("Bit 2 is %s\n", check_bit(num, 2) ? "SET" : "CLEAR");

    printf("User: %s\n", USERNAME);
    printf("Host: %s\n", HOSTNAME);
    printf("Machine ID: %s\n", MACHINE_ID);
    printf("Timestamp: %s\n", TIMESTAMP);
    printf("Epoch Time: %s\n", EPOCH_TIME);

    return 0;
}
