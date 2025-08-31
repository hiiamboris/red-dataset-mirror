
#2171: Runtime crash on using func['lit-word] with paren! consists of not existing words
================================================================================
Issue is closed, was reported by ifgem and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2171>

def: `quote1: func ['val] [val]`

```
quote ()
*** Script Error: quote1 does not allow unset! for its 'a argument
*** Where: quote1
```

test has no value.

```
quote (test)
*** Runtime Error 27: non-existent physical address
*** at: 00027888h
```



Comments:
--------------------------------------------------------------------------------

On 2016-08-28T09:05:36Z, dockimbel, commented:
<https://github.com/red/red/issues/2171#issuecomment-242964279>

    Is there a typo in your examples? Should it be rather `quote1 ()`?

