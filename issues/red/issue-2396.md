
#2396: There are 2 error messages for the same error
================================================================================
Issue is closed, was reported by ifgem and has 2 comment(s).
<https://github.com/red/red/issues/2396>

```
true and 1
*** Script Error: and does not allow integer! for its value2 argument
*** Where: and
100 and 2#{00001000}
*** Script Error: binary! type is not allowed here
*** Where: and
```
Also:
```
1 and 10x10
*** Script Error: and does not allow pair! for its value2 argument
*** Where: and
10x10 and 1
== 0x0
```


Comments:
--------------------------------------------------------------------------------

On 2017-01-02T00:01:50Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2396#issuecomment-269925608>

    1. They are not the same error. 1 is an integer!, 2#{00001000} is a binary! They are different types. The error messages are correct in that sense. It could perhaps be improved to "the second argument (integer!) is not compatible with the first argument (logic!) for this operation (and).
    
    2. This is another case where the datatype of the second argument does not "match" the first. Pragmatically, all though pair is a scalar value (as it is contained in its value block), in terms of operations such as ```and```, it is basically treated as a vector! with two values. It would be better to discuss this further on Gitter.

