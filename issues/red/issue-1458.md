
#1458: Incorrect error message when .ico file is missing
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1458>

When an icon is specified in a header file but the file does not exist, the compiler gives an incorrect error message. It seems to change the .ico to .r.

The following message was produced when the header included `Icon: %red.ico` but the file was not in the same directory as the program source.

``` Red
>> change-dir %/e/Code/Red/View
== %/e/Code/Red/View/
>> do/args %/e/Languages/Red/red.r %ShareAnalysis.red
Script: "Red command-line front-end" (none)

-=== Red Compiler 0.5.4 ===-

Compiling /e/Code/Red/View/ShareAnalysis.red ...
...compilation time : 875 ms

Compiling to native code...
Script: "Red/System PE/COFF format emitter" (none)
*** Red/System Compiler Internal Error: Access Error : Cannot open /e/Code/Red/View/red.r
*** Where: icon-number?
*** Near:  [data: read/binary icon
num: num
]
```



Comments:
--------------------------------------------------------------------------------

On 2015-11-18T14:45:12Z, dockimbel, commented:
<https://github.com/red/red/issues/1458#issuecomment-157734790>

    We also need to provide a default icon if the user doesn't set one.

--------------------------------------------------------------------------------

On 2016-02-03T14:21:47Z, dockimbel, commented:
<https://github.com/red/red/issues/1458#issuecomment-179262592>

    Default icon is now supported, so I'll close this ticket.

