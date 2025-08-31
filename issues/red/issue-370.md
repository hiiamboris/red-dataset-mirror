
#370: ROUTINE doesn't support doc-strings
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/370>

```
Red []

f: routine [
    "Test."
][
]
f
```

-= Red Compiler =- 
Compiling /home/kaj/Red/SQLite/examples/test.red ...
**\* Red Compiler Internal Error: Script Error : Cannot use path on none! value 
**\* Where: forskip 
**\* Near:  [forall spec [
if any [spec/1 = /local set-word? spec/1] [
spec: head spec 
break
] 
unless block? spec/1 [
either find [integer! logic!] spec/2/1 [
append/only output append to path! form get spec/2/1 'get
] [
emit reduce ['as spec/2/1]
] 
emit 'arg 
unless head? spec [emit reduce ['+ cnt]] 
cnt: cnt + 1
]
] 
insert-lf negate
]



Comments:
--------------------------------------------------------------------------------

On 2013-01-10T15:45:16Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/370#issuecomment-12102909>

    After #376 this is now back with:
    
    -= Red Compiler =- 
    **\* Red Compiler Internal Error: Script Error : Cannot use path on none! value 
    **\* Where: forskip 
    **\* Near:  [forall spec [
    if string? spec/1 [remove spec] 
    if any [spec/1 = /local set-word? spec/1] [
    spec: head spec 
    break
    ] 
    unless block? spec/1 [
    either find [integer! logic!] spec/2/1 [
    append/only output append to path! form get spec/2/1 'get
    ] [
    emit reduce ['as spec/2/1]
    ] 
    emit 'r_arg 
    unless head? spec [emit reduce ['+ cnt]] 
    cnt: cnt + 1
    ]
    ] 
    insert-lf negate
    ]

--------------------------------------------------------------------------------

On 2013-01-10T21:25:07Z, dockimbel, commented:
<https://github.com/red/red/issues/370#issuecomment-12119519>

    I cannot reproduce #376... can you provide me some example code?

--------------------------------------------------------------------------------

On 2013-01-11T00:49:12Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/370#issuecomment-12126913>

    It's about the code in this issue, #370. The fix for #376 is just the one that made it a regression.

