
#5147: Question on the behavior of parsing integers
================================================================================
Issue is closed, was reported by ALANVF and has 6 comment(s).
[status.built] [status.tested] [test.written] [type.design]
<https://github.com/red/red/issues/5147>

1) `to integer! "3.4e2"` returns `3`, despite the fact that it is formatted as a float

2) `to integer! "3e2"` returns an error because of `e`, despite the fact that it's the same thing without a decimal point

3) `to integer! "3 foo"` returns an error because of `foo`, despite the fact that it is separated from the `3`

Are all 3 of these behaviors intentional?
In R2 and R3:
- \# 1 returns `340` because the string is parsed as a float and then converted to an integer.
- \# 2 returns `300`, because the string is parsed as a float (without a decimal point) and then converted to an integer
- \# 3 also errors

Because \# 3 errors, this proves that the `.` intentionally stops the parsing of an integer in Red, or else `3.4e2` would also error since `.` is not a digit.

So now the question is: do we follow the behavior of R2/R3, stick with the current behavior, or try to clarify the current behavior by fixing/simplifying it?



Comments:
--------------------------------------------------------------------------------

On 2022-05-25T22:03:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/5147#issuecomment-1137887670>

    options:
    - consume just digits, error out if something else encountered
    - consume just digits, no errors if at least one found
    - consume digits and `'` (as now), but no errors if at least one found
    - load just float/integer, convert loaded thing to integer
    - load any number, convert loaded thing to integer
    - load any content, convert loaded thing to integer

--------------------------------------------------------------------------------

On 2022-05-27T16:12:58Z, dockimbel, commented:
<https://github.com/red/red/issues/5147#issuecomment-1139760246>

    `to`  on `integer!`, `float!` and `tuple!`  does not `load` the string, it does a very fast [scanning](https://github.com/red/red/blob/master/runtime/tokenizer.reds#L15) to convert a literal integer in string representation to an integer value (other scalar types should be added in the future). If a smarter conversion is needed, the value can be first loaded:
    ```
    >> 3e2
    == 300.0
    >> to-integer load "3.4e2"
    == 340
    >> to-integer load "3e2"
    == 300
    >> to-integer first load "3 foo"
    == 3
    ```
    
    In Rebol, `load` is always implied when `to`'s second argument is a string, so the user has no option for a faster conversion for scalars than invoking the lexer engine.
    
    In Red's old scanner, the performance difference was huge between the lexer and such specialized tokenizing routines. With the new one, I can't remember how big was the difference, I just remember testing it and concluding that it was worth keeping it. Though, feel free to recheck that.
    
    I think we can stick to the "consume just digits, error out if something else encountered" rule.
    

--------------------------------------------------------------------------------

On 2022-08-30T16:30:14Z, dockimbel, commented:
<https://github.com/red/red/issues/5147#issuecomment-1231898973>

    > I think we can stick to the "consume just digits, error out if something else encountered" rule.
    
    Implemented. Only `'` character is now accepted (and skipped) by `to-integer`.

