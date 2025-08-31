
#3672: Dividing -2147483648 by -1 in Red/System raises zero divide runtime exception 
================================================================================
Issue is closed, was reported by PeterWAWood and has 10 comment(s).
[status.resolved] [type.review] [Red/System]
<https://github.com/red/red/issues/3672>

**Describe the bug**
Dividing -2147483648 by -1 in Red/System raises zero divide runtime exception 

**To reproduce**
Compile and run the following program:
```text
Red/System []
print [ -2147483648 / -1 lf ]
```
**Expected behavior**
-2147483648 / -1 => -2147483648 (2147483648 after overflow)

The following C program prints -2147483648 (compiled with clang).
```c
#include <stdio.h>

int main(int argc, const char * argv[])
{
    int i = -2147483648 / -1;
    printf("%d\n", i);
    return 0;
}
```
**Platform version (please complete the following information)**
```
macOS 10.12.6
Red commite2b9c16c7aa4adadd90c0a73f90d8b5a975b2a1a
```



Comments:
--------------------------------------------------------------------------------

On 2018-12-21T00:31:22Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3672#issuecomment-449187263>

    The gcc compiler also gives the expected result. It does give a warning message that may explain why it does:
    ```text
    divide.c:5:25: warning: implicit conversion from 'long' to 'int' changes value
          from 2147483648 to -2147483648 [-Wconstant-conversion]
        int i = -2147483648 / -1;
            ~   ~~~~~~~~~~~~^~~~
    1 warning generated.
    ```

--------------------------------------------------------------------------------

On 2018-12-21T01:13:15Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3672#issuecomment-449199284>

    I updated the C program so that the constants were explicitly declared as `int`. It then gives a zero-divide exception.
    
    Code
    ```c
    int main(int argc, const char * argv[])
    {
        int j = -2147483648;
        int k = -1;
        int i =  j / k;
        printf("%d\n", i);
        return 0;
    }
    ```
    Result via Clang:
    ```text
    Thread 1: EXC_ARITHMETIC (code=EXC_I386_DIV, subcode=0x0)
    ```
    Result via gcc:
    ```text
    Floating point exception: 8
    ```
    It seems to be a problem with Intel processors. I will try to run the same code on an ARM processor to see what result I get.
    
    This is very frustrating as it means that to write "safe" divisions in Red/System, you not only have to test for a zero divisor but test if -2147483648 is being divided by -1.
    
    Perhaps all that can be done is to add a warning in the Red/System docs.

--------------------------------------------------------------------------------

On 2018-12-21T03:11:11Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3672#issuecomment-449226852>

    I complied and ran the program which declares the constants as int on an ARM processor. It correctly printed -2147483648.

--------------------------------------------------------------------------------

On 2018-12-22T03:53:26Z, dockimbel, commented:
<https://github.com/red/red/issues/3672#issuecomment-449542799>

    I prefer a runtime exception to a silent wrong math result. There is no workaround for the safe version, either the user does the checks or the compiler adds checks to every division, slowing them down significantly.

--------------------------------------------------------------------------------

On 2019-01-08T07:49:48Z, dockimbel, commented:
<https://github.com/red/red/issues/3672#issuecomment-452205046>

    Added note in the documentation.

