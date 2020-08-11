# Dependencies
0. Please read everything carefully. Don't skip any step.
1. Use the Python 3 interpreter provided by conda. It avoids some errors.

       conda activate
 
2. `llvm-lit`, tool used to run test suites.

       pip install lit

3. Try using the `cmake` that can be installed with `conda`, it prevents some warnings.

4. Packages:

       sudo apt install cmake ccache python3-dev valgrind libelf-dev libffi-dev liblzma-dev swig lua5.3 texi2html

5. `Binutils`. This is needed for the `Interprocedural Optimizations` module `IPO`, specially the `gold` linker.
If you are not developing, this might not be needed.

       git clone --depth 1 git://sourceware.org/git/binutils-gdb.git binutils
 
    The include directory, `bintuils/include`, is needed later. Also, if you don't have the `ld.gold` binary
    with support for plugins, that is, support for the flag `-plugin`, compile it:

       cd binutils
       mkdir build && cd build
       ../configure --enable-gold --enable-plugins --disable-werror
       make -j3 all-gold
       
    Place the `ld-new` binary in `/usr/bin/ld.gold`. Read: https://llvm.org/docs/GoldPlugin.html.

6. To enable OpenMP with device offloading support you MUST compile with `clang` and `clang++`.
So first compile Clang.

# Configuration and Installation of Clang and LLVM

1. Download the source code:

       git clone https://github.com/llvm/llvm-project.git llvm
       cd llvm
       
   If you want a `release build`, that is, not for development, run:

       git checkout release/10.x

   ---
   **NOTE**
    
   If building on release mode, use the latest STABLE release. As of June 2020 it is 10.x.

   ---
    
2. Create the build directory and set the following variables:

       mkdir build && cd build
       
       INSTALL_DIR=<installation/path>
       BINTUILS=<path/to/binutils>/include
       PROJECTS_TO_BUILD="clang;clang-tools-extra;compiler-rt"
       TARGETS_TO_BUILD="X86;AMDGPU;NVPTX"   # If you don't have GPU only use X86
       SHARED_LIBS=ON                        # If using a Release build and don't have enough storage, use OFF.
       PROJECT_DIR=<llvm-repo-root>/llvm
       GENERATOR=Ninja                       # Or "Unix Makefiles" for make.
       
3. For `Debug` builds also set these variables:
   
       # If working on OpenMP interprocedural optimizations:
       #  - The c and c++ compilers must be clang and clang++
       CC=<path/to/c/compiler>
       CXX=<path/to/c++/compiler>
       
       BUILD_TYPE=Debug
       CCACHE_MAXSIZE=100G
       CCACHE_DIR=<installation/path>/ccache     # It can be any path.
       
       # Use this variable in the configure.
       SPECIFIC_BUILD_FLAGS="-DCMAKE_BUILD_TYPE=$BUILD_TYPE
         -DCMAKE_C_COMPILER=$CC -DCMAKE_CXX_COMPILER=$CXX 
         -DLLVM_CCACHE_BUILD=ON -DLLVM_CCACHE_MAXSIZE=$CCACHE_MAXSIZE
         -DLLVM_CCACHE_DIR=$CCACHE_DIR"
         
   For `Release` builds set these variables:
   
       BUILD_TYPE=Release
       
       # Use this variable in the configure.
       SPECIFIC_BUILD_FLAGS="-DCMAKE_BUILD_TYPE=$BUILD_TYPE"
       
4. Configure:

       cmake -G $GENERATOR -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
       -DLLVM_TARGETS_TO_BUILD=$TARGETS_TO_BUILD \
       -DLLVM_ENABLE_PROJECTS=$PROJECTS_TO_BUILD \
       -DLLVM_BINUTILS_INCDIR=$BINUTILS \
       -DBUILD_SHARED_LIBS=$SHARED_LIBS \
       -DLLVM_USE_PERF=ON -DLLVM_OPTIMIZED_TABLEGEN=ON \
       $SPECIFIC_BUILD_FLAGS \ 
       $PROJECT_DIR 2>&1 | tee release_configure.log

   Note that OpenMP is not being built because to enable  *target offloading* it must be compiled with clang. 
   See below. So compile clang, then compile omp.

3. Compile:

       cmake --build . -- -j6

   If the linking process eats up all your RAM try using 2 or 1 parallel processes, that is, use `-j2`.
   Test your installation:

       [ninja|make] check    # Whatever you chose as generator.

4. Only if `Release` build. Install:

       cmake --install .

   Make sure a new file called `llvm.conf` was created in `/etc/ld.so.conf.d/` containing the proper path to 
   `$LLVM_INSTALL/lib`. Otherwise, create it and add the path, to reload the ld configuration run:

       sudo ldconfig

## Add support for OpenMP device offloading

1. Important notes.
   * Follow the previous steps.
   * Offloading is only supported if the `openmp` project is compiled with Clang. So compile it first.
   * Make sure `libelf` and `libffi` are installed.
   * Make sure the *cuda driver* and *cuda toolkit* are installed.
   * Some of the variables used here are for the Nvidia GPU GTX 1050.
   * Check out these links for understanding of some flags and post-installation usage.

      - https://arnon.dk/matching-sm-architectures-arch-and-gencode-for-various-nvidia-cards/
      - https://freecompilercamp.org/llvm-openmp-build/

2. Go to the `build` directory used in the previous steps and run:

       mkdir projects/openmp && cd projects/openmp
       
3. Define the following variables:
   
       OMP_PROJECT_DIR=<llvm-repo-root>/openmp
       CC=<path/to/binary/clang>               # Preferably a Clang release, it will be faster.
       CXX=<path/to/binary/clang++>            # Preferably a Clang++ release, it will be faster.
       GPU_ARCH=sm_61                          # Pascal architecture.
       GPU_COMPUTE_CAPABILITIES=61             # Compute capability of GTX 1050.
       USE_DEBUGGER=OFF                        # Set to ON if Debug mode.
       
       # For some reason, when installing, this binary (llvm-lit) is not installed. So, this is needed.
       export PATH=<where-you-built-llvm-and-clang>/bin:$PATH
       
4. Configure:

       cmake -G $GENERATOR -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
       -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
       -DCMAKE_C_COMPILER=$CC -DCMAKE_CXX_COMPILER=$CXX \
       -DCLANG_OPENMP_NVPTX_DEFAULT_ARCH=$GPU_ARCH \
       -DLIBOMPTARGET_NVPTX_COMPUTE_CAPABILITIES=$GPU_COMPUTE_CAPABILITIES \
       -DLIBOMP_USE_DEBUGGER=$USE_DEBUGGER \
       $OMP_PROJECT_DIR 2>&1 | tee openmp_configure.log

5. Compile:

       cmake --build . -- -j6
       
   Then test:
   
       [ninja|make] check

6. Only if in `Release` mode, install:

       cmake --install .
       
7. When compiling a program with offloading support you need to add the OpenMP
`libomptarget` library folder and the include directory where `omp.h` ended up.

   If in `Debug` mode:

       build/projects/openmp/libomptarget/    # The libraries libomptarget.*
       build/projects/openmp/runtime/src/     # The header files omp.h

   If in `Release` mode:
   
        $INSTALL_DIR/lib       # The libraries libomptarget.*
        $INSTALL_DIR/include   # The header files omp.h
        
   Also, set the variable `LIBRARY_PATH` to `$INSTALL_DIR/lib` or
   `build/projects/openmp/libomptarget`. Then compile:
   
       # A normal program.
       clang -I <path-to-dir-with-omp.h> -O3 \
       -fopenmp -fopenmp-targets=nvptx64-nvidia-cuda \
       -Xopenmp-target -march=sm_61 \        # These might not be needed, or might be different.
       <program>.c -o <exe-with-offload-support>
       
   If you want to see the temporary files (LLVM IR, preprocessing stage, assembly, ...).
   Perhaps what you want to see is the generated `<program>-host-x86_64-unknown-linux-gnu.ll`.
   
       clang -I <path-to-dir-with-omp.h> -save-temps -g0 -O3 -S -emit-llvm \
       -fopenmp -fopenmp-targets=nvptx64-nvidia-cuda \
       -Xopenmp-target -march=sm_61 \        # These might not be needed, or might be different.
       <program>.c -o <llvm-ir-that-uses-cuda-runtime>
        
### Troubleshoot
* If when building there is an error about the GCC version, make a symbolic link in
`/usr/bin/gcc` to the requested version. For example, it complains that does not support
GCC greather than 8, therefore, use GCC 8.

      ln -s /usr/bin/gcc-8 /usr/bin/gcc
