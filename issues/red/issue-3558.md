
#3558: PICK with a block! index has no meaning
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/3558>

```
>> pick [a b] []
== none
>> pick 1x2 [1]
*** Script Error: value out of range: [1]
*** Where: pick
*** Stack: 
>> pick 1.2.3 [1]
*** Script Error: value out of range: 0
*** Where: pick
*** Stack:  
>> pick now/date [day]
*** Script Error: value out of range: [day]
*** Where: pick
*** Stack:  
>> pick now/time [hours]
*** Script Error: value out of range: [hours]
*** Where: pick
*** Stack:  
```
`block!` should be forbidden from the `index` argument type spec, as it has no semantics attached with any of the allowed types for the `series` argument.


Comments:
--------------------------------------------------------------------------------

On 2018-10-11T01:43:11Z, dockimbel, commented:
<https://github.com/red/red/issues/3558#issuecomment-428789185>

    `block!` index is used for bitsets to specify a range, so false alarm.

