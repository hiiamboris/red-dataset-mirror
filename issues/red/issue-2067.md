
#2067: Set-word! declared only in view layout won't compile
================================================================================
Issue is closed, was reported by greggirwin and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/2067>

```
canvas: none    ;<== Had to add this to get it to compile

win: layout/tight [
    size win-size
    origin 0x0
    canvas: base win-size 10.10.255 draw draw-blk
]
until [
    ...
    show canvas
    ...
    quit?
]
```

The output is:
-=== Red Compiler 0.6.0 ===- 

Compiling D:\Red\demo\bubbles-2.red ...
**\* Compilation Error: undefined word canvas 
**\* in file: %/D/Red/demo/bubbles-2.red
**\* near: [canvas 
    do-events/no-wait 
    quit?
]



Comments:
--------------------------------------------------------------------------------

On 2016-06-23T17:34:22Z, dockimbel, commented:
<https://github.com/red/red/issues/2067#issuecomment-228123850>

    That is normal, the compiler cannot recognize what is `canvas` in `show canvas` if it's not defined before (the Red compiler can't process dialects). So, adding `canvas: none` is the right thing to do in order to compile the code.

