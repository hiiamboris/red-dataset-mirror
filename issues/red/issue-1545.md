
#1545: Red/System Runtime Seg Faults on ARM processors
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/1545>

The Red/System runtime segfaults during initialisation on ARM processors. This affects both Red/System and Red programs.

The segfault appears to occur at line 120 of POSIX.reds:
`__sigaction-options/sigaction: as-integer :***-on-signal`

The following debugging session lead to that conclusion:

Code:

``` Red
Red/System []
print [1 lf]
```

Compiler output:

``` text
-=== Red Compiler 0.5.4 ===- 

Compiling /Users/peter/VMShare/Code/Red-System/test.reds ...

Compiling to native code...
...compilation time : 287 ms
...linking time     : 25 ms
...output file size : 31632 bytes
...output file      : /Users/peter/VMShare/Languages/red/test
```

GDB session:

``` Text
gdb) run
Starting program: /home/pi/test 

Program received signal SIGSEGV, Segmentation fault.
0x00008c6c in posix-startup-ctx/init ()
(gdb) backtrace
#0  0x00008c6c in posix-startup-ctx/init ()
#1  0x00008470 in ***_start ()
#2  0x00008470 in ***_start ()
Backtrace stopped: previous frame identical to this frame (corrupt stack?)
```



Comments:
--------------------------------------------------------------------------------

On 2016-02-16T12:01:22Z, dockimbel, commented:
<https://github.com/red/red/issues/1545#issuecomment-184656112>

    It was a regression caused by the stricter local variable definition checking of Red/System compiler introduced recently.

