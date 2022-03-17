#include <iostream>
#include <intrin.h>

namespace Cache {
    constexpr int sizeL1Bytes = 32 * 1024;
    constexpr int sizeL2Bytes = 128 * 1024;
    constexpr int sizeL3Bytes = 12582912;
    constexpr int offsetBytes = sizeL3Bytes;
    constexpr int sizeBytes = sizeL1Bytes;

    constexpr int sizeL1Int = sizeL1Bytes / sizeof(int);
    constexpr int sizeL2Int = sizeL2Bytes / sizeof(int);
    constexpr int sizeL3Int = sizeL3Bytes / sizeof(int);
    constexpr int offsetInt = offsetBytes / sizeof(int);
    constexpr int sizeInt = sizeL1Bytes / sizeof(int);

    constexpr int maxNFragments = 64;

    void fillArray(int* arr, int nFragments){
        int nElements = sizeL1Int / nFragments;
        for(int i = 0; i < nElements; i++){
            for(int j = 0; j < nFragments - 1; j++){
                arr[j * offsetInt + i] = (j + 1) * offsetInt + i;
            }
        }
        arr[(nFragments - 1) * offsetInt + nElements - 1] = 0;
    }

    void walk(){
        const int nAttempts = 1000;
        for (int i = 1; i <= maxNFragments; i++){
            int *arr = new int[i * offsetInt];
            fillArray(arr, i);

            size_t start = _rdtsc();
            for(int j = 0, k = 0; j < sizeL1Int * nAttempts; j++){
                k = arr[k];
            }
            size_t end = _rdtsc();

            std::cout /*<< i << "-"*/ << static_cast<int>((end - start) / (sizeL1Int * nAttempts)) << std::endl;

            delete [] arr;
        }
    }
}

int main() {
    Cache::walk();
    return 0;
}
