#include <stdio.h>

int func5() {
    int x;
    printf("The value of x is %d\n", x); // Using uninitialized variable
    return 0;
}
