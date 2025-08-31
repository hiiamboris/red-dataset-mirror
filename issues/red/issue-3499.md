
#3499: reduce and compose evaluate lit-words twice
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
<https://github.com/red/red/issues/3499>

### Expected behavior
>> a: 1
>> reduce a     ;== 1
>> reduce 'a    ;== a
### Actual behavior
>> a: 1
>> reduce a     ;== 1
>> reduce 'a    ;== 1

compose behaves the same
### Steps to reproduce the problem
execute above code
### Red and platform version
all


Comments:
--------------------------------------------------------------------------------

On 2018-08-11T19:07:03Z, greggirwin, commented:
<https://github.com/red/red/issues/3499#issuecomment-412295502>

    @meijeru, it's the console evaluating it in that example.
    ```
    >> a: 1
    == 1
    >> first reduce ['a]	
    == a
    >> quote reduce 'a
    == a
    ```
    This is a change from how Rebol works, but I believe is by design.

--------------------------------------------------------------------------------

On 2018-08-11T19:35:41Z, meijeru, commented:
<https://github.com/red/red/issues/3499#issuecomment-412297074>

    Fair enough. Not worth pursuing further, I close.

