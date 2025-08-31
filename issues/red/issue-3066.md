
#3066: When accessing a tuple with a out-of-border index, R3 and Red act differently 
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/3066>

In R3: 
```Red
>> tp: 1.2.3
== 1.2.3
>> tp/4
== none
```
In Red:
```Red
>> tp: 1.2.3
== 1.2.3
>> tp/4
*** Script Error: value out of range: none
*** Where: catch
*** Stack:  
```


Comments:
--------------------------------------------------------------------------------

On 2017-10-11T09:10:05Z, dockimbel, commented:
<https://github.com/red/red/issues/3066#issuecomment-335746735>

    I think an error is more helpful in such case than a silent `none`. If compelling use cases for `none`  are proposed, we can re-examine such choice.

