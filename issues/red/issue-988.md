
#988: Compiling DLL with RPi Target crashes the compiler
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/988>

The testfile Red/system/tests/source/units/libtest-dll2.reds successfully compiles with Windows and Darwin targets but crashes when the target is RPi.

```
Schulz:tests peter$ rebol -sc /Users/peter/VMShare/Languages/Red/red.r -dlib  -t RPi -o /c/Users/peter/VMShare/Languages/Red/quick-test/runnable/arm-tests/system/libtest-dll2 /Users/peter/VMShare/Languages/Red/system/tests/source/units/libtest-dll2.reds

-=== Red Compiler 0.4.3 ===- 

Compiling /Users/peter/VMShare/Languages/Red/system/tests/source/units/libtest-dll2.reds ...

Compiling to native code...
*** Red/System Compiler Internal Error: Script Error : emit-push-float expected type argument of type: block 
*** Where: emit-prolog 
*** Near:  [emit-push-float fargs-nb - freg arg/1] 
```



