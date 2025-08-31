
#142: Multiple type-casting now allowed??
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.deferred] [type.wish] [Red/System]
<https://github.com/red/red/issues/142>

Can #132 be closed now? I read in the latest fix to the Red runtime, an expression like

```
frame/bottom: as int-ptr! (as byte-ptr! frame) + size? node-frame!
```

This looks like a multiple type-casting to me...



Comments:
--------------------------------------------------------------------------------

On 2011-08-06T21:27:06Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/142#issuecomment-1746427>

    Is it? The inner one applies to one element of the expression, the outer one to the entire expression.

--------------------------------------------------------------------------------

On 2011-08-06T21:28:21Z, dockimbel, commented:
<https://github.com/red/red/issues/142#issuecomment-1746434>

    Well, technically it is two type castings occurring at two different levels of a multi-part expression. The following code, using two type casting one directly after the other, is still not allowed by the current implementation:
    
    ```
    as int-ptr! as byte-ptr! frame + size? node-frame!
    ```
    
    I will do a new code review tomorrow to see if I can figure out a simple way to support multiple (chained) type castings by keeping only the first one.

--------------------------------------------------------------------------------

On 2012-10-25T10:49:26Z, dockimbel, commented:
<https://github.com/red/red/issues/142#issuecomment-9773251>

    Moving this wish to [Red/System v2 wish list](https://github.com/dockimbel/Red/wiki/Red-System-v2-Wish-List).

