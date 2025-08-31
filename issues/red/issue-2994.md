
#2994: libRed for Android
================================================================================
Issue is closed, was reported by honix and has 4 comment(s).
<https://github.com/red/red/issues/2994>

It is possible to build ```libRed.so``` for Android?

In other words how to properly cross-compile libRed?

Any directives like ```red-063.exe -t Android build libRed``` or ```red-063.exe build libRed -t Android``` seems not to work. Same for ```-t Linux```.

I'm done it like this, and this one works:
```red-063.exe -t Linux -dlib -o libRed.so libRed/libRed.red``` 

But for android i caught some errors:
```
> red-063.exe -t Android -dlib -o libRed.so libRed/libRed.red

-=== Red Compiler 0.6.3 ===-

Compiling D:\MilkyWay\Programming\red\libRed\libRed.red ...
...compilation time : 1343 ms

Target: Android

Compiling to native code...
*** Warning: OS_TYPE macro in R/S is redefined
*** Compilation Error: undefined symbol: red/platform/prin-2hex*
*** in file: %/D/MilkyWay/Programming/red/utils.reds
*** in function: prin-molded-byte
*** at line: 40
*** near: [red/platform/prin-2hex* i prin-byte #")"]
``` 
Looks like its just not ready yet.


Comments:
--------------------------------------------------------------------------------

On 2017-10-22T04:22:25Z, simulanics, commented:
<https://github.com/red/red/issues/2994#issuecomment-338450346>

    After you've built libRed on your current system, there is a libRed folder containing the libRed source. Compile the libRed.red file.
    (I rename the red exe to red)
    
    ./red -t Android ./libRed/libRed.red

--------------------------------------------------------------------------------

On 2017-10-22T04:23:22Z, simulanics, commented:
<https://github.com/red/red/issues/2994#issuecomment-338450378>

    **Closed**

