
#1802: Using refinement on a get argument does not work
================================================================================
Issue is closed, was reported by Zamlox and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/1802>

Following code in Red does not work:

```
fz: func [:fp][fp/ref "animal"]
ft: func [/ref p][print p]
fz ft
```

It gives the result:

```
*** Script error: path :fp/ref is not valid for word! type
*** Where: fz
```

The example does work in Rebol2



Comments:
--------------------------------------------------------------------------------

On 2016-04-12T21:50:50Z, dockimbel, commented:
<https://github.com/red/red/issues/1802#issuecomment-209117489>

    Red currently implements get/lit arguments following Rebol3, which errors out the same way as Red on such code pattern:
    
    ```
    >> fz: func [:fp][fp/ref "animal"]
    >> ft: func [/ref p][print p]
    >> fz ft
    ** Script error: path fp/ref is not valid for word! type
    ** Where: fz
    ** Near: fz ft
    ```
    
    We will re-examine this design choice in the future, but for now, it is behaving as expected, so this ticket will be closed. A formal [enhancement proposal](https://github.com/red/red/wiki/Red-Enhancement-Proposal-Process) could be filled, though, we will consider the change back to Rebol2  semantics anyway.

