
#5362: `max` native does not honor NaN comparison rules
================================================================================
Issue is closed, was reported by dockimbel and has 20 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5362>

```
>> min 1.0 1.#nan
== 1.#NaN
>> max 1.0 1.#nan
== 1.0
```
Should be `1.#NaN` in both cases, see: https://en.wikipedia.org/wiki/NaN#Comparison_with_NaN

Issue is caused by [this line](https://github.com/red/red/blob/master/runtime/natives.reds#L3298), such higher-level flag overrides the NaN comparison result.


Comments:
--------------------------------------------------------------------------------

On 2023-08-09T08:00:36Z, qtxie, commented:
<https://github.com/red/red/issues/5362#issuecomment-1670856179>

    > Issue is caused by [this line](https://github.com/red/red/blob/master/runtime/natives.reds#L3298), such higher-level flag overrides the NaN comparison result.
    
    Even without this overrides, we'll get wrong result without explicitly check if the arguments is NaN. Just rely on the NaN comparison result is not enough as it always return false.

--------------------------------------------------------------------------------

On 2023-08-11T19:50:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/5362#issuecomment-1675290934>

    Doesn't work on points yet.
    ```
    >> about
    Red 0.6.4 for Windows built 11-Aug-2023/5:27:21+03:00  commit #baa93a6
    >> min (1,1) (1.#nan,1.#nan)
    == (1, 1)
    >> max (1,1) (1.#nan,1.#nan)
    == (1, 1)
    ```

--------------------------------------------------------------------------------

On 2023-08-11T21:57:29Z, qtxie, commented:
<https://github.com/red/red/issues/5362#issuecomment-1675447009>

    What should return for those cases and why?
    ```
    min (1,1.#nan) (1.#nan,1.#nan)
    min (1,1.#nan) (1.#nan,1)
    ```

--------------------------------------------------------------------------------

On 2023-08-11T22:03:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/5362#issuecomment-1675452266>

    (1.#nan, 1.#nan), for consistency with 1D math.

--------------------------------------------------------------------------------

On 2023-08-11T22:08:16Z, qtxie, commented:
<https://github.com/red/red/issues/5362#issuecomment-1675456308>

    That's odd to get a point! which different than the two being compared. It's worse for point3D!.
    ```
    min (1, 1.#nan, 1) (1.#nan, 1, 1)
    ```

--------------------------------------------------------------------------------

On 2023-08-11T22:17:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/5362#issuecomment-1675463011>

    ```
    >> min (1, 1.#nan, 1) (1.#nan, 1, 1)
    == (1.#nan, 1.#nan, 1)
    ```
    

--------------------------------------------------------------------------------

On 2023-08-11T22:19:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/5362#issuecomment-1675464394>

    We either propagate NaN everywhere (as we have chosen), or ignore it everywhere. There shouldn't be different shades of grey for every function.

--------------------------------------------------------------------------------

On 2023-08-11T22:21:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/5362#issuecomment-1675466154>

    > which different than the two being compared
    
    It was always the case with min/max:
    ```
    >> min (1,4) (2,3)
    == (1, 3)
    ```

--------------------------------------------------------------------------------

On 2023-08-11T22:23:10Z, qtxie, commented:
<https://github.com/red/red/issues/5362#issuecomment-1675467407>

    > > which different than the two being compared
    > 
    > It was always the case with min/max:
    > 
    > ```
    > >> min (1,4) (2,3)
    > == (1, 3)
    > ```
    
    OK. Didn't notice that.

--------------------------------------------------------------------------------

On 2023-08-15T15:30:58Z, dockimbel, commented:
<https://github.com/red/red/issues/5362#issuecomment-1679134421>

    @qtxie Can this ticket be closed now?

