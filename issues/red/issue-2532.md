
#2532: Math doesn't follow the arithmetic precedence for %, **
================================================================================
Issue is closed, was reported by ifgem and has 2 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/2532>

```
>> math [10 + 10 ** 2]
== 400
>> math [10 + 10 % 2]
== 0
```
Besides, shall the math dialect be implemented using expensive copy/deep and replace operations? It makes the dialect almost useless.


Comments:
--------------------------------------------------------------------------------

On 2017-04-02T11:48:45Z, dockimbel, commented:
<https://github.com/red/red/issues/2532#issuecomment-290981428>

    That function is really not meant to support more than just basic four operators. Though, contributions to extend it are welcome (if they are not too verbose). `math` is there just to make some kind of expressions more comfortable writing, it has no other ambitions. It is more of a proof-of-concept than a feature you would use in your actual code, as the Red evaluation rules are what we want.
    
    > Besides, shall the math dialect be implemented using expensive copy/deep and replace operations? It makes the dialect almost useless.
    
    That function is used in the picosheet demo, so is not useless. For the implementation, what alternative do you propose?

