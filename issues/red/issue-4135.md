
#4135: [R/S] system/stack/allocate does not work properly on Windows
================================================================================
Issue is closed, was reported by qtxie and has 2 comment(s).
[status.deferred] [type.review]
<https://github.com/red/red/issues/4135>

**Describe the bug**
Complie and run the code below, it crashes silently.
```
Red/System []
test: func [/local p [int-ptr!]][
    p: system/stack/allocate 1024 * 8	;-- allocate 32KB on stack
    ?? p
]
test
```
The reserved stack size is 1MB on Windows according to this line: https://github.com/red/red/blob/master/system/formats/PE.r#L777 . The code above should work.

The initial commit size is 20KB, seems `system/stack/allocate` doesn't expand the commit size.

**Platform version (please complete the following information)**
```
Windows 10 64bit, lastest Red.
```



Comments:
--------------------------------------------------------------------------------

On 2019-11-24T09:16:30Z, qtxie, commented:
<https://github.com/red/red/issues/4135#issuecomment-557870999>

    We can defer it as there is a simple workaround, just allocate less than a page each time.
    
    FYI: https://metricpanda.com/rival-fortress-update-45-dealing-with-__chkstk-__chkstk_ms-when-cross-compiling-for-windows/
    https://github.com/ziglang/zig/blob/master/lib/std/special/compiler_rt/stack_probe.zig#L4

