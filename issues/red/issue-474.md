
#474: Double function! reference to CONTEXT crashes compiler
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/474>

```
Red/System []

c: context [
    s!: alias struct! [
        f [function! []]
    ]

    r: declare struct! [s [s!]]
]


with c [
    r/s/f
]
```

-= Red/System Compiler =- 
**\* Compiler Internal Error: Script Error : Invalid path value: c 
**\* Where: emit-variable 
**\* Near:  [emit-reloc-addr emitter/symbols/:name]



Comments:
--------------------------------------------------------------------------------

On 2013-05-12T18:06:37Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/474#issuecomment-17782266>

    Please note that this applies to Red/System, not Red.

