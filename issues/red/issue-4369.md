
#4369: Insert into binary with paren or hash value gives stack overflow
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
<https://github.com/red/red/issues/4369>


With block value there is no problem
```
>> head insert #{ } ["a" 1]
== #{6101}
>> head insert #{} quote ("a" 1)
*** Internal Error: stack overflow
>> head insert #{} make hash! ["a" 1]
*** Internal Error: stack overflow
```

One should expect all `any-list!`  types to be treated equally, like with insert into a string.


Comments:
--------------------------------------------------------------------------------

On 2020-03-25T18:23:04Z, 9214, commented:
<https://github.com/red/red/issues/4369#issuecomment-604006954>

    This is:
    * A [duplicate](https://github.com/red/red/issues/4272);
    * Which was already [fixed](https://github.com/red/red/pull/4346).
    
    ---
    
    @meijeru we have a dedicated template for bug reports (which you can pick when opening a new issue). Please use it whenever you report something and provide all the required information, this will save time and effort on our side. Also, make sure that you test your findings against the nightly build.

--------------------------------------------------------------------------------

On 2020-03-25T19:00:05Z, meijeru, commented:
<https://github.com/red/red/issues/4369#issuecomment-604026404>

    I stand corrected! I do not even have the excuse of a previous issue reported long ago, as sometimes happens, the more so since it was my own. But I had missed the resolution. My fault, and my apologies are in order.

