
#2873: `while` always returns `unset`
================================================================================
Issue is closed, was reported by 9214 and has 10 comment(s).
[type.wish]
<https://github.com/red/red/issues/2873>

This code:
```Red
probe while [true][break/return 42]
i: 1 probe while [i < 5][i: i + 1]
```
Results in:
```Red
unset
unset
```

IMO this is inconsistent with other iterators behavior - they always return result of last evaluated expression. Hence I expect result to be:
```Red
42
5
```


Comments:
--------------------------------------------------------------------------------

On 2017-07-10T12:15:51Z, meijeru, commented:
<https://github.com/red/red/issues/2873#issuecomment-314088231>

    The first result should indeed be 42, so that is a bug. For the second result: not only `while`, but also `loop`  and `remove-each` currently yield the `unset!` value. So it is not a question of inconsistency, but your expected behaviour would be a wish.

--------------------------------------------------------------------------------

On 2017-07-10T12:22:26Z, dockimbel, commented:
<https://github.com/red/red/issues/2873#issuecomment-314089543>

    @9214 There's a least one ticket already about the return value of iterator functions.

--------------------------------------------------------------------------------

On 2017-07-10T12:40:20Z, 9214, commented:
<https://github.com/red/red/issues/2873#issuecomment-314093345>

    @meijeru yes for `remove-each`, not sure about `loop`:
    ```Red
    i: 1 loop 5 [i: i + 1]
    ```
    Results in `6`.
    
    @dockimbel right, I should accustom myself to double-check open issues. 😞
    Anyway `break/return` example indeed looks like a bug. Same with `remove-each`:
    ```Red
    probe remove-each i [1 2 3] [break/return 42]
    ```
    Returns `unset`.

--------------------------------------------------------------------------------

On 2017-09-05T06:11:28Z, geekyi, commented:
<https://github.com/red/red/issues/2873#issuecomment-327080499>

    @dockimbel, did you mean https://github.com/red/red/issues/1706#issuecomment-229312382 ?
    > We need to decide on the return value for all iterators and then implement it for both compiler and interpreter.

--------------------------------------------------------------------------------

On 2018-04-25T06:23:32Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2873#issuecomment-384173651>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

