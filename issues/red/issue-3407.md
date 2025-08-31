
#3407: time! accuracy and formatting issues
================================================================================
Issue is open, was reported by giesse and has 6 comment(s).
[type.bug]
<https://github.com/red/red/issues/3407>

```
>> about
Red for Linux version 0.6.3 built 29-May-2018/17:31:54-05:00
>> 0:00:01 / 10
== 0:00:00.100000001
>> 0:00:01 / 100
== 0:00:00.010000001
>> 0:00:01 / 1000
== 0:00:00.001000001
>> 0:00:01 / 10000
== 0:00:00.000100001
>> 0:00:01 / 100000
== 0:00:01.0001e-5
>> 0:00:01 / 1000000
== 0:00:01.001e-6
>> 0:00:01 / 10000000
== 0:00:00
```


Comments:
--------------------------------------------------------------------------------

On 2018-06-04T02:07:25Z, giesse, commented:
<https://github.com/red/red/issues/3407#issuecomment-394215490>

    See also #2134

--------------------------------------------------------------------------------

On 2018-08-26T17:03:35Z, gltewalt, commented:
<https://github.com/red/red/issues/3407#issuecomment-416053184>

    ```red
    >> make time! 6'000'000'000'000 
    == 1666666666:40:00 
    
    >> make time! 60'000'000'000'000 
    == -2147483648:40:00
    ```
    
    ```red
    >> make time! -6'000'000'000'000 
    == -1666666666:40:00 
    
    >> make time! -60'000'000'000'000 
    == --2147483648:40:00
    ```

--------------------------------------------------------------------------------

On 2019-11-21T19:11:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/3407#issuecomment-557229580>

    The original issue does not apply anymore. But `make time!` could have an overflow check.
    Also:
    ```
    >> make time! 0.0 / 0
    == --2147483648:-2147483648:00
    ```

