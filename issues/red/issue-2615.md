
#2615: Compiled code crashes wine
================================================================================
Issue is closed, was reported by maximvl and has 2 comment(s).
<https://github.com/red/red/issues/2615>

If you compile & run this snippet:
https://gist.github.com/maximvl/81f31f26b49a7a3a5891b9a63f47171a

and click `run` button it will crash with:
```
> wine haiku.exe 
fixme:dwmapi:DwmIsCompositionEnabled 0x32fdc8
*** Error in GetClassInfoEx

*** Runtime Error err:seh:raise_exception Unhandled exception code c0000005 flags 0 addr 0x414b00
```

It crashes on Windows as well.


Comments:
--------------------------------------------------------------------------------

On 2018-03-17T09:42:19Z, dockimbel, commented:
<https://github.com/red/red/issues/2615#issuecomment-373907522>

    It compiles and works fine with Windows 7 and latest commit.

