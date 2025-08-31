
#534: Can't get address of logic!
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 12 comment(s).
[type.wish] [Red/System] [status.wontfix]
<https://github.com/red/red/issues/534>

```
Red/System []

x: no
print :x
```

-= Red/System Compiler =- 
**\* Compilation Error: invalid datatype for a get-word: [logic!] 
**\* at line: 5 
**\* near: []



Comments:
--------------------------------------------------------------------------------

On 2013-09-17T11:28:49Z, dockimbel, commented:
<https://github.com/red/red/issues/534#issuecomment-24580779>

    The compiler is creating a pointer! type internally for dealing with get-words, but as there is no `pointer! [logic!]` type right now, supporting get-words on `logic!` cannot be done without deeply hacking the code in an _ad hoc_ way.
    
    This ticket should be turned into a wish for Red/System 2.0.

--------------------------------------------------------------------------------

On 2014-02-13T23:57:49Z, PeterWAWood, commented:
<https://github.com/red/red/issues/534#issuecomment-35041576>

    What is the use case for this feature?

--------------------------------------------------------------------------------

On 2014-02-14T00:25:15Z, dockimbel, commented:
<https://github.com/red/red/issues/534#issuecomment-35043392>

    Use case: passing a logic! value pointer as an argument to a function that might change the pointed logic value. It's a way to workaround the limitation of returning only one value from a function.

--------------------------------------------------------------------------------

On 2014-02-14T03:38:54Z, PeterWAWood, commented:
<https://github.com/red/red/issues/534#issuecomment-35052918>

    Personally, I feel that using a structure is a better workaround. However, I will add this to the Red/System 2.0 wish list.

--------------------------------------------------------------------------------

On 2014-02-14T03:56:03Z, PeterWAWood, commented:
<https://github.com/red/red/issues/534#issuecomment-35053595>

    Added to the Red/System 2.0 Wishlist. Wish 38.

--------------------------------------------------------------------------------

On 2014-02-14T12:20:40Z, dockimbel, commented:
<https://github.com/red/red/issues/534#issuecomment-35078812>

    Using a structure is a valid workaround, but the code is much more verbose as you need to declare a structure (and often an alias also) to handle it.

