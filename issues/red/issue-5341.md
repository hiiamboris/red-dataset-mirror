
#5341: `make op!` should now report an error on unsupported arg types
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/5341>

**Describe the bug**

Since get/lit-arg support was removed from ops with the `apply` merge, they are now acting to users confusion:
```
>> op: make op! f: func [:x :y] [?? x ?? y]
== make op! func [:x :y]
>> a op b
*** Script Error: a has no value
*** Where: catch
*** Near : a op b
*** Stack:  
```

**Expected behavior**

`make op!` resulting in an error if spec contains a get- or lit-arg.

**Platform version**
`Red 0.6.4 for Windows built 25-Jun-2023/19:24:44+03:00  commit #c69d476`


Comments:
--------------------------------------------------------------------------------

On 2023-06-26T14:37:58Z, dockimbel, commented:
<https://github.com/red/red/issues/5341#issuecomment-1607626539>

    It was only removed for the left operand:
    
    ```
    >>  op: make op! f: func [x :y] [?? x ?? y]
    == make op! func [x :y]
    >> 1 op a
    x: 1
    y: a
    ```
    
    The reason is that the left operand value is first fetched and evaluated, _then_ the op is fetched. So the evaluation being done on left operand, get/lit-arg cannot be supported there. 
    
    As a side note, this shows you how "unnatural" infix is for Redbol semantics. If it was not for math/boolean ops, we wouldn't support it at all.

--------------------------------------------------------------------------------

On 2023-07-13T16:20:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/5341#issuecomment-1634532109>

    @dockimbel it is still possible to make op! from a function with get/lit-arg first argument type, and gives unexpected results in op application.

--------------------------------------------------------------------------------

On 2023-07-18T16:21:37Z, dockimbel, commented:
<https://github.com/red/red/issues/5341#issuecomment-1640543592>

    @hiiamboris I had to make some changes in your code inside `fetch-next` function. Please review it and PR a better version if needed.

