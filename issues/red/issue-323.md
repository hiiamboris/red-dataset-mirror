
#323: loop without count gives strange error message, other syntactical mistakes do too
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/323>

I tested a few typical mistakes like forgetting the counter, or the index with `repeat`, or the brackets arount the block to be executed in the loop. I suppose that ultimately, there should be no "compiler internal errors", but I will admit that it is difficult to be prepared for all cases... One example:

```
loop []

-= Red Compiler =-
Compiling red/tests/mytest.red ...
*** Red Compiler Internal Error: Script Error : tail? expected series argument of type: series port bitset
*** Where: comp-block
*** Near:  [not tail? pc]
```



Comments:
--------------------------------------------------------------------------------

On 2012-11-29T12:43:41Z, PeterWAWood, commented:
<https://github.com/red/red/issues/323#issuecomment-10845771>

    Whilst the compiler can trap 
    
    ``` rebol
    
    loop []
    
    loop [print "a"]
    
    ```
    
    Doesn't there also need to be a runtime error for cases the compiler cannot identify?

--------------------------------------------------------------------------------

On 2012-11-29T16:09:31Z, dockimbel, commented:
<https://github.com/red/red/issues/323#issuecomment-10854079>

    This case should be caught by the argument type checker (when implemented). Anyway, I have added an explicit check for block value when they are expected.

