
#213: Evaluation of function arguments is reversed in Red/System
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.problem] [type.wish] [Red/System]
<https://github.com/red/red/issues/213>

Arguments to a function call are evaluated in reverse order. This is more efficient for the compiler, and C compilers also seem to do it that way. However, it runs counter to intuition and how REBOL does it.

If it stays this way, it warrants a warning in the documentation.

If it's not too costly, it would be very nice to change this in the future.



Comments:
--------------------------------------------------------------------------------

On 2012-07-21T14:51:48Z, dockimbel, commented:
<https://github.com/red/red/issues/213#issuecomment-7153517>

    I agree with your remark, but that would be costly to implement. Currently, all functions (internal and external) need their arguments to be pushed on stack in reverse order. We would need to change the internal Red/System calling convention (should be quite easy) and find a way to reverse argument order on stack for all external calls (that use cdecl or stdcall conventions), which would have, I guess, a significant performance impact on each external call.
    
     In addition to that, the Red/System callbacks passed to external function would also need to reverse their received arguments at runtime, so they would pay the cost too. Same with typed functions, that need their argument to be in an array on stack (because last argument needs to be pushed first, so we would need to reverse order here too).
    
    On the bright side, such temporary stack storage before reversing order would probably cure issue #192.

--------------------------------------------------------------------------------

On 2013-05-05T12:26:01Z, PeterWAWood, commented:
<https://github.com/red/red/issues/213#issuecomment-17450985>

    Wish moved to v2 wish list on wiki.

