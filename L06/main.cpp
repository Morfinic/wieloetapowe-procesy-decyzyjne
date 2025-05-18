#include <algorithm>
#include <iostream>

#include "methods/fibonacci.h"

void print_int128(const int n, unsigned __int128 res) {
    if (res == 0) {
        std::cout << "0";
        return;
    }

    std::string answ;
    while (res > 0) {
        answ.insert(0, 1, '0' + res % 10);
        res /= 10;
    }

    printf("Fib(%d) = %s\n", n, answ.c_str());
}

int main() {
    int fib_nums[5] = {1, 2, 5, 35, 100};
    // Zad.1
    // for (const int n: fib_nums) {
    //     const unsigned __int128 res = Fibonacci(n);
    //     print_int128(n, res);
    // }

    // Zad.2
    // for (const int n: fib_nums) {
    //     unsigned __int128 memo[n+1];
    //     std::fill(memo, memo+n+1, -1LL);
    //
    //     const unsigned __int128 res = Fibonacci_Memo(n, memo);
    //     print_int128(n, res);
    // }

    // Zad.3
    for (const int n: fib_nums) {
        const unsigned __int128 res = Fibonacci_Bottom_Up(n);
        print_int128(n, res);
    }

    return 0;
}
