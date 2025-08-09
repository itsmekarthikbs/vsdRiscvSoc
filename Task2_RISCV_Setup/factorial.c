#include <stdio.h>
#include "unique.h"

unsigned long long factorial(int n) {
    if (n < 0) return 0; // Undefined for negative numbers
    unsigned long long fact = 1;
    for (int i = 1; i <= n; i++) {
        fact *= i;
    }
    return fact;
}

int main() {
    int num = 10; // You can change this if you want
    printf("Factorial of %d = %llu\n", num, factorial(num));

    printf("User: %s\n", USERNAME);
    printf("Host: %s\n", HOSTNAME);
    printf("Machine ID: %s\n", MACHINE_ID);
    printf("Timestamp: %s\n", TIMESTAMP);
    printf("Epoch Time: %s\n", EPOCH_TIME);

    return 0;
}

