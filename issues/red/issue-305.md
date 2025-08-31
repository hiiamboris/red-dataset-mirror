
#305: Red/System: rules for context names seem overly restrictive
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
[status.reviewed] [Red/System]
<https://github.com/red/red/issues/305>

It turns out that context names must not have been defined anywhere except as outer context!

Thus

```
c: 1 f: func [][c: context [a: 1]]
```

gives an eror even though

```
c: context [a: 1] f: func [/local c][c: 1]
```

is perfectly acceptable. In both cases, the scope of any use of `c` is easily identifiable. 

What's more, the following is allowed:

```
c: context [c: context [c: 1]]
```



Comments:
--------------------------------------------------------------------------------

On 2012-11-24T15:38:28Z, dockimbel, commented:
<https://github.com/red/red/issues/305#issuecomment-10678775>

    I am not sure to understand what is the issue. In the first code example, context is defined inside a function body, which is not allowed (it is possible that the current implementation let it pass, in such case, we should block it and raise an error). Moreover, in the first code example, both `c` assignments refers to the same variable in the global context, so raising an error seems like the best option there.

--------------------------------------------------------------------------------

On 2012-11-25T20:22:40Z, meijeru, commented:
<https://github.com/red/red/issues/305#issuecomment-10697855>

    I have not read anywhere that a context may not be defined inside a function body and indeed the current implementation lets it pass. Thus both the Red/System compiler and the specification need to be adapted.
    
    The third example is somewhat disturbing, I find. It would probably be better to increase the strictness even more, then. 

--------------------------------------------------------------------------------

On 2019-12-22T12:46:24Z, Crystal-RainSlide, commented:
<https://github.com/red/red/issues/305#issuecomment-568258924>

    Re-running those 3 lines of code in Red 0.6.4 under Windows:
    ``` Red
    >> c: 1 f: func [][c: context [a: 1]]
    == func [][c: context [a: 1]]
    ```
    ``` Red
    >> c: context [a: 1] f: func [/local c][c: 1]
    == func [/local c][c: 1]
    ```
    ``` Red
    >> c: context [c: context [c: 1]]
    == make object! [
        c: make object! [
            c: 1
      ...
    ```
    Molded result of the last one:
    ``` Red
    make object! [
        c: make object! [
            c: 1
        ]
    ]
    ```
    Is this issue resolved already?

--------------------------------------------------------------------------------

On 2019-12-22T13:06:00Z, 9214, commented:
<https://github.com/red/red/issues/305#issuecomment-568260265>

    @Crystal-RainSlide you're confusing Red with Red/System.

--------------------------------------------------------------------------------

On 2021-09-18T14:22:29Z, dockimbel, commented:
<https://github.com/red/red/issues/305#issuecomment-922285202>

    I see nothing to fix or change in the code examples. Contexts cannot be defined in functions, someone can add that to R/S docs if one thinks it is worth it.

