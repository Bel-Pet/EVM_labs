#include <iostream>

int main() {
    long long n = 2000000000;
    double x = 0.01;
    long double answer = x;

    for (long long i = 2; i < n; i++)
        answer += answer * (-1) * x / i;

    std::cout << answer << std::endl;

    return 0;
}
