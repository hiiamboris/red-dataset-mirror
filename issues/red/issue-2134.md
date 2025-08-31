
#2134: funny time! values
================================================================================
Issue is closed, was reported by WiseGenius and has 18 comment(s).
[status.problem] [status.reviewed] [test.written] [type.task.wish]
<https://github.com/red/red/issues/2134>

1187 full minutes <= `24:00` end in a `.0`:

```
red>> 00:07:59
== 0:07:59
red>> 00:08:01
== 0:08:01
red>> 00:08:00
== 0:08:00.0
```

254 full minutes < `24:00` end in `:60`. The rest are as above.

```
red>> 00:08:59
== 0:08:59
red>> 00:09:01
== 0:09:01
red>> 00:09:00
== 0:08:60
```

Every single full minute can be made to end in `:60` in the following way:

```
red>> 00:00:60              ;OK
== 0:01:00.0
red>> 00:00:00 + 60         ;OK
== 0:01:00.0
red>> (00:00:00 + 1) * 60   ;Even this is OK
== 0:01:00.0
red>> 00:00:01 * 60         ;Oops!
== 0:00:60
```

Every single full minute behaves in the following horrible way:

```
red>> t: 0:00:00 loop 59 [t: t + 1]
== 0:00:59
red>> t: 0:00:00 loop 61 [t: t + 1]
== 0:01:01
red>> t: 0:00:00 loop 60 [t: t + 1]
== 0:01:05.68434189e-14
```

There is also this behaviour:

```
red>> t: now/time/precise/utc
== 15:13:59.984
red>> t/second
== 59.98399999999674
red>> t: now/time/precise/utc
== 15:14:52.156
red>> t/second
== 52.15600000000268
```



Comments:
--------------------------------------------------------------------------------

On 2016-09-03T01:30:03Z, qtxie, commented:
<https://github.com/red/red/issues/2134#issuecomment-244518997>

    Partially fix some cases. 
    
    The last one `t/second` is not fixed.

--------------------------------------------------------------------------------

On 2017-07-28T17:00:40Z, dockimbel, commented:
<https://github.com/red/red/issues/2134#issuecomment-318708056>

    @qtxie Could we fix the last case now?

--------------------------------------------------------------------------------

On 2017-07-29T01:18:09Z, qtxie, commented:
<https://github.com/red/red/issues/2134#issuecomment-318793756>

    @dockimbel Nope. when we calculate the second from a time, we get some floating-point errors. Use 64bit integer to store the time would be the easiest solution.

--------------------------------------------------------------------------------

On 2018-06-04T12:10:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/2134#issuecomment-394332627>

    How is the last case even wrong? `t/second` is a float, and it is displayed with the maximum available precision, what's so bad about it? Those who need a pretty fixed format it can always do so with
    ```
    >> x: round/to t/second * 1e6 1  rejoin [x / 1'000'000 "." pad/left/with absolute x % 1'000'000 6 #"0"]
    == "59.984000"
    ```

--------------------------------------------------------------------------------

On 2018-06-04T16:17:22Z, greggirwin, commented:
<https://github.com/red/red/issues/2134#issuecomment-394413375>

    It created a non-loadable value.
    ```
    >> t: 0:00:01 / 1000000
    == 0:00:1e-6
    >> 0:00:1e-6
    *** Script Error: e-6 has no value
    *** Where: catch
    *** Stack:  
    
    >> load mold t
    == [0:00:01 e-6]
    ```

--------------------------------------------------------------------------------

On 2018-06-04T16:18:30Z, greggirwin, commented:
<https://github.com/red/red/issues/2134#issuecomment-394413724>

    Also, even if it's a float internally, that could change, and have you ever seen *anyone* use E notation for a time value?

--------------------------------------------------------------------------------

On 2018-06-04T16:26:09Z, hiiamboris, commented:
<https://github.com/red/red/issues/2134#issuecomment-394416099>

    @greggirwin nah, I get it that `0:00:1e-6` is a formatting issue. There's also an integer overflow case, and NaN/INF case. I think all these issues are pretty easy to avoid if you split the FP value into a mantissa and exponent parts first, like this guy did https://goo.gl/pMeqyK.
    
    I mean I don't see a problem with the `t/second` being `52.15600000000268` or else. 
    ```
    >> type? t/second
    == float!
    ```
    What's the problem with a `float!` being fully shown?
    
    And by the way, I think float is much better suited for time measurement than an integer.

--------------------------------------------------------------------------------

On 2018-06-04T16:49:08Z, greggirwin, commented:
<https://github.com/red/red/issues/2134#issuecomment-394423147>

    Agreed that we can show as much precision as is available. I thought you were talking about the E notation.

--------------------------------------------------------------------------------

On 2019-11-21T19:09:20Z, hiiamboris, commented:
<https://github.com/red/red/issues/2134#issuecomment-557228891>

    I think this issue was fixed to the extent possible.
    ```
    >> t: 0:00:01 / 10000000
    == 0:00:00
    >> t: 0:00:01 / 1000000
    == 0:00:00.000001
    >> t: 0:00:01 / 100000
    == 0:00:00.00001
    >> t: 0:00:01 / 10000
    == 0:00:00.0001
    ```
    No `1e-` notation in time formatting.
    
    The t/second case:
    ```
    >> t: 15:14:52.156
    == 15:14:52.156
    >> t/second
    == 52.15600000000268
    ```
    t/second is a `float!`, not a `time!` and is output as it should be: with maximum precision.
    Trailing numbers appear because `time!` as a variant of `float!` holds also hour and minute, and we almost subtract a float from itself, so the error from this subtraction is noticeable:
    ```
    >> t
    == 15:14:52.156
    >> to float! t
    == 54892.156
    >> 54892.156 - 54840
    == 52.15600000000268
    ```
    Or with bigger times:
    ```
    >> t: 1000000000:12:34.567
    == 1000000000:12:34.5669
    >> t/second
    == 34.56689453125
    >> t: 1000000000:12:34.567
    == 1000000000:12:34.5669
    >> to float! t
    == 3600000000754.567
    >> t/second
    == 34.56689453125
    >> 3600000000754.567 - 3600000000720
    == 34.56689453125
    ```

