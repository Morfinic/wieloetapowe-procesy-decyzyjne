#include "fibonacci.h"

#include <iostream>

unsigned __int128 Fibonacci(const int n) {
    if (n == 0 or n == 1)
        return n;
    return Fibonacci(n - 1) + Fibonacci(n - 2);
}

unsigned __int128 Fibonacci_Memo(const int n, unsigned __int128 memo[]) {
    if (n == 0 or n == 1)
        return n;
    if (memo[n] != -1)
        return memo[n];

    memo[n] = Fibonacci_Memo(n - 1, memo) + Fibonacci_Memo(n - 2, memo);
    return memo[n];
}

unsigned __int128 Fibonacci_Bottom_Up(const int n) {
    if (n == 0 or n == 1)
        return n;

    unsigned __int128 num1=0, num2=1;

    for (int i = 2; i <= n; i++) {
        const unsigned __int128 temp = num1 + num2;
        num1 = num2;
        num2 = temp;
    }

    return num2;
}

