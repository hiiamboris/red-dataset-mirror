
#3999: Callback function returns struct value causes crashes on macOS
================================================================================
Issue is closed, was reported by qtxie and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/3999>

**To reproduce**
1. Compile the following C code as a dylib on macOS.
testc.c
`clang -dynamiclib -arch i386 ~/Downloads/testc.c -o libtestc.dylib`
```
#include <stdio.h>

typedef struct {
    float x;
    float y;
    float w;
    float h;
} MyRect;

static int* callback_func;

extern void set_callback(int* ptr) {
    callback_func = ptr;
}

extern int test_callback() {
    MyRect (*p)() = (MyRect (*)())callback_func;
    MyRect rc = p();
    printf("%f", rc.x);
    return 0;
}

```
2. Compile the following Red/System file.
testrs.reds
```
Red/System []

#import [
	"libtestc.dylib" cdecl [
        set_callback: "set_callback" [ptr [int-ptr!]]
        test_callback: "test_callback" [return: [integer!]]
    ]
]

MyRect!: alias struct! [
    x   [float32!]
    y   [float32!]
    w   [float32!]
    h   [float32!]
]

callback-func: func [
    [cdecl]
    return: [MyRect! value]
    /local
        rc  [MyRect! value]
][
    rc/x: as float32! 23.0
    rc/w: as float32! 123.0
    rc
]

test: func [][
    set_callback as int-ptr! :callback-func
    test_callback
]

test
```
3. Put those two files in the same folder and run `testrs`.

It crashes as below:
```
*** Runtime Error 32: segmentation fault
*** at: A7AA6BD0h
```

**Expected behavior**
print 23.000000 in the terminal.

**Platform version (please complete the following information)**
```
macOS 10.14, latest Red version in master branch.
```
Here are the pre-built binaries:
[prebuilt-test.zip](https://github.com/red/red/files/3521519/prebuilt-test.zip)




Comments:
--------------------------------------------------------------------------------

On 2019-08-20T14:23:36Z, qtxie, commented:
<https://github.com/red/red/issues/3999#issuecomment-523038635>

    FYI. It works well on Linux.

--------------------------------------------------------------------------------

On 2019-09-01T15:48:28Z, dockimbel, commented:
<https://github.com/red/red/issues/3999#issuecomment-526929773>

    The issue is caused by CLang injecting an extra stack slot pop/push when it is not needed at all (probably a consequence of an internal CLang compiler limitation):
    
    ![image](https://user-images.githubusercontent.com/411393/64078870-a2f1b180-cce0-11e9-8611-2d02e8f0d421.png)
    
    
    C code used to load and invoke the dynamic library:
    ```C
    #include <stdio.h>
    
    typedef struct {
        float x;
        float y;
        float w;
        float h;
    } MyRect;
    
    static int* callback_func;
    
    extern void set_callback(int* ptr) {
        callback_func = ptr;
    }
    
    extern int test_callback() {
        MyRect (*p)() = (MyRect (*)())callback_func;
        MyRect rc = p();
        printf("%f", rc.x);
        return 0;
    }
    ```
    Compiled with:
    ```shell
    clang -arch i386 testrc.c -o testrc libtestc.dylib
    ```

