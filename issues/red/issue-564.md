
#564: Double recursive FUNCTION PARSE crashes
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/564>

```
Red []

f: func [
    s [string!]
][
    r: [
        copy l  skip (l: load l)
        copy x  l skip
        [
            #","
            | #"]" if (f probe x)
        ]
    ]
    parse s [any r end]
]
print f "420,]]"
```

"20,]"
"0,"

**\* Runtime Error 101: no value matched in SWITCH
**\* at: 08067BF6h



Comments:
--------------------------------------------------------------------------------

On 2013-11-12T14:17:02Z, dockimbel, commented:
<https://github.com/red/red/issues/564#issuecomment-28296128>

    Hmm, ANSI escape codes parsing? :-)

--------------------------------------------------------------------------------

On 2013-11-12T16:17:31Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/564#issuecomment-28307277>

    Nope. :-) But now that you mention it, the stripped down case looks like it.

