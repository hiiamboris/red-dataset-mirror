
#526: print-wide doesn't suppress spacing after (and before) newline
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/526>

```
Red/System []

print-wide [
    "A" newline
    "B"
]

A 
 B
```



Comments:
--------------------------------------------------------------------------------

On 2016-09-29T04:58:09Z, rebolek, commented:
<https://github.com/red/red/issues/526#issuecomment-250370414>

    @dockimbel Current molded output is `"A ^/B"`, so there is space before newline. Is this expected behaviour?

