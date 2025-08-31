
#560: Complex string corruption
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/560>

```
Red []

f: function [
    value
    out         [string!]
][
    either block? value [
        string: copy ""

        foreach x value [
            f x  tail string
        ]
        insert insert insert out  0 string #"]"
        out
    ][
        insert insert insert insert out  1 #":" value #","
        out
    ]
]

f [a [b c d]] s: ""
?? s
```

s: "01:a,01:b,1:c,1:d^@]]"

The comma behind the d is corrupted into a null-byte. There's probably an off-by-one error in series manipulation somewhere, because in more complex cases, more null bytes end up at the end of the string.



