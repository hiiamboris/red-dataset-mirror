
#1131: Inconsistency in pair! error messages
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/1131>

The error message with a wrong word accessor should mention that accessor

```
    switch TYPE_OF(element) [
        TYPE_INTEGER [
            int: as red-integer! element
            value: int/value
            if all [value <> 1 value <> 2][
                print-line ["*** Path Error: pair! does not support accessor:" value]
            ]
        ]
        TYPE_WORD [
            w: as red-word! element
            value: symbol/resolve w/symbol
            if all [value <> words/x value <> words/y][
                print-line "*** Path Error: pair! does not support accessor:"
            ]
            value: either value = words/x [1][2]
        ]
```



