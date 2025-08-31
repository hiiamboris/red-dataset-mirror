
#3030: Logically shift an integer to right by 32 bits
================================================================================
Issue is closed, was reported by JenniferLee520 and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3030>

While I was trying to implement the "extendable hashing" algorithm, I found a bug.
Shifting bits to the right side logically to the limit (64 in REBOL3, and 32 in Red) should get 0.
REBOL3 is correct on this, but Red has a bug.
```Red
>> d: -16777216
== -16777216
>> d >>> 30
== 3
>> d >>> 31
== 1
>> d >>> 32 
== -16777216  ; <=== should be 0
```


Comments:
--------------------------------------------------------------------------------

On 2017-09-14T09:50:01Z, 9214, commented:
<https://github.com/red/red/issues/3030#issuecomment-329432393>

    Looks like shift is wrapping over and starts from the left side again. Could be useful though:
    ```Red
    >> to-bits: func [x][enbase/base to binary! x 2]
    == func [x][enbase/base to binary! x 2]
    >> max: 1 << 31
    == -2147483648
    >> to-bits max
    == "10000000000000000000000000000000"
    >> to-bits max >>> 31
    == "00000000000000000000000000000001"
    >> to-bits max >>> 32
    == "10000000000000000000000000000000"
    >> to-bits max >>> 33
    == "01000000000000000000000000000000"
    ```

--------------------------------------------------------------------------------

On 2017-09-14T15:18:15Z, meijeru, commented:
<https://github.com/red/red/issues/3030#issuecomment-329515521>

    Looks more like shift count is treated module 32

--------------------------------------------------------------------------------

On 2017-09-14T16:49:07Z, greggirwin, commented:
<https://github.com/red/red/issues/3030#issuecomment-329542409>

    If it wraps, that's `rotate`, so I don't think we should consider this a feature. There is only 1 `>>>` test in %integer-test.red. Maybe we should add a few more.

