# Dependencies

* Make sure the cuda driver and cuda toolkit are installed.
* Use the Python 3 interpreter provided by conda. It avoids some errors.

   `conda activate`

* Try using the `cmake` that can be installed with `conda`, it prevents some warnings.

* Packages:

   `sudo apt install cmake ccache python3-dev python3-sphinx valgrind libelf-dev libffi-dev liblzma-dev swig lua5.3`

   It avoids some errors installing `sphinx` in the global environment instead of in conda.

* Binutils: Specifically the Gold linker for IPO support. Read: https://llvm.org/docs/GoldPlugin.html

  `git clone --depth 1 git://sourceware.org/git/binutils-gdb.git binutils`

* To enable OpenMP with offloading support you MUST compile with `clang` and `clang++`. So first compile Clang.

# Release
## Configuration and Installation of Clang and LLVM

1. From the root directory of the LLVM's repository run:

   `git checkout release/9.x`

   *IMPORTANT:* Use the latest STABLE release.

2. Create the build directory and configure:

   `mkdir builds/release/9.x && cd builds/release/9.x`

   `cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/htobonm/apps/llvm/release/9.x -DLLVM_TARGETS_TO_BUILD="X86;AMDGPU;NVPTX" -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;compiler-rt;parallel-libs" -DLLVM_BINUTILS_INCDIR=/home/htobonm/Apps/binutils/include -DLLVM_USE_PERF=ON -DLLVM_BUILD_DOCS=ON -DSPHINX_WARNINGS_AS_ERRORS=OFF -DLLVM_OPTIMIZED_TABLEGEN=ON -DLLVM_CCACHE_BUILD=ON -DLLVM_CCACHE_MAXSIZE=0 -DLLVM_CCACHE_DIR=/opt/htobonm/workspace/compilers/llvm/builds/ccache/release/9.x /home/htobonm/Workspace/compilers/llvm/llvm 2>&1 | tee release_configure.log`

   Note that OpenMP is not being built because to enable target offloading with clang it must be compiled with clang. See below. So compile clang, then compile omp.

3. Compile:

   `make -j6`

   If the linking process eats up all the RAM try using 2 or 1 parallel process, that is, use `-j2`.
   Test your installation:

   `make check`

4. Install:

  `make install`

   Make sure a new file called `llvm.conf` was created in `/etc/ld.so.conf.d/` containing the proper path to `$LLVM_INSTALL/lib`. Otherwise, create it and add the path, to reload the ld configuration run:

   `sudo ldconfig`

## Configuration and Installation of OpenMP with offloading support

1. Importante notes.
   * Offloading is only supported if compiled with Clang.
   * Make sure libelf and libffi are installed.
   * Check out these links for understanding of some flags and post-installation usage.

      - https://arnon.dk/matching-sm-architectures-arch-and-gencode-for-various-nvidia-cards/
      - https://freecompilercamp.org/llvm-openmp-build/

2. Inside the `build/release/9.x` directory run:

   `mkdir -p projects/openmp && cd projects/openmp`

3. Configure. Can use the same directory where the Clang/LLVM build was made.

   `cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/htobonm/apps/llvm/release/9.x -DCMAKE_C_COMPILER=/opt/htobonm/apps/llvm/release/9.x/bin/clang -DCMAKE_CXX_COMPILER=/opt/htobonm/apps/llvm/release/9.x/bin/clang++ -DCLANG_OPENMP_NVPTX_DEFAULT_ARCH=sm_61  -DLIBOMPTARGET_NVPTX_COMPUTE_CAPABILITIES=61 /home/htobonm/Workspace/compilers/llvm/openmp 2>&1 | tee release_openmp_configure.log`

3. Compile:

   `make -j6`

4. Install:

   `make install`

# Debug
## Configuration and Installation of Clang and LLVM

1. From the root directory of the LLVM's repository run:

   `git checkout master`

   *IMPORTANT:* Use the latest release, which is in the master branch.

2. Create the build directory and configure:

        mkdir builds/debug && cd builds/debug

        INSTALL_DIR=/opt/htobonm/apps/llvm/debug

        CC=/opt/htobonm/apps/llvm/release/10.x/install/bin/clang

        CXX=/opt/htobonm/apps/llvm/release/10.x/install/bin/clang++

        BINUTILS=/home/htobonm/Apps/binutils/include

        CCACHE_DIR=/opt/htobonm/apps/llvm/debug/ccache

        CCACHE_MAXSIZE=100G

        PROJECT_ROOT=/home/htobonm/Workspace/compilers/llvm/llvm

        cmake -G Ninja -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR -DLLVM_TARGETS_TO_BUILD="X86;AMDGPU;NVPTX"
        -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;compiler-rt" -DCMAKE_C_COMPILER=$CC -DCMAKE_CXX_COMPILER=$CXX
        -DBUILD_SHARED_LIBS=ON -DLLVM_BINUTILS_INCDIR=$BINUTILS -DLLVM_USE_PERF=ON -DLLVM_OPTIMIZED_TABLEGEN=ON
        -DLLVM_CCACHE_BUILD=ON -DLLVM_CCACHE_MAXSIZE=$CCACHE_MAXSIZE -DLLVM_CCACHE_DIR=$CCACHE_DIR
        $PROJECT_ROOT 2>&1 | tee debug_configure.log

    Note that OpenMP is not being built because to enable target offloading with clang it must be compiled with clang. See below. So compile clang in Release mode, then compile omp.

3. Compile:

        ninja -j6 -l6

   If the linking process eats up all the RAM try using 2 or 1 parallel process, that is, use `-j2`.
   Test your installation, run all the checks:

        ninja -j6 check-all

   Run the necessary (specific) checks.

        ninja help | grep check

4. Do NOT install, it should be compiled only for debugging purposes.

## Configuration and Installation of OpenMP with offloading support

1. Importante notes.
   * Offloading is only supported if compiled with Clang.
   * Make sure libelf and libffi are installed.
   * Check out these links for understanding of some flags and post-installation usage.

      - https://arnon.dk/matching-sm-architectures-arch-and-gencode-for-various-nvidia-cards/
      - https://freecompilercamp.org/llvm-openmp-build/

2. Inside the `build/debug` directory run:

        mkdir -p projects/openmp && cd projects/openmp

3. Configure.

        PROJECT_ROOT=/home/htobonm/Workspace/compilers/llvm/openmp

        cmake -G Ninja -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR -DCMAKE_C_COMPILER=$CC
        -DCMAKE_CXX_COMPILER=$CXX -DCLANG_OPENMP_NVPTX_DEFAULT_ARCH=sm_61  -DLIBOMPTARGET_NVPTX_COMPUTE_CAPABILITIES=61
        -DLIBOMP_USE_DEBUGGER=ON $PROJECT_ROOT 2>&1 | tee debug_openmp_configure.log

4. Compile:

        make -j6

5. Do NOT install, it should be compiled only for debugging purposes.

6. When compiling with offloading support add the library and include directories. For the library:

        builds/debug/projects/openmp/libomptarget

   and the include directory:

        builds/debug/projects/openmp/runtime/src/include
