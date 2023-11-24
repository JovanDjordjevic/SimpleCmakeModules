
#include <stdio.h>

int func() {
    int x;
    printf("The value of x is %d\n", x); // Using uninitialized variable
    return 0;
}
