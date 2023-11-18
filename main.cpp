#include <iostream>
#include <vector>
#include <set>
#include <sys/types.h>
#include <cstring>

int main() {
    std::cout << "hello" << std::endl;

    std::vector<int> vec;
    for (int i = 0; i < 100000; ++i) {
        vec.push_back(i);
    }

    return 0;
}
