
#1751: Red/System dylib test fails with illegal instruction on Linux ARM sf
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/1751>

The output from the test, with both the test and the dylibs compiled with the debug option, is:

```
~/arm-tests/system $ ./dylib-auto-test
~~~started test~~~ Auto-generated dylib tests

*** Runtime Error 17: illegal instruction
*** Cannot determine source file/line info.
***

*** Runtime Error 1: access violation
*** in file: /Users/peter/VMShare/Languages/red/system/runtime/debug.reds
*** at line: 139
***
***   stack: __print-debug-stack BECFF600h
***   stack: ***-on-quit 17 -1093667328
***   stack: posix-startup-ctx/***-on-signal 4 BECFF280h BECFF300h
Segmentation fault
```

gdb showed this:

```
(gdb) run
Starting program: /home/pi/arm-tests/system/dylib-auto-test 
~~~started test~~~ Auto-generated dylib tests

Program received signal SIGILL, Illegal instruction.
0xbefff5d0 in ?? ()
(gdb) backtrace
#0  0xbefff5d0 in ?? ()
Cannot access memory at address 0x0
#1  0xbefff5cc in ?? ()
Cannot access memory at address 0x0
#2  0xbefff5cc in ?? ()
Cannot access memory at address 0x0
Backtrace stopped: previous frame identical to this frame (corrupt stack?)
```



