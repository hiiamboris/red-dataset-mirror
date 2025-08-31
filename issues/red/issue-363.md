
#363: ROUTINE doesn't use preprocessor
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/363>

# system does use the preprocessor, so I suppose ROUTINE should also be able to.

```
Red []

f: routine [
    return:     [integer!]
][
    #either OS = 'Windows [
        0
    ][
        1
    ]
]
```

Compiling to native code... 

**\* Compilation Error: undefined symbol: issue 
**\* in file: %/home/kaj/Red/SQLite/examples/test.red 
**\* at line: 120 
**\* near: [
    issue/push 
    #either 
    block/append\* 
    stack/keep 
    word/push ~OS 
    block/append\* 
    stack/keep
]



Comments:
--------------------------------------------------------------------------------

On 2013-01-03T12:41:17Z, dockimbel, commented:
<https://github.com/red/red/issues/363#issuecomment-11842429>

    The problem here is that issue! datatype has not yet been implemented in Red. I'll see if I can add it quickly.

--------------------------------------------------------------------------------

On 2013-01-03T17:15:58Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/363#issuecomment-11851891>

    Odd, I'm pretty sure I used the same construct in #system-global.

--------------------------------------------------------------------------------

On 2013-01-03T18:39:45Z, dockimbel, commented:
<https://github.com/red/red/issues/363#issuecomment-11855168>

    Actually, #system\* directives body blocks are not stored as Red values in the compiled code, so the Red compiler does not process their content... It might be a good idea to store them too for reflectivity needs.

