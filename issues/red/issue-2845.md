
#2845: WISH: /case and /tail refinements for `replace` function
================================================================================
Issue is closed, was reported by 9214 and has 8 comment(s).
[type.wish]
<https://github.com/red/red/issues/2845>

```Red
alphabet: {AaBbCc}
replace alphabet #"a" 1
probe alphabet
```
Results in
```Red
"1aBbCc"
```

As for now, it's impossible to `replace` `a` with `1`, since there's no `/case` refinement.

In Rebol2 `replace` spec looks like this:
```Rebol
>> ? replace
USAGE:
    REPLACE target search replace /all /case /tail

DESCRIPTION:
     Replaces the search value with the replace value within the target series.
     REPLACE is a function value.

ARGUMENTS:
     target -- Series that is being modified (Type: series)
     search -- Value to be replaced (Type: any)
     replace -- Value to replace with (will be called each time if a function) (Typ
e: any)

REFINEMENTS:
     /all -- Replace all occurrences
     /case -- Case-sensitive replacement
     /tail -- Return target after the last replacement position
```

So `/tail` could be an additional bonus for this wish.

@rebolek already proposed [one solution](https://gist.github.com/rebolek/f5731bc1d9234ef15e2d4fe31f4f531f) for `/case`


Comments:
--------------------------------------------------------------------------------

On 2017-06-30T05:12:45Z, rebolek, commented:
<https://github.com/red/red/issues/2845#issuecomment-312176759>

    It's not a solution, just a workaround as there's no `apply`-like functionality yet.

--------------------------------------------------------------------------------

On 2017-07-03T16:18:37Z, 9214, commented:
<https://github.com/red/red/issues/2845#issuecomment-312686581>

    ad hoc crutch
    ```Red
    alphabet: {AaBbCc}
    poke find/case alphabet #"A" 1 #"1"
    probe alphabet
    ```

--------------------------------------------------------------------------------

On 2017-07-04T03:27:28Z, geekyi, commented:
<https://github.com/red/red/issues/2845#issuecomment-312771863>

    See also #2228 

--------------------------------------------------------------------------------

On 2018-04-25T06:21:32Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2845#issuecomment-384173265>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

