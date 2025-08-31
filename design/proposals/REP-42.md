
#42: WISH: `round/to` should support `time!` and `percent!` types
================================================================================
Issue is open, was reported by hiiamboris and has 14 comment(s).
<https://github.com/red/REP/issues/42>

:point_up: [January 29, 2019 9:31 AM](https://gitter.im/red/red?at=5c4ff326454aad4df7bc9898)

From R2:
```
>> round/to 1:9:30 0:15
== 1:15
>> round/to 3.881 .125
== 3.875
>> round/to 3.881% .125%    ;-- this is R3 actually, R2 gives an error to me
== 3.875%
```

Red 0.6.4 does not allow `time!` as its scale argument and treats `percent!` as common float:
```
>> round/to 3.881% .125%
== 3.88125%
>> round/to 1:9:30 0:15
*** Script Error: round does not allow time! for its scale argument
```

It is worthwhile to reproduce the R2 behavior:
> By using a scale parameter, it can round to any precision, which is handy for all kinds of things: time values rounded to **15 minute intervals**, interest rates that are commonly in **1/8ths of a percent**, increments for imperial fractions, etc.

<br><br><br>

P.S. A note from myself. What if the value is a percent and the scale is a float? or vice versa? I propose this (on the basis that 100% percent = 1.0 float):
```
>> round/to 3.881% .125        ;-- percent/float: .125 -> (into the type of value) = 12.5%
== 0%                          ;-- R3 gives this result also
>> round/to 3.881 5%           ;-- float/percent: 5% -> (into the type of value) = 0.05
== 3.9                         ;-- R3 gives 390% for some reason here
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-29T21:02:31Z, Oldes, commented:
<https://github.com/red/REP/issues/42#issuecomment-458705536>

    Related `R3` issue: https://github.com/rebol/rebol-issues/issues/1028

--------------------------------------------------------------------------------

On 2019-03-11T20:52:58Z, hiiamboris, commented:
<https://github.com/red/REP/issues/42#issuecomment-471725196>

    A few more examples of current behavior:
    ```
    >> round/to 234.567% 0.1
    == 234.6000213623%   ;) works like 0.1% - wrong
    >> round/to 234.567% 1.0
    == 234.9999847412%   ;) works like 1.0% - wrong
    >> round/to 234.567% 1
    == 2                 ;) works like 100% - correct, although the resulting type is debatable
    
    >> round/to 234.567% 1%
    == 234.5700073242%   ;) works as 0.01% - wrong
    >> round/to 234.567% 100%
    == 234.9999847412%   ;) works as 1% - wrong
    >> round/to 234.567% 10000%
    == 200%              ;) works as 100% - wrong
    ```

--------------------------------------------------------------------------------

On 2020-03-02T21:40:32Z, greggirwin, commented:
<https://github.com/red/REP/issues/42#issuecomment-593637154>

    Just checked and `time!` now works.

--------------------------------------------------------------------------------

On 2020-03-02T21:55:56Z, greggirwin, commented:
<https://github.com/red/REP/issues/42#issuecomment-593643484>

    And float with a percent scale is also OK, correct (per @hiiamboris' note above)?

--------------------------------------------------------------------------------

On 2020-03-02T22:03:09Z, greggirwin, commented:
<https://github.com/red/REP/issues/42#issuecomment-593646458>

    These should all return percent! IMO.
    ```
    >> round/to 234.567% 0.1
    == 2.346
    >> round/to 234.567% 1.0
    == 2.35
    >> round/to 234.567% 1
    == 2
    ```
    
    OK now as well, except for the return type.
    ```
    >> round/to 234.567% 1%
    == 2.3457
    >> round/to 234.567% 100%
    == 2.35
    >> round/to 234.567% 10000%
    == 2.0
    ```

--------------------------------------------------------------------------------

On 2020-03-02T23:08:46Z, hiiamboris, commented:
<https://github.com/red/REP/issues/42#issuecomment-593670421>

    > These should all return percent! IMO.
    > 
    > ```
    > >> round/to 234.567% 0.1
    > == 2.346
    > >> round/to 234.567% 1.0
    > == 2.35
    > >> round/to 234.567% 1
    > == 2
    > ```
    > 
    > OK now as well, except for the return type.
    > 
    > ```
    > >> round/to 234.567% 1%
    > == 2.3457
    > >> round/to 234.567% 100%
    > == 2.35
    > >> round/to 234.567% 10000%
    > == 2.0
    > ```
    
    No that's not OK at all.
    I expect:
    ```
    >> round/to 234.567% 0.1
    == 230%
    >> round/to 234.567% 1.0
    == 200%
    >> round/to 234.567% 1
    == 200%
    
    >> round/to 234.567% 1%
    == 234%
    >> round/to 234.567% 100%
    == 200%
    >> round/to 234.567% 10000%
    == 0%
    ```

--------------------------------------------------------------------------------

On 2020-03-02T23:41:48Z, greggirwin, commented:
<https://github.com/red/REP/issues/42#issuecomment-593680393>

    Sorry I wasn't clear in my thinking and post. My brain said "once converted, the result will be the correct percent...assuming the rounding was scaled correctly.", which came from the change in result type from your earlier examples, and my multitasking when I shouldn't. On the very last example, I have no excuse for thinking backwards in the rounding, due to the large scale. :^\

