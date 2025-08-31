
#3653: expand-directives allows a paren argument, but this always errors out
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3653>

**Describe the bug**
The argument to `expand-directives` may be a `paren!` value (why?), but this always gives an error because in the body it is used as argument to `expand` which does not allow a `paren!` value.

**To Reproduce**
>> expand-directives quote (a b c)
*** Script Error: expand does not allow paren! for its blk argument
*** Where: expand

**Expected behavior**
Not documented (at least I have not found it).

**Platform version(please complete the following information):**
```
Presumably all
```


Comments:
--------------------------------------------------------------------------------

On 2018-12-12T20:16:19Z, greggirwin, commented:
<https://github.com/red/red/issues/3653#issuecomment-446728705>

    Need to clarify the `expand` func vs preprocessor `expand` as well.

--------------------------------------------------------------------------------

On 2018-12-13T06:35:49Z, 9214, commented:
<https://github.com/red/red/issues/3653#issuecomment-446858428>

    `do/expand` goes here too.

--------------------------------------------------------------------------------

On 2018-12-15T20:21:23Z, endo64, commented:
<https://github.com/red/red/issues/3653#issuecomment-447595282>

    `expand-directives` defined only in `preprocessor.r` file and calls `expand` defined in that file, not the one defined in Red (`engine.red` file), which is a bit confusing.
    
    From Red side it looks like `expand-directives` calls `expand` and `expand` calls `expand-directives`, would be better have different name in `preprocessor.r` for `expand`.

--------------------------------------------------------------------------------

On 2019-08-20T11:45:12Z, dockimbel, commented:
<https://github.com/red/red/issues/3653#issuecomment-522976593>

    The `expand` call inside `expand-directives` has 2 arguments and a `/clean` refinement that the console's `expand` does not have. That should be a strong hint that it's a different function from another context. In %preprocessor.r, it's called in several places. Using functions with the same name in different contexts should not be an issue in Redbol.
    
    In case of doubt, you can always query the context of word from the console:
    ```
    b: body-of :expand-directives
    context? b/6/1      ;-- second `expand` call
    
    == make object! [
        exec: make object! [
            config: none
        ]
        protos: ...
    ```

