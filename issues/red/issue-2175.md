
#2175: In the interpreter, pick b 1 and b/1 are not equivalent if b/1 is a function 
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2175>

Note: I have not tested this in the compiler.

```
red>> f: func [x][print x]
== func [x][print x]
red>> b: reduce [:f]
== [func [x][print x]]
red>> type? pick b 1
== function!
red>> type? b/1
*** Script Error: 1 is missing its x argument
*** Where: type?
```

It looks like `pick` does a `get` and `eval-path` does not. Moreover, the error message is not entirely helpful.



Comments:
--------------------------------------------------------------------------------

On 2016-08-16T21:56:23Z, greggirwin, commented:
<https://github.com/red/red/issues/2175#issuecomment-240252199>

    The behavior is by design (otherwise you would have to `do` every path), but maybe the error message could include the path info to make it nicer. R2 works the same way.

--------------------------------------------------------------------------------

On 2016-08-17T06:58:24Z, meijeru, commented:
<https://github.com/red/red/issues/2175#issuecomment-240329340>

    (1) This merits some documentation, I think (2) The error message should mention the function rather than the path, if possible

--------------------------------------------------------------------------------

On 2016-08-27T07:19:42Z, dockimbel, commented:
<https://github.com/red/red/issues/2175#issuecomment-242901671>

    Paths evaluate their referenced value, otherwise you wouldn't be able to use refinements on functions and expect the function to still be called (e.g. `append/only`).
    
    The error message has been fixed to refer to the path value.

