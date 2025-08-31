
#4948: Rounding of percent values returns not what one expects
================================================================================
Issue is open, was reported by hiiamboris and has 18 comment(s).
[type.review]
<https://github.com/red/red/issues/4948>

**Describe the bug**
```
>> round/to 234.567% 1%
== 2.3457					;) expected 234%
>> round/to 234.567% 10%
== 2.346					;) expected 230%
>> round/to 234.567% 100%
== 2.35						;) expected 200%
>> round/to 234.567% 1000%
== 2.3						;) expected 0%
>> round/to 234.567% 10000%
== 2.0						;) expected 0%

>> round/to 234.567% 1.0
== 2.35						;) expected 2.0 (234.567% -> 2.34567)
>> round/to 234.567% 10.0
== 2.3						;) expected 0.0
>> round/to 234.567% 100.0
== 2.0						;) expected 0.0

>> round/to 234.567% 1
== 2
>> round/to 234.567% 10
== 2						;) expected 0
>> round/to 234.567% 100
== 2						;) expected 0
```
So far only 1 correct result.

Moreover, percent is also an outlier as the 2nd operand:
```
>> round/to 234.567 1
== 235
>> round/to 234.567 1.0
== 235.0
>> round/to 86400 1:0:0
== 24:00:00
>> round/to 234.567 100%
== 235.0					;) expected 23500%
```

**Expected behavior**

See above.

**Platform version**
```
Red 0.6.4 for Windows built 22-Jul-2021/20:44:06+03:00  commit #3c8d386
```

Other `round` issues open: https://github.com/red/red/issues/4882 https://github.com/red/red/issues/4462
Closed: https://github.com/red/red/issues/3759 https://github.com/red/red/issues/3321 https://github.com/red/red/issues/2865 https://github.com/red/red/issues/2593 https://github.com/red/red/issues/2012



Comments:
--------------------------------------------------------------------------------

On 2021-08-16T01:58:55Z, qtxie, commented:
<https://github.com/red/red/issues/4948#issuecomment-899161407>

    ```
    >> round/to 234.567% 1%
    == 2.3457					;) expected 234%
    ```
    This logic was introduced by this fix: https://github.com/red/red/commit/45043569f3fa9337fb9c4067eb3461f1c95b0377

--------------------------------------------------------------------------------

On 2021-08-16T07:41:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/4948#issuecomment-899294483>

    In the build https://github.com/red/red/commit/45043569f3fa9337fb9c4067eb3461f1c95b0377 :
    ```
    Red [] probe round/to 234.567% 1%
    ```
    Output:
    ```
    234.57%
    ```
    Which doesn't make much sense IMO. @dockimbel what do you think?

--------------------------------------------------------------------------------

On 2021-09-07T17:07:56Z, dockimbel, commented:
<https://github.com/red/red/issues/4948#issuecomment-914476995>

    @hiiamboris 
    ```
    >> 100% = 1.0
    == true
    ```
    so 
    ```
    >> round/to 234.567 100%
    == 235.0
    ```
    is correct.
    
    For the main issue, it looks like a regression.

--------------------------------------------------------------------------------

On 2021-09-07T17:16:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/4948#issuecomment-914482866>

    Well, `23500% = 235.0`, so it is numerically correct. The returned type isn't consistent with the other cases IMO.

--------------------------------------------------------------------------------

On 2021-09-09T19:40:50Z, greggirwin, commented:
<https://github.com/red/red/issues/4948#issuecomment-916383459>

    Do we have a matrix for `round` with return types given input types and scale types?

--------------------------------------------------------------------------------

On 2021-09-09T19:44:27Z, greggirwin, commented:
<https://github.com/red/red/issues/4948#issuecomment-916385720>

    Right now we have the `scale` doc string as a guide, but that may not be what we want, literally, in all cases. Or maybe we do for consistency and reasoning.
    
    > Return the nearest multiple of the scale parameter.

--------------------------------------------------------------------------------

On 2021-09-09T22:18:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/4948#issuecomment-916479672>

    > may not be what we want, literally, in all cases. Or maybe we do for consistency and reasoning.
    
    Just *please* let's make it so *human* can predict the result :)
    That means no type-to-type tables, only simple rules (that fit into docstrings).

--------------------------------------------------------------------------------

On 2021-09-10T15:04:21Z, greggirwin, commented:
<https://github.com/red/red/issues/4948#issuecomment-916974163>

    I didn't mean tables for docs, I meant so we know what the behavior is
    right now. Is the result always coerced to `scale`? Never? Sometimes?
    And if it's sometimes, do we have other tickets related to that, have
    people used it without complaint, or have those cases lived in the
    shadows?
    

--------------------------------------------------------------------------------

On 2021-09-27T02:48:20Z, qtxie, commented:
<https://github.com/red/red/issues/4948#issuecomment-927476259>

    There are two issues:
    1. Should the result type coerced to `scale`?
    ```
    >> round/to 86400 1:0:0
    == 24:00:00
    >> round/to 234.567 100%
    == 235.0                   ;-- should it be 23500% ? 
    ```
    Now we get 23500% with commit bfe7f823b709571c20142fb9222b3c2eda57cda8.
    
    2. How to round percent! values? Related to https://github.com/red/red/commit/45043569f3fa9337fb9c4067eb3461f1c95b0377#r57095334
    ```
    >> round/to 234.567% 1%
    == 234.57%				;) expected 234% ?
    >> round/to 234.567% 10%
    == 234.6%				;) expected 230% ?
    >> round/to 234.567% 100%
    == 235%					;) expected 200% ?
    >> round/to 234.567% 1000%
    == 230%					;) expected 0% ?
    >> round/to 234.567% 10000%
    == 200%					;) expected 0% ?
    ```

