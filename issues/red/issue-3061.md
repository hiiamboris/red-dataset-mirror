
#3061: PARSE is not setting the Red stack properly for local words when calling the user-provided function
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3061>

```Red
rule: [["a" "b" "c"] (probe matched-rule)]

parse/trace "abc" rule func [
        event   [word!]
        match?  [logic!]
        rule    [block!]
        input   [series!]
        stack   [block!] 
        /local  ctx         ;     <--
][
    ctx: [string! | quote none]
    also yes all [
        match?
        parse rule [ctx string! ctx]
        set 'matched-rule rule
    ]
]
```
```Red
*** Script Error: matched-rule has no value
*** Where: probe
*** Stack: probe
```


