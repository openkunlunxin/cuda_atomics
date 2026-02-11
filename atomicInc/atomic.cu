#include <stdio.h>
#include <iostream>
#include <cuda_runtime.h>

#define VALUE 33

#ifndef DATA_TYPE
#define DATA_TYPE int
#endif

inline void checkCuda(cudaError_t err, const char* msg = "") {
    if (err != cudaSuccess) {
        std::cerr << "CUDA error";
        if (msg && msg[0]) std::cerr << " (" << msg << ")";
        std::cerr << ": " << cudaGetErrorString(err) << std::endl;
        exit(EXIT_FAILURE);
    }
}

template <typename T>
__global__ void AtomicAddKernel(T* data, T* out, int N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < N) {
        T old = atomicInc(&data[0], (T)VALUE);
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

    checkCuda(cudaMalloc((void**)&d_data, N * sizeof(T)), "cudaMalloc d_data");
    checkCuda(cudaMalloc((void**)&d_out, N * sizeof(T)), "cudaMalloc d_out");
    checkCuda(cudaMemcpy(d_data, &h_data, N*sizeof(T), cudaMemcpyHostToDevice), "cudaMemcpy d_data");

    int threadsPerBlock = 256;
    int blocksPerGrid = (N + threadsPerBlock - 1) / threadsPerBlock;

    AtomicAddKernel<T><<<blocksPerGrid, threadsPerBlock>>>(d_data, d_out, N);

    checkCuda(cudaMemcpy(h_out, d_out, N * sizeof(T), cudaMemcpyDeviceToHost), "cudaMemcpy h_out");
    checkCuda(cudaMemcpy(&h_data, d_data, N * sizeof(T), cudaMemcpyDeviceToHost), "cudaMemcpy h_data");

    printf("Final value: %f\n", (double)h_data[0]);
    printf("Out array:\n");
    for (int i = 0; i < 32; ++i) {
        printf("out[%d] = %f\n", i, (double)h_out[i]);
    }
    printf("\n");

    checkCuda(cudaFree(d_data), "cudaFree d_data");
    checkCuda(cudaFree(d_out), "cudaFree d_out");
    return 0;
}
