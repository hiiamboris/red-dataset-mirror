
#3711: DIFFERENCE doesn't accept vector! values
================================================================================
Issue is open, was reported by endo64 and has 12 comment(s).
[type.wish]
<https://github.com/red/red/issues/3711>

**Describe the bug**
`difference` doesn't accept `vector!` values.

**To reproduce**

```
v1: make vector! [1 2 3]
; == make vector! [1 2 3]
v2: make vector! [2 3 4]
; == make vector! [2 3 4]
difference v1 v2
; *** Script Error: difference does not allow vector! for its set1 argument
```

**Expected behavior**

```
difference v1 v2
; == make vector! [1 4]
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 1-Jan-2019/17:22:21+03:00 commit #8bf2cbe
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-05T21:49:15Z, meijeru, commented:
<https://github.com/red/red/issues/3711#issuecomment-451693459>

    Strictly speaking, this is not an issue since the definition of `difference` does not include vector arguments. So it should be rephrased as a wish, if you ask me.

--------------------------------------------------------------------------------

On 2019-01-05T22:27:25Z, meijeru, commented:
<https://github.com/red/red/issues/3711#issuecomment-451696773>

    Analysis: the arguments for `difference` comprise `block! hash! string! bitset! typeset!` and `date!`. Except for the last one, these argument types have values that can be seen as sets, and `difference` on them is treated as a set-theoretical operation. Note the absence of `paren!`, `any-path!` and the string-like types `file! url! email!`  and `tag!`. This seems defensible, since (with the possible exception of  `paren!`) their values are not typically used as sets. A `vector!` value on the other hand could very well be used as a set. So the wish certainly has merits.

--------------------------------------------------------------------------------

On 2019-01-05T22:59:18Z, endo64, commented:
<https://github.com/red/red/issues/3711#issuecomment-451699436>

    @meijeru Thanks!
    `vector!`s are almost identical to `block!`s with some limitations (all values should be same type and only char, integer and floats are allowed), so generally all set operations like `exclude`, `difference`, `intersect`, `union` should be supported IMO.
    But you are right that this ticket could be wish.

--------------------------------------------------------------------------------

On 2019-01-05T23:09:07Z, endo64, commented:
<https://github.com/red/red/issues/3711#issuecomment-451700030>

    When I add `vector!` to the spec of `difference` (for both arguments and the return value) it gives run-time error: `*** Runtime Error 101: no value matched in SWITCH`
    
    `difference` simply calls `do-set-op` from `block.reds` and there is no `switch` in there.
    I don't know where to look else.

--------------------------------------------------------------------------------

On 2019-01-06T09:59:38Z, meijeru, commented:
<https://github.com/red/red/issues/3711#issuecomment-451729365>

    Most of vector's actions are handled by string, because string is vector's _parent type_. So you should not look in block.reds, but string.reds.

--------------------------------------------------------------------------------

On 2019-01-07T04:08:53Z, greggirwin, commented:
<https://github.com/red/red/issues/3711#issuecomment-451816515>

    They would have to be based on the maximum bit-size of the vector elements. Having not done array programming, as many others have, what is the use case for set ops on vectors?

