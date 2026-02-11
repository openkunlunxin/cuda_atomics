#include "hip/hip_runtime.h"
#include <stdio.h>
#include <iostream>
#include <hip/hip_runtime.h>

#define VALUE 33

#ifndef DATA_TYPE
#define DATA_TYPE int
#endif

inline void checkCuda(hipError_t err, const char* msg = "") {
    if (err != hipSuccess) {
        std::cerr << "CUDA error";
        if (msg && msg[0]) std::cerr << " (" << msg << ")";
        std::cerr << ": " << hipGetErrorString(err) << std::endl;
        exit(EXIT_FAILURE);
    }
}

template <typename T>
__global__ void AtomicAddKernel(T* data, T* out, int N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < N) {
        T old = atomicXor(&data[0], (T)VALUE);
        out[tid] = old;
    }
}

int main() {
    int N = 32;

    using T  =  DATA_TYPE;
    
    T h_data[N], h_out[N];
    T* d_data, *d_out;

    for(int i=0; i<N; i++){
        h_data [i] = 48;
    }

    checkCuda(hipMalloc((void**)&d_data, N * sizeof(T)), "hipMalloc d_data");
    checkCuda(hipMalloc((void**)&d_out, N * sizeof(T)), "hipMalloc d_out");
    checkCuda(hipMemcpy(d_data, &h_data, N*sizeof(T), hipMemcpyHostToDevice), "hipMemcpy d_data");

    int threadsPerBlock = 256;
    int blocksPerGrid = (N + threadsPerBlock - 1) / threadsPerBlock;

    AtomicAddKernel<T><<<blocksPerGrid, threadsPerBlock>>>(d_data, d_out, N);

    checkCuda(hipMemcpy(h_out, d_out, N * sizeof(T), hipMemcpyDeviceToHost), "hipMemcpy h_out");
    checkCuda(hipMemcpy(&h_data, d_data, N * sizeof(T), hipMemcpyDeviceToHost), "hipMemcpy h_data");

    printf("Final value: %f\n", (double)h_data[0]);
    printf("Out array:\n");
    for (int i = 0; i < 32; ++i) {
        printf("out[%d] = %f\n", i, (double)h_out[i]);
    }
    printf("\n");

    checkCuda(hipFree(d_data), "hipFree d_data");
    checkCuda(hipFree(d_out), "hipFree d_out");
    return 0;
}
