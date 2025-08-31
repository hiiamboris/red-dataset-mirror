
#3038: shift an integer right (>>) by 32 bits
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3038>

After #3030 (>>>) has been fixed, I found >> has the same issue:
```Red
>> -213124324 >> 26
== -4
>> -213124324 >> 27
== -2
>> -213124324 >> 28
== -1
>> -213124324 >> 29
== -1
>> -213124324 >> 30
== -1
>> -213124324 >> 31
== -1
>> -213124324 >> 32
== -213124324
```


Comments:
--------------------------------------------------------------------------------

On 2017-09-16T13:22:28Z, 9214, commented:
<https://github.com/red/red/issues/3038#issuecomment-329968168>

    and `<<` too?
    ```Red
    >> to-bits: func [x][enbase/base to binary! x 2]
    == func [x][enbase/base to binary! x 2]
    >> max: 1 << 31
    == -2147483648
    >> to-bits max
    == "10000000000000000000000000000000"
    >> to-bits max >> 31
    == "11111111111111111111111111111111"
    >> to-bits max >> 32
    == "10000000000000000000000000000000"
    >> to-bits max >> 33
    == "11000000000000000000000000000000"
    >> to-bits 1 << 31
    == "10000000000000000000000000000000"
    >> to-bits 1 << 32
    == "00000000000000000000000000000001"
    >> to-bits 1 << 33
    == "00000000000000000000000000000010"
    ```

