
#3826: GUI Test Backend is broken on Windows and macOS
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3826>



There are compilation errors when trying to compile red/tests/test-backend.red on both Windows and macOS.

On Windows:
```text
>> do/args %red.r "-r test-backend.red"
Script: "Red command-line front-end" (none)
Script: "Encap virtual filesystem" (21-Sep-2009)

-=== Red Compiler 0.6.4 ===-

Compiling E:\Red\red\test-backend.red ...
...compilation time : 5423 ms

Target: MSDOS

Compiling to native code...
*** Compilation Error: undefined symbol: exec/gui/PostQuitMessage
*** in file: %/E/Red/red/test-backend.red
*** in function: exec/ctx373~exit-event-loop
*** at line: 354
*** near: [gui/PostQuitMessage 0]
```

on macOS:
```text
-=== Red Compiler 0.6.4 ===- 

Compiling /Users/peter/VMShare/Red/red/test-backend.red ...
...compilation time : 2053 ms

Target: Darwin 

Compiling to native code...
*** Compilation Error: invalid definition for function exec/gui/OS-text-box-layout: [
    return: [this!]
] 
*** in file: %/Users/peter/VMShare/Red/red/modules/view/backends/test/text-box.reds 
*** at line: 110 
*** near: [func [
        box [red/red-object!] 
        target [pointer! [integer!]] 
        font-clr [integer!] 
        catch? [logic!] 
        return: [this!]
    ] [] 
    #script %/Users/peter/VMShare/Red/red/modules/view/backends/test/gui.reds 
    #script %/Users/peter/VMShare/Red/red/modules/view/backends/test/draw.reds 
    draw-state!:
]
```

Red Version: `commit e6c96aae15117cbade71a0afdbfba46daab42e92`
macOS Version: `10.12.6`
Windows VersionL `7`




Comments:
--------------------------------------------------------------------------------

On 2019-03-27T17:28:28Z, greggirwin, commented:
<https://github.com/red/red/issues/3826#issuecomment-477267997>

    Confirmed on Win10.

--------------------------------------------------------------------------------

On 2019-04-19T10:46:42Z, dockimbel, commented:
<https://github.com/red/red/issues/3826#issuecomment-484848880>

    The test backend has been updated to match the latest View API, so it's now usable again.

