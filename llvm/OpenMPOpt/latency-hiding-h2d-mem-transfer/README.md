# Helpful commands

* See this [HOWTO](../howto_build.md) for compiling a program with offloading support.
* Recompile IPO module:

      ninja -j3 -l3 libLLVMipo.so

* Test optimizer

      OPT=/home/htobonm/Workspace/compilers/llvm/builds/debug/bin/opt
      $OPT -S -passes=openmpopt < mem_transfer_hiding.ll > /dev/null
      
* Add FileCheck lines to regression test

      <repo-root>/llvm/utils/update_test_checks.py --opt=builds/debug/bin/opt \
      -p --function-signature \
      <repo-root>/llvm/test/Transforms/OpenMP/<file>.ll
      
* Consider passing your tests through `-O3` and the `mem2reg` pass.

