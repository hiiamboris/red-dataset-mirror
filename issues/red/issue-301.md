
#301: Wish: casting from function![...] to logic! could be allowed
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[type.wish] [status.reviewed] [Red/System]
<https://github.com/red/red/issues/301>

Casting from `c-string!`, `pointer!` and `struct!` values follows the rule:

```
null -> false, anything else -> true
```

The same could easily apply to `function!` values



Comments:
--------------------------------------------------------------------------------

On 2012-12-06T22:40:15Z, dockimbel, commented:
<https://github.com/red/red/issues/301#issuecomment-11109491>

    Yes, it could be extended for function! values too.

--------------------------------------------------------------------------------

On 2013-05-05T12:23:18Z, PeterWAWood, commented:
<https://github.com/red/red/issues/301#issuecomment-17450957>

    Wish moved to v2 wish list on wiki.

