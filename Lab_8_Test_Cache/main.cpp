#include <iostream>
#include <cstdint>
#include <intrin.h>
#include <fstream>

int randomCompare(void const* a, void const* b) {
    return rand() - RAND_MAX / 2;
}

void fillArray(const std::string& way, int* arr, const int& N) {
    if (way == "1") {
        for (int i = 0; i < N; i++) {
            arr[i] = (i+1)%N;
        }
    }

    if (way == "2") {
        for (int i = 0; i < N; i++) {
            arr[i] = (i + N - 1) % N;
        }
    }

    if (way == "3") {
        int* permutation = new int [N];

        for (int i = 0; i < N; i++) {
            permutation[i] = i;
        }

        qsort(permutation, N, sizeof(int), randomCompare);

        for (int i = 0; i < N - 1; i++) {
            arr[permutation[i]] = permutation[i + 1];
        }

        arr[permutation[N - 1]] = permutation[0];
        delete [] permutation;
    }
}

void heatCash(const int* arr, const int& N) {
    int k = 0;
    for (int i = 0; i < N; i++) {
        k = arr[i];
    }
    if (k == 123)
        std::cout <<"Hello world!" << std::endl;
}

void walk(int* arr, const int& N) {
    heatCash(arr, N);
    int k = 0;

    size_t start = _rdtsc();
    for (int i = 0; i < N * 10; i++) {
        k = arr[k];
    }
    size_t end = _rdtsc();

    std::cout << N << std::endl;
    std::cout << static_cast<int>((end - start) / (N * 10)) << std::endl;
}

int main() {
    int N = 5000;

    while (N < 100000000) {
        int* arr = new int [N];

        fillArray("1", arr, N);
        walk(arr, N);
        //fillArray("2", arr, N);
        //walk(arr, N);
        //fillArray("3", arr, N);
        //walk(arr, N);

        N = (int)(N * 1.2);
        delete [] arr;
    }

    return 0;
}
