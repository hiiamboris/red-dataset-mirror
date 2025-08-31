
#2176: Using `keep` outside `collect` crashes interpreter.
================================================================================
Issue is closed, was reported by rgchris and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2176>

```
accumulate: take stuff: collect [keep :keep]
accumulate 1
```

Results in:

```
*** Runtime Error 1: access violation
```



Comments:
--------------------------------------------------------------------------------

On 2016-08-17T16:02:50Z, rgchris, commented:
<https://github.com/red/red/issues/2176#issuecomment-240460177>

    (not suggesting using `keep` in such a way _should_ work, this is just related to the crash)

--------------------------------------------------------------------------------

On 2016-08-27T06:47:47Z, dockimbel, commented:
<https://github.com/red/red/issues/2176#issuecomment-242900384>

    The crash is caused by an attempt to access a local word in `collect` from `keep` while `collect` frame is not on stack anymore. As both functions are compiled, there is currently no safeguards to prevent such crash to happen if `keep` is used outside of `collect`.  Support for functions defined in functions by the compiler is currently limited, so edge cases are likely to cause trouble. This will be improved in the future releases (before 1.0).
    
    For this specific case, `collect` is just a mezzanine for now, it should go native at some point and have specific support from compiler. Also, making `keep` a keyword in collected blocks instead of a function is an option to consider (in such case, the above code would error out on `:keep` access).

--------------------------------------------------------------------------------

On 2017-02-22T05:30:25Z, dockimbel, commented:
<https://github.com/red/red/issues/2176#issuecomment-281573714>

    I figured out a way to catch this case and return an appropriate error:
    ```
    red>> accumulate: take stuff: collect [keep :keep]
    == func [v /only][either only [append/only collected v] [append collected v] v]
    red>> accumulate 1
    *** Script Error: collected word is not bound to a context
    *** Where: append
    ```

