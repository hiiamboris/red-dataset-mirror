
#1226: appending hash!s like block!s
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/1226>

Since the current plan is to merge `hash!` into `block!` (and probably even if not), `hash!` should behave like `block!` at every opportunity. One place it currently doesn't is when it's used as the second argument of `append` without the `/only` refinement:

```
red>> append [a b] [c d]
== [a b c d]
red>> append [a b] make hash! [c d]
== [a b make hash! [c d]]
red>> append make hash! [a b] make hash! [c d]
== make hash! [a b make hash! [c d]]
red>> append/only [a b] make hash! [c d]
== [a b make hash! [c d]]
```

Rebol 2 does it the preferred way, in this case:

```
>> append [a b] [c d]
== [a b c d]
>> append [a b] make hash! [c d]
== [a b c d]
>> append make hash! [a b] make hash! [c d]
== make hash! [a b c d]
>> append/only [a b] make hash! [c d]
== [a b make hash! [c d]]
```



Comments:
--------------------------------------------------------------------------------

On 2015-06-09T14:15:32Z, dockimbel, commented:
<https://github.com/red/red/issues/1226#issuecomment-110369691>

    Agreed.

