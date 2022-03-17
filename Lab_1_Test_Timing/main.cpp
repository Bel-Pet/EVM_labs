#include <iostream>
#include <cmath>

#include <time.h>

#include <sys/times.h>
#include <unistd.h>


const long long LAST_ELEMENT = 750000000;

int main() {
    /*struct timespec start, end;
    clock_gettime(CLOCK_MONOTONIC_RAW, &start);*/

    /*struct tms start, end;
    long clocks_per_sec = sysconf(_SC_CLK_TCK);
    long clocks;
    times(&start);*/

    union ticks{
    unsigned long long t64;
    struct s32 { long th, tl; } t32;
    } start, end;
    double cpu_Hz = 3000000000ULL;

    double answer = 0;
    double x = 1;

    for (int n = 1; n < LAST_ELEMENT; ++n)
        answer += pow(-1, n + 1) * pow(x, n) / n;

    //clock_gettime(CLOCK_MONOTONIC_RAW, &end);

    /*times(&end);
    clocks = end.tms_utime -start.tms_utime;*/

    asm("rdtsc\n":"=a"(start.t32.th),"=d"(start.t32.tl));
    asm("rdtsc\n":"=a"(end.t32.th),"=d"(end.t32.tl));

    std::cout << "Ответ: " << answer << std::endl;

    //std::cout << "Time taken: " << end.tv_sec-start.tv_sec + 0.000000001*(end.tv_nsec-start.tv_nsec) << std::endl;

    //std::cout << "Time taken: " << (double)clocks / clocks_per_sec << std::endl;

    //std::cout << "Time taken: " << (end.t64-start.t64)/cpu_Hz << std::endl;
    printf("Time taken: %lf sec.\n",(end.t64-start.t64)/cpu_Hz);

    return 0;
}
