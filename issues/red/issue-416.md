
#416: Interpreter corrupts argument passing on path access
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/416>

```
Red []

b: [none]
f: func [p q] [
    print p
    print q
]
do [f 1 b/1]
```

none
unset



Comments:
--------------------------------------------------------------------------------

On 2013-02-18T21:16:03Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/416#issuecomment-13743593>

    It's not fixed yet. I now get:
    
    none
    none

