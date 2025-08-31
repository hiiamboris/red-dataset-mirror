
#2629: make error! <integer> does not bind the error id to the message
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2629>

```
>> e: make error! 402
*** Math Error: attempt to divide by zero
*** Where: ???
>> get e/id
*** Script Error: zero-divide has no value
*** Where: get
>> e: try [ 1 / 0]
*** Math Error: attempt to divide by zero
*** Where: /
>> get e/id
== "attempt to divide by zero"
```



Comments:
--------------------------------------------------------------------------------

On 2017-04-26T07:49:52Z, meijeru, commented:
<https://github.com/red/red/issues/2629#issuecomment-297274984>

    I don't understand why in the first case the error message still comes out!

--------------------------------------------------------------------------------

On 2017-05-07T14:58:29Z, dockimbel, commented:
<https://github.com/red/red/issues/2629#issuecomment-299711786>

    > I don't understand why in the first case the error message still comes out!
    
    If an error! value is the last value evaluated in the console, it will get displayed by the console in its FORMed version.

