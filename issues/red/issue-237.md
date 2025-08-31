
#237: Can't compile function parameter referencing type from CONTEXT
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 10 comment(s).
[status.dismissed] [Red/System]
<https://github.com/red/red/issues/237>

```
c: context [
    s!: alias struct! [dummy [integer!]]
]

f: function [
    p [c/s!]
][
]
```

**\* Compilation Error: invalid definition for function f: [
    p [c/s!]
] 
**\* in file: %/users/administrator/Red/Red-SQLite/examples/bug.reds 
**\* at line: 7 
**\* near: [function [
        p [c/s!]
    ] []]



Comments:
--------------------------------------------------------------------------------

On 2012-08-22T17:20:34Z, dockimbel, commented:
<https://github.com/red/red/issues/237#issuecomment-7941871>

    Path are not accepted in datatypes specifications. Making aliases namespace-aware was meant for local use only.

--------------------------------------------------------------------------------

On 2012-08-22T20:29:29Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/237#issuecomment-7948237>

    Most aliases are defined for outside use, interfacing with the binding or other module in the namespace. Without this ability, one is forced to always use these modules in a WITH construct, which is not always convenient. For example, it will be impossible to prevent some namespace conflicts. Alternatively, the aliases definitions would have to remain outside the namespace and would still have to be prefixed, which defeats the purpose of having aliases be context sensitive.

--------------------------------------------------------------------------------

On 2012-08-22T21:43:15Z, dockimbel, commented:
<https://github.com/red/red/issues/237#issuecomment-7953070>

    If the point is just to have a syntactic sugar by letting the compiler do the prefixing for aliases definition, it's a very costly sugar (both in internal code size and added complexity). I think that prefixing manually would then be a much better solution. 
    
    I have made aliases context-sensitive for local usage, to allow making aliases with same names in different contexts without having to prefix them. Having to support path! types in datatype specifications is just not possible at this point, it would impact almost all compiler internals, from loader to all native code emitters, it would be a huge work, for a minimal gain.
    
    In your code example, if `f` is a global function, then it should use a globally defined alias, the alternative would be to move `f` inside the context.

--------------------------------------------------------------------------------

On 2012-08-22T22:43:04Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/237#issuecomment-7954626>

    I was expecting this would be difficult, but I wouldn't call it sugar. If you write a module that uses aliases in the interface specification, one can use the module from a WITH clause (as in issue #238). Semantically, it should be equivalent to not use WITH but use paths to all words in the CONTEXT. In some cases, this can make the code less confusing by being more specific, and in more serious cases, it can prevent conflicts.
    
    If modules can only be used from a WITH, it becomes more necessary to make sure that module words don't conflict with other modules, even though one cannot know all other modules in existence or that will exist in the future. This undermines the purpose of namespaces.

--------------------------------------------------------------------------------

On 2012-10-25T17:25:39Z, dockimbel, commented:
<https://github.com/red/red/issues/237#issuecomment-9786267>

    Red/System contexts are simple namespaces, they are not modules (in the R3 sense). We might add module support along with compilation modularization support. In the meantime, I'm closing this ticket as I don't plan to support path notation for datatypes. Datatypes needs to globally defined for global use or locally defined for local use. If that's not enough, we'll need to search for another solution than changing function's spec format. I'm dismissing this ticket for now. If the need arises again, it will need to be formulate as a wish for Red/System v2.

