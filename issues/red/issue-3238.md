
#3238: It's not possible to use hashes in DSL because of Red's preprocessor for interpreted code
================================================================================
Issue is closed, was reported by Oldes and has 2 comment(s).
<https://github.com/red/red/issues/3238>

In Rebol I have DSL, where I use hashes like `#if`. If I want to use the parse rule, which handle these `hash!` values in Red, Red tries to preprocess the code and fails with error like:

```
*** Preprocessor Error: Syntax error
*** Where: #if (valid: false) some
(halted)
```

So one cannot write own DSL in Red, which would use `hash!` datatypes... or is it possible to turn off the preprocessing?


Comments:
--------------------------------------------------------------------------------

On 2018-02-28T12:51:50Z, Oldes, commented:
<https://github.com/red/red/issues/3238#issuecomment-369229913>

    Ok.. I can use:
    ```
    #process off
    ```

