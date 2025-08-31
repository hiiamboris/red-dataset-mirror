
#682: Encapped #include duplicate checking broken
================================================================================
Issue is closed, was reported by kealist and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/682>

The encapped version's seems to not be detecting duplicate #include statements when one is in #system-global directive. 
# 
# TEST.RED:

```
Red[]

#system-global[
    #include %test-include.reds
    #include %test-include2.reds
]
```
# 
# TEST-INCLUDE.REDS:

```
Red/System[]

#include %test-include2.reds
```
# 
# TEST-INCLUDE2.REDS:

```
Red/System[]

date!: alias struct! [
    second                      [integer!]  ; 0-61 (60?)
]
```
# 
# Compiling:

```
V:\rebol\bindings\JSON\examples>red-13feb14-9386b74.exe -c test.red

-=== Red Compiler 0.4.1 ===-

Compiling /V/rebol/bindings/JSON/examples/test.red ...
...compilation time:     264 ms

Compiling to native code...
*** Compilation Error: alias name already defined as: [struct! [
        second [integer!]
    ]]
*** in file: %test-include2.reds
*** at line: 3
*** near: [
    date!: alias struct! [
        second [integer!]
    ]
    #script %test-include2.reds
]
```



Comments:
--------------------------------------------------------------------------------

On 2014-02-19T01:14:58Z, kealist, commented:
<https://github.com/red/red/issues/682#issuecomment-35455841>

    Took a look at this today, and it seems that Red uses `red/included-list` (of `%compiler.r` and Red/System uses `loader/include-list` in `%system/loader.r` for keeping track of these include files.   I don't have enough of a big picture to know how / if these can be combined or checked for duplicates, but I will play around a little more.
    
    Actually I haven't confirmed that the loader/include-list is used in %compiler.r

--------------------------------------------------------------------------------

On 2014-02-19T01:51:52Z, kealist, commented:
<https://github.com/red/red/issues/682#issuecomment-35457931>

    Here is the include list for compiling the above scripts:
    
    ```
    Loader: /C/Users/kealist/Documents/GitHub/RS-fossil-mirror/cURL/examples/system/runtime/system.reds 
    /C/Users/kealist/Documents/GitHub/RS-fossil-mirror/cURL/examples/system/runtime/lib-names.reds 
    /C/Users/kealist/Documents/GitHub/RS-fossil-mirror/cURL/examples/system/runtime/libc.reds 
    /C/Users/kealist/Documents/GitHub/RS-fossil-mirror/cURL/examples/system/runtime/win32.reds 
    /C/Users/kealist/Documents/GitHub/RS-fossil-mirror/cURL/examples/system/runtime/utils.reds 
    .//C/Users/kealist/Documents/GitHub/RS-fossil-mirror/cURL/examples/test-include.reds 
    /C/Users/kealist/Documents/GitHub/RS-fossil-mirror/cURL/examples/test-include2.reds 
    .//C/Users/kealist/Documents/GitHub/RS-fossil-mirror/cURL/examples/test-include2.reds
    ```
    
    We're getting the `./` appended at the beginning of the files included from the #system-global directive.

--------------------------------------------------------------------------------

On 2014-02-19T02:42:48Z, kealist, commented:
<https://github.com/red/red/issues/682#issuecomment-35460494>

    Tried tracing through the compiler functions to investigate where this is happening, but I do not think it is within my ability to find/fix.  I'll take another look later on.

--------------------------------------------------------------------------------

On 2014-02-21T11:52:30Z, dockimbel, commented:
<https://github.com/red/red/issues/682#issuecomment-35724391>

    Your logs show that the absolute include paths are wrongly prefixed resulting in wrong paths.

--------------------------------------------------------------------------------

On 2014-02-21T15:56:19Z, kealist, commented:
<https://github.com/red/red/issues/682#issuecomment-35743240>

    Thank you!

