
#1097: reform behaviour different than rebol?
================================================================================
Issue is closed, was reported by RAbraham and has 6 comment(s).
<https://github.com/red/red/issues/1097>

Hi,
I was playing with Red and I got this:

```
red>> reform [ 1 + 2 3 + 4]
*** Script error: reform has no value
*** Where: try
```

In Rebol2,

```
>> reform [ 1 + 2 3 + 4]
== "3 7"
```

Would this be a bug or is the semantics different in Red?

Thanks,
Rajiv



Comments:
--------------------------------------------------------------------------------

On 2015-04-20T01:18:20Z, x8x, commented:
<https://github.com/red/red/issues/1097#issuecomment-94331953>

    `has no value` probably means it has not yet been implemented.
    you can use `form reduce` in the meantime
    
    ``` rebol
    red>> form reduce [ 1 + 2 3 + 4]
    == "3 7"
    ```

--------------------------------------------------------------------------------

On 2015-04-20T06:33:22Z, dockimbel, commented:
<https://github.com/red/red/issues/1097#issuecomment-94370351>

    Not implemented yet, but you can create it easily:
    
    ```
    red>> reform: func [spec [block!]][form reduce spec]
    == func [spec [block!]][form reduce spec]
    red>> reform [1 + 2 3 + 4]
    == "3 7"
    ```
    
    It has not been added yet, as we need to re-examine how we want to handle `reform` vs `form` vs `join` vs `rejoin` and see if we can improve it from Rebol.

--------------------------------------------------------------------------------

On 2015-04-20T16:00:13Z, RAbraham, commented:
<https://github.com/red/red/issues/1097#issuecomment-94493277>

    Got it, thank you.

