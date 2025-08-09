#include <stdio.h>
#include "unique.h"

int find_max(int arr[], int size) {
    int max = arr[0];
    for (int i = 1; i < size; i++) {
        if (arr[i] > max) {
            max = arr[i];
        }
    }
    return max;
}

int main() {
    int numbers[] = {12, 45, 7, 89, 34, 56, 99, 23};
    int size = sizeof(numbers) / sizeof(numbers[0]);

    printf("Maximum value in array = %d\n", find_max(numbers, size));

    printf("User: %s\n", USERNAME);
    printf("Host: %s\n", HOSTNAME);
    printf("Machine ID: %s\n", MACHINE_ID);
    printf("Timestamp: %s\n", TIMESTAMP);
    printf("Epoch Time: %s\n", EPOCH_TIME);

    return 0;
}

