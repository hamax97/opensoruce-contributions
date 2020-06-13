# Helpful commands
## Compile in device offloading mode

`export LIBRARY_PATH=/home/htobonm/Workspace/compilers/llvm/builds/debug/libomptarget:$LIBRARY_PATH clang -I/home/htobonm/Workspace/compilers/llvm/builds/debug/projects/openmp/runtime/src -fopenmp -fopenmp-targets=nvptx64-nvidia-cuda -Xopenmp-target -march=sm_61 using_gpu_test.c -o using_gpu_test`

## Recompile optimizer
In the build directory run:

`ninja -j3 -l3 libLLVMipo.so`

## Test optimizer

`OPT=/home/htobonm/Workspace/compilers/llvm/builds/debug/bin/opt`

`$OPT -S -openmpopt < mem_transfer_hiding.ll > /dev/null`

