
#4352: Additional curious behaviour of vector arithmetic
================================================================================
Issue is open, was reported by meijeru and has 4 comment(s).
[type.design]
<https://github.com/red/red/issues/4352>

Apart from the problems mentioned in #2216 we have the following:
```
>> v: make vector! [1 2 3]
== make vector! [1 2 3]
>> 10 + v
== make vector! [11 12 13]
>> v
== make vector! [11 12 13]
>> 10 - v
== make vector! [1 2 3]
>> v
== make vector! [1 2 3]
```
One would expect `v` to be `make vector! [-1 -2 -3]` at the end. Otherwise the mathematics get very strange indeed.


Comments:
--------------------------------------------------------------------------------

On 2020-03-20T14:57:57Z, 9214, commented:
<https://github.com/red/red/issues/4352#issuecomment-601743494>

    Sound like a duplicate of https://github.com/red/red/issues/4068.

--------------------------------------------------------------------------------

On 2020-03-20T17:07:35Z, meijeru, commented:
<https://github.com/red/red/issues/4352#issuecomment-601811722>

    That issue addressed only divide and remainder, this one addresses subtract. So it is additional, but I agree that the previous issue is probably enough to prompt action by the team...

