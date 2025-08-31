
#2141: Issue! as map key isn't molded, and becomes a word
================================================================================
Issue is closed, was reported by greggirwin and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2141>

```
red>> m: #(a 1 [] 2 #3 3)
== #(
    a: 1
    [] 2
    3: 3
)
red>> keys-of m
== [a [] 3]
red>> type? last keys-of m
== word!
```



Comments:
--------------------------------------------------------------------------------

On 2016-08-01T12:33:41Z, dockimbel, commented:
<https://github.com/red/red/issues/2141#issuecomment-236568229>

    @qtxie An error should be generated for any attempt at using an any-block! value as key in maps.

--------------------------------------------------------------------------------

On 2016-08-05T07:16:57Z, qtxie, commented:
<https://github.com/red/red/issues/2141#issuecomment-237774368>

    Add error report in this commit: aec03cb

