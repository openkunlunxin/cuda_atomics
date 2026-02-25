#include "hip/hip_runtime.h"
#include <stdio.h>
#include <hip/hip_runtime.h>
#include <chrono>
#include <iostream>
#include <vector>
#include <random>
#include <algorithm>
#include <hip/hip_runtime.h>
#include <hip/hip_cooperative_groups.h>

#define N 1000000
#define WARMUP 1000000
#define ITERATIONS 10000000

#define CONST_DATA_MAX (2 * 1024 * 1024 / sizeof(int))
__constant__ int constData[CONST_DATA_MAX];

// Fisher-Yates洗牌算法 - 原地版本
void fisherYatesShuffle(int *pattern, int size) {
    std::vector<int> arr(size);

    // 初始化顺序数组
    for (int i = 0; i < size; i++) {
        arr[i] = i;
    }

    // 使用高质量随机数生成器
    std::random_device rd;
    std::mt19937 gen(rd());

    // 从后向前洗牌
    for (int k = 0; k<10; k++){
    for (int i = size-1; i > 0; i--) {
        std::uniform_int_distribution<> dis(0, i);
        int j = dis(gen);
        std::swap(arr[i], arr[j]);
    }
    }


    for (int i=0; i<size; i++){
        int next_idx = (i+1)%size;
        pattern[arr[i]] = arr[next_idx];
    }

    int real_nums=0;
    int real_size=0;
    int idx_hash[size];//={0};
    for(long int i=0; i<size; i++){
	    idx_hash[i] = 0;
    }
    
    int idx = 0;
    for(long int i=0; i<ITERATIONS; i++){
        idx_hash[idx] += 1;
        idx = pattern[idx];
    }
    for (long int i=0; i<size; i++){
        if(idx_hash[i] != 0) real_nums += 1;
    }

    real_size = real_nums * sizeof(int);

    printf("SIZE: %6f\tKB REAL SIZE: %6f\t KB ", size*sizeof(int)/1024.0, real_size/1024.0);
}

// device code
__global__ void pointerChaseLatency(int start_idx, float* result) {
    // 只用一个线程测量
    if (threadIdx.x + blockIdx.x * blockDim.x != 0) return;

    int idx = start_idx;
    unsigned long long start, end;
    float total_cycles = 0.0f;

    // 预热
    for (long int i = 0; i < WARMUP; i++) {
        idx = constData[idx];
    }

    // 正式测量
    #pragma unroll 1
    for (long int iter = 0; iter < ITERATIONS; iter++) {
        start = clock64();

        // 多次访问取平均
        #pragma unroll 1
        for (int j = 0; j < 10; j++) {
            idx = constData[idx];
        }

        end = clock64();
        total_cycles += (end - start);

        // 防止优化
        if (idx == -1) break;
    }

    result[0] = total_cycles / (ITERATIONS * 10.0f);
}

void measureMemoryLatency() {

    hipDeviceProp_t prop;
    hipGetDeviceProperties(&prop, 0);
    printf("GPU: %s\n", prop.name);
    printf("Clock Rate: %.2f GHz\n", prop.clockRate / 1000.0f / 1000.0f);

    float* d_result;
    hipMalloc(&d_result, sizeof(float));
    
    for (int size_kb=1024; size_kb<=CONST_DATA_MAX*sizeof(int); size_kb*=2){
        int elements = size_kb / sizeof(int);
        if(elements > CONST_DATA_MAX) return ;

        int h_constData[elements];
        // createChasePattern_host(h_constData, elements, 1);
        fisherYatesShuffle(h_constData, elements);
        // copy const
        hipMemcpyToSymbol(HIP_SYMBOL(constData), h_constData, sizeof(float) * elements);

        // 测量延迟
        pointerChaseLatency<<<1, 1>>>(0, d_result);

        float cycles;
        hipMemcpy(&cycles, d_result, sizeof(float), hipMemcpyDeviceToHost);

        // 转换为纳秒
        float latency_ns = cycles / (prop.clockRate * 1000.0f) * 1e9f;

        //printf("Size: %6f KB - Latency: %6.2f cycles, %6.2f ns\n", 
        //       size_kb/1024.0, cycles, latency_ns);
        printf("%6f, %6.2f\n",size_kb/1024.0, cycles);

    }

    hipFree(d_result);
}

int main(){
        measureMemoryLatency();
        return 0;
}
