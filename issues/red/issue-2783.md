
#2783: trim is not defined on maps objects or errors, in spite of spec saying so
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2783>

```
>> spec-of :trim
== [
    {Removes space from a string or NONE from a block or object} 
    series [series! object! error! map!] 
    /head "Removes only from the head" 
    /tail "Removes on...
>> trim #()
*** Script Error: trim does not allow map! for its series argument
*** Where: trim
*** Stack: 
>> trim object [a: none]
*** Script Error: trim does not allow object! for its series argument
*** Where: trim
*** Stack: 
>> trim try [1 / 0]
*** Script Error: trim does not allow error! for its series argument
*** Where: trim
*** Stack: 
```



Comments:
--------------------------------------------------------------------------------

On 2017-06-11T13:55:18Z, meijeru, commented:
<https://github.com/red/red/issues/2783#issuecomment-307630502>

    See also #2521., which points out another defect in the argument spec.

