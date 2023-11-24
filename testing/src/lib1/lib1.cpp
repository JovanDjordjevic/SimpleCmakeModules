
#include <stdio.h>

#include "lib1.hpp"

int func1() {
    int x;
    printf("The value of x is %d\n", x); // Using uninitialized variable
    return 0;
}
