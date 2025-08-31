
#2343: hash! type  member in objects is shared
================================================================================
Issue is closed, was reported by Zamlox and has 8 comment(s).
[status.tested] [status.resolved]
<https://github.com/red/red/issues/2343>

```
red>> o: object [block: make hash! 10]
== make object! [
    block: make hash! []
]
red>> a: make o []
== make object! [
    block: make hash! []
]
red>> b: make o []
== make object! [
    block: make hash! []
]
red>> append a/block [1 2 3 4]
== make hash! [1 2 3 4]
red>> a
== make object! [
    block: make hash! [1 2 3 4]
]
red>> b
== make object! [
    block: make hash! [1 2 3 4]
]
```
looks like ```a``` and ```b``` share same ```block```



Comments:
--------------------------------------------------------------------------------

On 2016-11-21T07:11:07Z, Zamlox, commented:
<https://github.com/red/red/issues/2343#issuecomment-261860531>

    Same issue for ```map!``` type

--------------------------------------------------------------------------------

On 2016-11-21T08:55:51Z, dockimbel, commented:
<https://github.com/red/red/issues/2343#issuecomment-261879650>

    This is not a bug, `make` on object only copies by default some datatypes, for convenience (as COPYing is the most helpful behavior in the common case). So this applies to `any-string!`, `any-path!`, `block!` and `paren!`, but not for *heavier* datatypes like `hash!`, `map!` and `object!` which are shared by default (you can still manually force the COPY in the spec block during the object construction). Rebol2 and Rebol3 apply the same rules.

--------------------------------------------------------------------------------

On 2016-11-21T10:12:29Z, Zamlox, commented:
<https://github.com/red/red/issues/2343#issuecomment-261896568>

    All right, I was confused that it worked on ```block!``` datatype and I thought it should work on ```hash!``` and ```map!``` also.
    Then perhaps I can either use ```block!``` datatype instead of ```hash!```, ```map!``` or I can take out the definition of that member from base object and move it to derived objects.
    Sorry for confusion.

--------------------------------------------------------------------------------

On 2016-11-29T07:11:44Z, qtxie, commented:
<https://github.com/red/red/issues/2343#issuecomment-263493988>

    Fixed in this commit:  be5663d

