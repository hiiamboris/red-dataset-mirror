
#3860: libRed crash on macOS
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/3860>

**Describe the bug**
On 64-bit macOS, running C application linked with libRed results in access violation. (see [this](https://gitter.im/red/help?at=5cc036cf4b4cb471d94b7890) chat for reference).

**To reproduce**
1. Build libRed
```
red build libRed
```
2. Prepare C code
```C
#include "libRed/red.h"
int main(){
    redOpen();
    redDo("print {Hello, World!}");
    redClose();
    return 0;
}
```
3. Link
```shell
gcc bug.c -lRed -L. -m32 -o bug
```
4. Execute

**Expected behavior**
I expect compiled binary to be fully functional. e.g. on 64-bit Linux Mint everything works silky smooth.

**Platform version (please complete the following information)**
Latest, crash was observed on macOS High Sierra.



Comments:
--------------------------------------------------------------------------------

On 2019-04-28T15:14:43Z, rcqls, commented:
<https://github.com/red/red/issues/3860#issuecomment-487388296>

    This is the output of the example provided above by @9214 running on macOS Sierra.
    ```
    $ red build libRed
    $ gcc test.c -lRed -L. -m32 -o test
    $ ./test
    
    *** Runtime Error 1: access violation
    *** at: 00221492h
    ```
    
    @9214 Suspecting that this bug is related to View stuff, I prepared a `red-gtk` binary (same than `red`  binary but with View/GTK activated). And I can reproduce a failure in such case.
    
    ```
    $ red-gtk build libRed
    $ gcc -o test-linux -lred  -m32 -L. test.c
    $ LD_LIBRARY_PATH=. ./test-linux
    GTK VERSION: 3.22.11
    
    *** Runtime Error 1: access violation
    *** at: B7724D48h
    ```
    Notice that I confirm that it works with the official  `red-064` binary.
    
    Also, just tested on macOS Mojave on another laptop and it is mentioned that i386 is now deprecated.

