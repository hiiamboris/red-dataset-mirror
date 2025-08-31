
#122: IF/EITHER as-logic struct/member crashes
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/122>

Snippet:

```
if as-logic session/handle [
```

Error:

```
*** Compiler Internal Error: Script Error : first expected series argument of type: series pair event money date object port time tuple any-function library struct event 
*** Where: opposite? 
*** Near:  [first select/skip opp-conditions cond 2]
```



Comments:
--------------------------------------------------------------------------------

On 2011-07-02T13:28:51Z, dockimbel, commented:
<https://github.com/red/red/issues/122#issuecomment-1489356>

    Please, provide complete working code examples or at least a reference to another ticket where the missing code parts can be found. Do not assume that issues are processed in ascending ID number order.

--------------------------------------------------------------------------------

On 2011-07-02T14:51:13Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/122#issuecomment-1489551>

    There was no other code part, except that obviously, the conditional needs to be completed. I try to reduce observed bugs to make the problem smaller.

--------------------------------------------------------------------------------

On 2011-07-02T15:10:19Z, dockimbel, commented:
<https://github.com/red/red/issues/122#issuecomment-1489596>

    I was referring to `session/handle` not being defined here.

