
#3655: to-pair with a single percent value is accepted, but with a block of two values they may not be percent
================================================================================
Issue is closed, was reported by meijeru and has 16 comment(s).
<https://github.com/red/red/issues/3655>

**Describe the bug**
See the title - this is an inconsistecy

**To Reproduce**
>> to-pair 200%
== 2x2
>> to-pair [100% 200%]
*** Syntax Error: invalid construction spec: [100% 200%]
*** Where: to
>> to-pair [1 2]
== 1x2

**Expected behavior**
>> to-pair [100% 200%]
== 1x2

Or, disallow `to-pair 200%`

**Platform version(please complete the following information):**
```
Presumably all
```


Comments:
--------------------------------------------------------------------------------

On 2018-12-12T20:27:29Z, greggirwin, commented:
<https://github.com/red/red/issues/3655#issuecomment-446732098>

    My instinct is to disallow percent to pair conversions, as what meaning does it have? Today we often conflate float and percent, which is convenient for many things, but may not have clear meaning.

--------------------------------------------------------------------------------

On 2018-12-12T20:29:59Z, greggirwin, commented:
<https://github.com/red/red/issues/3655#issuecomment-446732853>

    I seem to recall old chat about percent values and their relative vs absolute nature. Deserving of deeper thought.

--------------------------------------------------------------------------------

On 2018-12-12T20:53:24Z, meijeru, commented:
<https://github.com/red/red/issues/3655#issuecomment-446739708>

    More consistent all around to disallow percent here. May be just a question of specifying number! when it was still only integer! + float! ... 

--------------------------------------------------------------------------------

On 2018-12-15T20:35:35Z, endo64, commented:
<https://github.com/red/red/issues/3655#issuecomment-447596132>

    I'm for disallowing percent for `make pair!` (`to` is same with `make` for pair), unless we will have pairs with float values.

--------------------------------------------------------------------------------

On 2019-01-03T18:58:36Z, meijeru, commented:
<https://github.com/red/red/issues/3655#issuecomment-451242355>

    This can now also be closed?

--------------------------------------------------------------------------------

On 2019-01-03T22:28:00Z, endo64, commented:
<https://github.com/red/red/issues/3655#issuecomment-451297687>

    Yes, I think so, it is not allowed:
    
    ```
    >> to-pair [100% 200%]
    *** Syntax Error: invalid construction spec: [100% 200%]
    >> to-pair 200%
    *** Script Error: cannot MAKE/TO pair! from: 200%
    ```

--------------------------------------------------------------------------------

On 2019-01-05T01:39:43Z, greggirwin, commented:
<https://github.com/red/red/issues/3655#issuecomment-451616710>

    Thanks for weighing in guys.

--------------------------------------------------------------------------------

On 2019-01-05T03:36:50Z, guaracy, commented:
<https://github.com/red/red/issues/3655#issuecomment-451624307>

                                                                                          F

