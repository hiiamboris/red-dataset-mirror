
#2309: Dividing -2147483648 by -1 gives zero divide exception in Red/System
================================================================================
Issue is closed, was reported by PeterWAWood and has 20 comment(s).
[type.review] [Red/System] [status.wontfix]
<https://github.com/red/red/issues/2309>

Dividing -2147483648 by -1 gives zero divide exception in Red/System on macOS using the latest master (9/11/2016).

Code
```text
Red/System []
-2147483648 / -1
```
Output
```text
-=== Red Compiler 0.6.1 ===- 

Compiling /Users/peter/VMShare/Code/Red-System/test.reds ...

Target: Darwin 

Compiling to native code...
...compilation time : 187 ms
...linking time     : 6 ms
...output file size : 20480 bytes
...output file      : /Users/peter/VMShare/Red/red/../../Code/Red-System/test 


../../Code/Red-System/test

*** Runtime Error 13: integer divide by zero
*** at: 000013B1h
```




Comments:
--------------------------------------------------------------------------------

On 2016-11-09T08:47:44Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2309#issuecomment-259361491>

    I would expect the result of -2147483648 / -1 to be the same as that for -2147483648 \* -1 which is -2147483648.

--------------------------------------------------------------------------------

On 2016-11-09T19:39:24Z, meijeru, commented:
<https://github.com/red/red/issues/2309#issuecomment-259505789>

    I think you mean that you expect the result to be positive :smile:

--------------------------------------------------------------------------------

On 2016-11-09T22:29:16Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2309#issuecomment-259545429>

    > On 10 Nov 2016, at 03:39, Rudolf Meijer notifications@github.com wrote:
    > 
    > I think you mean that you expect the result to be positive 😄
    > 
    > No Rudolf. As integer’s are ordinal in Red/System, I do expect the negative number. This is based on their ordinality rather than mathematical correctness. With Red/System integers the next number after 2147483647 is -2147483648. :-)
    
    Regards
    
    Peter

--------------------------------------------------------------------------------

On 2016-11-10T01:18:05Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2309#issuecomment-259575516>

    Just to confirm the expected behaviour. This is the same calculation performed in C.
    
    Code
    
    ``` C
    #include <stdio.h>
    
    int main(int argc, const char * argv[]) {
    
        int32_t i = -2147483648 / -1;
        printf("-2147483648 / -1 = %d\n", i);
    
        return 0;
    }
    ```
    
    Result
    
    ``` text
    -2147483648 / -1 = -2147483648
    ```

--------------------------------------------------------------------------------

On 2016-11-11T08:52:20Z, meijeru, commented:
<https://github.com/red/red/issues/2309#issuecomment-259910630>

    But since 2147483648 cannot be represented as a 32 bit quantity, the result of the computation should be math overflow, if you ask me. And it does so in Red for Windows.
    I note in passing that in Red, 2 *\* 32 = 0 and 2 *\* 31 = -2147483648, both of which are non-intuitive.
    In R2, both results are automatically converted to decimal! (Red: float!).

--------------------------------------------------------------------------------

On 2016-11-11T10:29:49Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2309#issuecomment-259928630>

    In Red/System there is currently no way to trap runtime errors. Protecting against a zero divide exception by checking the divisor is not zero is straight forward. Checking for integer overflow before performing an operation would be quite complicated.
    
    One issue with -2147483648 / -1 raising a zero divide error is that to avoid the possibility of dividing by zero you must check that the divisor is not zero and also if the divisor is -1 then the dividend is not -2147483648.

--------------------------------------------------------------------------------

On 2016-11-14T01:55:57Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2309#issuecomment-260231603>

    The C compiler (clang via Xcode) that I used to check the results was 64 bit. It looks as though it was performing the division with 64 bit integers and then happily converting the 64 bit result (2147483648) to 32 bits (-2147483648).
    
    I compiled and ran this code on a 32-bit machine with gcc and got an overflow exception when dividing the literal -2147483648 by -1.
    
    ``` c
    #include <stdio.h>
    
    int main(int argc, const char * argv[]) {
    
        int i = -2147483648;
        int j = -1;
        int k = i * j;
        printf("-2147483648 * -1 = %d\n", k);
        printf("-2147483648 / -1 = %d\n", -2147483648 / -1);
        int m = i / j;
        printf("-2147483648 / -1 = %d\n", m);
    
        return 0;
    }
    ```

--------------------------------------------------------------------------------

On 2016-11-14T02:00:11Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2309#issuecomment-260231975>

    The reason I am concerned about this issue is that in order to divide integers safely, you would need to use this pattern for all divisions:
    
    ```
    if not any [
        divisor = 0
       all [
           dividend = -2147483648
           divisor = -1
    ][
        result: dividend / divisor
    ]
    ```

--------------------------------------------------------------------------------

On 2017-02-22T07:44:37Z, dockimbel, commented:
<https://github.com/red/red/issues/2309#issuecomment-281593567>

    On Windows, I get:
     `*** Runtime Error 14: integer overflow`
     while on macOS, I get:
     `*** Runtime Error 13: integer divide by zero`.

--------------------------------------------------------------------------------

On 2017-02-22T09:40:36Z, dockimbel, commented:
<https://github.com/red/red/issues/2309#issuecomment-281618496>

    I can reproduce the same runtime error with the following C code, using VisualStudio: 
    ```
    #include <stdarg.h>
    #include <stdio.h>
    
    int main(int argc, char const *argv[]) {
        register long a = 0x80000000;      // -2147483648
        register long b = 2 - 3;
        register long i = a / b;
        printf("-2147483648 / -1 = %d\n", i);
        return 0;
    }
    ```
    ![image](https://cloud.githubusercontent.com/assets/411393/23205566/4dbc761e-f925-11e6-8d3f-a92a5fd8b83c.png)
    
    Though, it passes silently using Xcode on macOS, returning a wrong result.
    
    There is nothing we can do about that, there is no way to mask that exception on x86, nor any acceptable way to prevent it. Red generates similar code as C (using CSQ + IDIV), which is the fastest and most accurate we can have. Moreover, stopping with an exception is always better than letting a wrong result pass, so we'll keep it as is for now, unless we can find a better option (very doubtful).

