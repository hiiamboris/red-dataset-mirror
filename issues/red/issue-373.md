
#373: ROUTINE cannot marshal logic! return value
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/373>

According to the preliminary announcement, ROUTINE marshals logic! but:

```
Red []

zero?: routine [
    value           [integer!]
    return:         [logic!]
][
    value = 0
]
print zero? 0
```

Compiling to native code... 

**\* Compilation Error: undefined symbol: red/logic/box 
**\* at line: 122 
**\* near: [
    logic/box 0 = integer/get r_arg 
    stack/unwind 
    natives/print\* 
    stack/unwind
]



Comments:
--------------------------------------------------------------------------------

On 2013-01-09T12:25:19Z, dockimbel, commented:
<https://github.com/red/red/issues/373#issuecomment-12041842>

    Even after this fix, your code will not work. There is a specific feature for routine I need to explain first:
    
    Routine names are not decorated when compiled to Red/System code. This means that your routine name `zero?` will collide with the `zero?` macro in Red/System. So, you need to provide routine names that will not collide with Red/System keywords or identifiers used in runtime library. I had to design it that way in order to be able to call routines from themselves (recursive call), from other routines or from inlined Red/System code in #system blocks.
    
    The alternative would be to decorate routine names generated at Red/System level with a unique pattern, but that would mean users will need to know the decoration scheme and use it in their code, which would result in quite ugly code (and probably pissed-off users ;-)).
    
    For example, with decorations on, the fibonacci routine example would become: 
    
    ```
    fibonacci: func [
        n   [integer!]
    ][
        either n < 2 [
            n
        ][
            (r_fibonacci n - 1) + (r_fibonacci n - 2)
        ]
    ]
    
    ```
    
    I used a simple decoration pattern (`r_`) in this example, but such case could theoretically still clash with existing Red/System code (we don't have any `r_` prefix in the Red/System runtime fortunately). To avoid that, I usually suffix the internal decoration patterns with a unique number, but that would be impossible to guess for users.
    
    So, now that you have the full picture, what do you think would be the best approach, keep the current behavior (with warnings about name clashes in the docs), or force the users to remember a weird routine naming convention?

--------------------------------------------------------------------------------

On 2013-01-09T12:50:23Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/373#issuecomment-12043045>

    I considered that, but thought it might be no problem because zero? is a macro and perhaps the definition of routine names is not subjected to preprocessing. Actually, it works now. :-) Even like this:
    
    ```
    zero?: routine [
        value           [integer!]
        return:         [logic!]
    ][
        zero? value
    ]
    ```
    
    Obviously, the current design is the best choice.

--------------------------------------------------------------------------------

On 2013-01-09T14:16:25Z, dockimbel, commented:
<https://github.com/red/red/issues/373#issuecomment-12045733>

    Yes it works, but you wouldn't be able to make it recursive for example or call it from another routine body. In this specific case, it doesn't matter, but in the general case it can be an annoyance. We will see if it works well enough as is in the next months...

