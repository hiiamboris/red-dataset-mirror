
#314: Cast function pointer not executed when local
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [type.wish] [Red/System]
<https://github.com/red/red/issues/314>

```
f: function [
    p [integer!]
    /local j
][
    j: as function! [] p
    j
]
g: does [print-line "g"]
f as-integer :g
```

Should print "g" but doesn't execute g.



Comments:
--------------------------------------------------------------------------------

On 2012-11-24T23:26:04Z, dockimbel, commented:
<https://github.com/red/red/issues/314#issuecomment-10685112>

    That is a known limitation. Assigning function pointers to local variables is not supported currently. I will see if there is a workaround.

--------------------------------------------------------------------------------

On 2012-11-26T01:41:03Z, dockimbel, commented:
<https://github.com/red/red/issues/314#issuecomment-10701959>

    Implementation is almost ready, I will release it tomorrow (still needs ARM backend support and more testing).

