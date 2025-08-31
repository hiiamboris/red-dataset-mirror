
#1065: typeset! implementation not complete
================================================================================
Issue is closed, was reported by meijeru and has 12 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/1065>

The 0.5.1 announcement says:

```
The following actions are supported on typeset! values:
make, form, mold, and, or, xor, complement, clear, find, insert, append, length?
```

However, this is not (yet) true for the "series" actions `clear, find, insert, append, length?`
They yield errors such as

```
*** Script error: clear does not allow typeset for its series argument
*** Where: clear
```



Comments:
--------------------------------------------------------------------------------

On 2015-03-15T12:25:55Z, meijeru, commented:
<https://github.com/red/red/issues/1065#issuecomment-80989161>

    I think I found the mistake: the corresponding action definitions in `%environment/actions.red` do not allow for a `typeset!`argument.

--------------------------------------------------------------------------------

On 2015-03-15T16:17:41Z, dockimbel, commented:
<https://github.com/red/red/issues/1065#issuecomment-81133744>

    Good catch!
    
    Actually, we should remove some of these actions, there are simply not a good match for a typeset! datatype (like clear, insert, append and length?).

--------------------------------------------------------------------------------

On 2015-03-15T17:49:47Z, meijeru, commented:
<https://github.com/red/red/issues/1065#issuecomment-81176521>

    Empty typesets are probably not very useful, and since typesets are not sequences, `insert` and `append` actually have the same effect, which by the way could also be achieved by `or`. I see that `length?` tests the number of types in the set, and that is a useful thing, although it is not exactly what one thinks of for `length?`. Again this is because a set is not a sequence...

--------------------------------------------------------------------------------

On 2015-03-16T14:59:02Z, meijeru, commented:
<https://github.com/red/red/issues/1065#issuecomment-81716680>

    I accept that you have now removed some actions, but `find` remains. That means, you still have to change `%environment/actions.red` also, as per my earlier comment!

--------------------------------------------------------------------------------

On 2015-03-16T16:28:48Z, dockimbel, commented:
<https://github.com/red/red/issues/1065#issuecomment-81777748>

    Thanks for the reminder, forgot about it.

--------------------------------------------------------------------------------

On 2015-03-16T17:49:45Z, meijeru, commented:
<https://github.com/red/red/issues/1065#issuecomment-81839259>

    I see that `find` in `%environment/actions.red` now has the right arguments, but when looking at the description of the function, it occurred to me that it works in fact differently for series on the one hand, and objects, bitsets and typesets on the other, yielding a truth value in the latter cases - with probably none of the refinements making any sense there. One has to document this somewhere, or does it merit a separate function, you think?

