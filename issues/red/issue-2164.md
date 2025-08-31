
#2164: WISH: new percent! behavior
================================================================================
Issue is closed, was reported by ifgem and has 12 comment(s).
[status.reviewed] [type.task.wish]
<https://github.com/red/red/issues/2164>

New:

```
100 + 10% => 110; = 100 * 110%
100 - 10% => 90; = 100 * 90%
```

Current:

```
100 - 10% => 99.9
100 + 10% => 100.1
```



Comments:
--------------------------------------------------------------------------------

On 2016-08-10T03:15:40Z, dockimbel, commented:
<https://github.com/red/red/issues/2164#issuecomment-238755009>

    A percent is really just a number divided by 100, so `10% == 0.1`. So the current behavior is logical, though, maybe not the most helpful one. We will consider changing the semantics.

--------------------------------------------------------------------------------

On 2016-08-10T12:52:38Z, meijeru, commented:
<https://github.com/red/red/issues/2164#issuecomment-238857010>

    @dockimbel In changing the semantics, I suppose you will consider these 4 cases:
    integer + or - percent
    float + or -percent
    
    Question: will integer + or - percent yield an integer result when possible, or always a float result? The formulation of the wish seems to indicate that an integer result (if possible) is preferred.

--------------------------------------------------------------------------------

On 2016-08-10T18:44:03Z, WiseGenius, commented:
<https://github.com/red/red/issues/2164#issuecomment-238963883>

    IMHO, the current behaviour makes sense, but the suggested behaviour is ambiguous and belongs in a separate dialect.

--------------------------------------------------------------------------------

On 2016-08-10T18:52:49Z, meijeru, commented:
<https://github.com/red/red/issues/2164#issuecomment-238966616>

    Surely it can be defined perfectly unambiguously! All operations must be defined for all allowed combinations of types of left and right operand. The problem is not ambiguity, but desirability.

--------------------------------------------------------------------------------

On 2020-03-21T19:18:51Z, 9214, commented:
<https://github.com/red/red/issues/2164#issuecomment-602090253>

    I find the proposed behavior to be more useful, but it needs deeper research and some design mockup.

--------------------------------------------------------------------------------

On 2020-03-22T03:02:09Z, greggirwin, commented:
<https://github.com/red/red/issues/2164#issuecomment-602140586>

    It seems like a nice idea, but even spreadsheets don't do this automatically. If we do, how do you work around it? We can also view adding non-like types as an error, but there is a valid way to view percents, which is what Red currently does. This request relates to _incrementing_ a value, which we can do with an `incr` func (don't go into `++ op!` territory though :^) or examples of how do to percentage calculations. It can also be part of a dialect as @WiseGenius suggests.

