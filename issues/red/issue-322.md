
#322: repeat index is not local to loop
================================================================================
Issue is closed, was reported by meijeru and has 14 comment(s).
[type.review]
<https://github.com/red/red/issues/322>

Try `i: 1 repeat i 100 [ ] print i` ; result is `101`
In REBOL it is `1` because the second `i` is local to the loop.

What semantics do we want for Red?



Comments:
--------------------------------------------------------------------------------

On 2012-11-29T08:35:20Z, dockimbel, commented:
<https://github.com/red/red/issues/322#issuecomment-10839063>

    This is a deliberate choice. Making the variable local is not only often counter-intuitive for the user, but also very costly for the interpreter/compiler. In REBOL, at each `repeat` invocation, a context needs to be created (or re-used and initialized, not sure how REBOL implements it) and the body block needs to be copied and bound to the local context. Red uses a different trade-off. Such loop variable will anyway be "captured" by (not yet implemented) `function` constructor, so if REBOL users stick to that,   they will not have to declare loop variable manually inside functions.

--------------------------------------------------------------------------------

On 2012-11-29T08:58:41Z, meijeru, commented:
<https://github.com/red/red/issues/322#issuecomment-10839565>

    Fair enough! But this needs to be explicitly documented especially for REBOL users. I suppose that, if ever Red acquires a `for` loop, the rule will be the same.

--------------------------------------------------------------------------------

On 2012-11-29T15:36:43Z, dockimbel, commented:
<https://github.com/red/red/issues/322#issuecomment-10851643>

    `foreach` is already applying that rule. That is certainly something to document in a "Red differences with REBOL" section.

--------------------------------------------------------------------------------

On 2012-12-06T21:55:15Z, dockimbel, commented:
<https://github.com/red/red/issues/322#issuecomment-11107138>

    I am closing this ticket as there nothing more to add to it.

--------------------------------------------------------------------------------

On 2012-12-16T21:00:12Z, rebolek, commented:
<https://github.com/red/red/issues/322#issuecomment-11422775>

    Does it mean that I can't use something like foreach [from to] replacements [replace somewhere from to] because I would redefine 'to ? That's unfortunate choice IMO.

--------------------------------------------------------------------------------

On 2012-12-16T23:01:51Z, dockimbel, commented:
<https://github.com/red/red/issues/322#issuecomment-11424386>

    You can as long as your doing that in a local context (function, object or anonymous context created by `use`). Doing it like in REBOL means you need to `bind/copy` deep the loop body block on each `foreach` invocation, which has a significant impact on performances and memory. I think we can make a better trade-off than REBOL there by just having  to be a little bit more careful when choosing loop words, when the loop is used in global context. Also, the compiler could do some extra checks and eventually emit some warning for cases like that.
    
    BTW, we could now check in R3 sources the assumption about the `bind/copy` applied on loop body blocks.

--------------------------------------------------------------------------------

On 2023-01-08T17:04:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/322#issuecomment-1374881859>

    Related https://github.com/red/red/issues/972

