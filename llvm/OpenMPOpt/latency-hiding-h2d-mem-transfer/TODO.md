# Problem to solve.

When we have memory transfers from the host to a device, or any long running (I/O) method that can be split in a begin and wait part, we can try to hide the latency. (For now this is focused on memory transfers in OpenMP target offloading but the scheme should apply to CUDA and other languages as well.)

Given a blocking cross device memory transfer such as blocking_memcpy_host2device(Dst, Src, N), we want to first split it in two parts, the "issue" and the "wait", something like:
handle = async_issue_memcpy_host2device(Dst, Src, N); wait(handle, Dst, Src, N). Then, we want to move the two calls apart, thus causing the issue to be executed earlier and the wait later. There is a chance that the code we can legally move in-between is now executed while the memcpy is performed, effectively reducing the latency. Note that this also works if we start with a async version.

* Determine if we need new API functions (in the OpenMP runtime) to represent the two parts of a blocking memory transfer afte we split it. (Note that the async versions might sufficient or can be extended.) Perform the required action.

* Recognize calls to the APIs that we want to support in the OpenMPOpt pass and identify the memory regions involved.

* Implement an optimization that, given a (set of) instructions and a set of memory ranges, moves the instruction(s) earlier or respectively later in the execution path.

* Try to generalize the optimization and apply it to other use cases, e.g. earlier task issuing.

# Resources

Online compiler (also generates LLVM IR): https://godbolt.org/
