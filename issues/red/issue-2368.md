
#2368: The #get directive does not allow paths ending in something else than a word! value
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2368>

In Red/System, I was trying to determine the handle on the Screen, starting (naively) with
```
#get system/view/screens/1
```
This gave a compiler internal error:
```
*** Red Compiler Internal Error: Script Error : get-word-index expected name argument of type: word 
*** Where: process-get-directive 
*** Near:  [unless idx: get-word-index/with last spec] 
```
I see in `%gui.reds` that the indexing of the block `system/view/screens` must be done laboriously in Red/System code.
(a) The compiler error is to be avoided, don't you think?
(b) The restriction seems too strong, since the evaluation is done by the Red compiler which can handle arbitrary (static) expressions.


Comments:
--------------------------------------------------------------------------------

On 2017-02-16T06:00:58Z, dockimbel, commented:
<https://github.com/red/red/issues/2368#issuecomment-280239431>

    The fix provides a check for the argument path, to ensure it contains only words.
    
    `#get` is meant to get the value of a Red word from global context, or a local context using a path accessor. It is not meant to evaluate arbitrary paths or expressions. This could be useful, but would require a new compilation directive, lik `#do` or `#eval`. I am not sure how useful such feature would be, as you can in most cases just use `#call` on a Red function.

