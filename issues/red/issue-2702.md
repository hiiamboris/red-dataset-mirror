
#2702: pair! value not allowed as second operand to subtract
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2702>

This is somewhat inconsistent:
```
>> 1x2 - 1
== 0x1
>> 1 - 1x2
*** Script Error: - does not allow pair! for its value2 argument
*** Where: -
>> negate 1x2
== -1x-2
>> 0 - 1x2
*** Script Error: - does not allow pair! for its value2 argument
*** Where: -
```
The source is in `do-math-op` in `%integer.reds` which is also called for a `char!` first operand



Comments:
--------------------------------------------------------------------------------

On 2017-05-24T17:40:18Z, greggirwin, commented:
<https://github.com/red/red/issues/2702#issuecomment-303797932>

    It's because actions are singularly polymorphic based on the first datatype. Something to be noted in primer docs, but not an inconsistency per se. 

--------------------------------------------------------------------------------

On 2017-05-24T17:53:48Z, greggirwin, commented:
<https://github.com/red/red/issues/2702#issuecomment-303801773>

    Ah, I see that `+` works, but `-` doesn't, so perhaps an inconsistency indeed.

--------------------------------------------------------------------------------

On 2017-05-24T18:56:57Z, meijeru, commented:
<https://github.com/red/red/issues/2702#issuecomment-303819041>

    Also, as I have shown, `negate` which is `0 - ...` does work.

