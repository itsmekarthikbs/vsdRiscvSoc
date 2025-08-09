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
    uniq_print_header("factorial"); // Prints identity info

    int num = 10; 
    printf("Factorial of %d = %llu\n", num, factorial(num));

    return 0;
}
