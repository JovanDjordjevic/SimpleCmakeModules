#include <iostream>
#include <vector>
#include <set>
#include <sys/types.h>
#include <cstring>

#include <stdio.h>

int main() {
    int x;
    printf("The value of x is %d\n", x); // Using uninitialized variable
    return 0;
}
// ===============================================================================================================
// PROGRAM TO TRIGGER ASAN AND UBSAN ERROR
// ===============================================================================================================

// #include <stdio.h>

// int numbers[] = { 1, 2, 3 };

// int main() {
//      printf("The 4th number in my array is: %i\n", numbers[4]);
// }

// ===============================================================================================================
// PROGRAM TO TRIGGER TSAN ERROR
// ===============================================================================================================

// #include <iostream>
// #include <thread>

// int shared_variable = 0;

// void incrementer() {
//     for (int i = 0; i < 1000000; ++i) {
//         shared_variable++;
//     }
// }

// void decrementer() {
//     for (int i = 0; i < 1000000; ++i) {
//         shared_variable--;
//     }
// }

// int main() {
//     std::thread thread1(incrementer);
//     std::thread thread2(decrementer);

//     // Wait for threads to finish
//     thread1.join();
//     thread2.join();

//     // Print the final value of the shared variable
//     std::cout << "Final value of shared_variable: " << shared_variable << std::endl;

//     return 0;
// }

// ===============================================================================================================
// PROGRAM TO TRIGGER MSAN ERROR
// ===============================================================================================================

// #include <stdio.h>

// int main(int argc, char** argv) {
//   int* a = new int[10];
//   a[5] = 0;
//   if (a[argc]) {
//     printf("xx\n");
//   }
//   return 0;
// }

// ===============================================================================================================
// PROGRAM TO TRIGGER LSAN ERROR
// ===============================================================================================================
// #include <stdlib.h>

// void *p;

// int main() {
//   p = malloc(7);
//   p = 0; // The memory is leaked here.
//   return 0;
// }
