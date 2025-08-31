
#2882: make date! refuses negative year number in first position
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
<https://github.com/red/red/issues/2882>

It accepts negative years in third position.
```
>> make date! [-10 1 1]
*** Script Error: cannot MAKE/TO date! from: [-10 1 1]
*** Where: make
*** Stack: 
>> make date! [1 1 -10]
== 1/Jan/-10
```



Comments:
--------------------------------------------------------------------------------

On 2017-07-11T16:51:56Z, greggirwin, commented:
<https://github.com/red/red/issues/2882#issuecomment-314505697>

    The docs state that negative years should always be in the third position.

