#include<stdio.h>
#include"header.h"

/* Example from online class 3 */

int main(void) {
    int arr[LENGTH];
    int * ptr = arr;

    for (int ii=0; ii<LENGTH; ii++) {
        arr[ii] = ii * 2;
    }

    printf("\nFactorial:\n");
    for (int ii=0; ii<LENGTH; ii++) {
        printf("\t%d!=%d\n", ii, fact(ii));
    }


    printf("\narr (LENGTH=%d): ", LENGTH);
    for (int ii=0; ii<LENGTH; ii++) {
        printf("%d ", *(ptr+ii));
    }

    printf("\n");
    printf("sizeof(arr)=%ld sizeof(ptr)=%ld\n", sizeof(arr), sizeof(ptr));
    printf("\n");

    return 0;
}
