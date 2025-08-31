URL: <https://github.com/red/red/discussions/5629>
Date created: 2025-06-29T17:24:20Z

# FIX: Compilation fails with `cannot enable executable stack as shared object requires` message

This is some incompatibility bug between ancient Rebol 2 and your modern OS.

Example:
```
-=== Red Compiler 0.6.6 ===-

Compiling /root/hello.red ...
*** Driver Internal Error: Script Error : Library error: /root/.red/crush-2025-6-18-42747.so: cannot enable executable stack as shared object requires: Invalid argument
*** Where: build-compress-lib
*** Near: [crush-lib: load/library filename
crush-compress: make
```
To fix this you have to disable executable stack for `crush.so`:
1. Install a package named `execstack`
2. Run `execstack -c /root/.red/crush*.so` (replace with the actual path)

After that compilation should work as expected.

## Comments


