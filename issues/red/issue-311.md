
#311: decorate-func in Red compiler is too simplistic
================================================================================
Issue is closed, was reported by meijeru and has 12 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/311>

In Red it is allowed - I suppose - to define functions within functions, which have names that duplicate other function names. Just prefixing `f_` to these names leads to clashes in the Red/System compiler, because in Red/System function names must be globally unique. Try

```
f: func[ ][f: func[ ][ ]]
```

`decorate-func` should probaly generate unique names  



Comments:
--------------------------------------------------------------------------------

On 2012-11-21T12:43:53Z, dockimbel, commented:
<https://github.com/red/red/issues/311#issuecomment-10595457>

    Yes, it is allowed, but right now, the compiler is probably not able to generate the right code for recursive function construction. Actually, I think such case of function names clashing should be caught by Red compiler and output an error. Anyway, name clashing is a minor problem here.
    
    Red compiler does statically compile functions (for now), so the nested function gets compiled too, while in REBOL, it will be evaluated in a lazy way. See how it works in R2:
    
    ```
    >> f: func[ ][f: func[ ][ ]]
    >> probe :f
    func [][f: func [] []]
    >> f
    >> probe :f
    func [][]
    ```
    
    As you can see overwriting happens in R2 (probably the same in R3), and it is destructive (outer function is lost). So we probably want to avoid letting users shoot themselves in the foot like that. REBOL can't do it _or can, but too costly_ because it is purely interpreted, but Red compiler can caught such cases at compile time and report an error.
    
    So, do you agree with raising a compilation error in such case, or do you see a better, more useful option?

--------------------------------------------------------------------------------

On 2012-11-21T13:45:36Z, meijeru, commented:
<https://github.com/red/red/issues/311#issuecomment-10597295>

    I am surprised that R2 (and R3 - I checked) act like this. Given that fact, I think a compilation error is the simplest. Question, should it come from Red or from Red/System, as is now the case? Also, I suppose that duplication of function names (which can be useful in itself) can always be taken care of by wrapping them in contexts (as you do now in the <datatype>.reds files.

--------------------------------------------------------------------------------

On 2012-11-21T13:51:44Z, dockimbel, commented:
<https://github.com/red/red/issues/311#issuecomment-10597492>

    If you are thinking about using Red/System contexts to avoid the naming clash, it could be doable, but probably costly to carry out in Red compiler (will have to mix word and path for handling names, it will result in a lot of extra code to deal with it).
    
    So, I think we should just let Red compiler catch it and re-examine that once we get run-time function construction ability.

--------------------------------------------------------------------------------

On 2012-11-21T14:14:27Z, meijeru, commented:
<https://github.com/red/red/issues/311#issuecomment-10598295>

    I was more thinking of the Red user who has a genuine need for functions with the same name. Red will have contexts, won't it?

--------------------------------------------------------------------------------

On 2012-11-21T14:55:11Z, dockimbel, commented:
<https://github.com/red/red/issues/311#issuecomment-10599784>

    Yes, there will be objects that will act as namespace containers (same as in REBOL), and probably also modules (basically objects with metadata and controlled access to global context).

--------------------------------------------------------------------------------

On 2012-12-06T22:28:36Z, dockimbel, commented:
<https://github.com/red/red/issues/311#issuecomment-11109018>

    The latest version of the Red compiler does now generate different identifiers for function that uses same name, but in such case (function defined inside a function), it does not support (yet?) that the function name be declared as local (the compiler will generate a new unique name that will not be part of local variables anymore).

