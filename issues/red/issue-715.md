
#715: String corruption with control characters
================================================================================
Issue is closed, was reported by kealist and has 14 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/715>

I saw some string corruption today with odd control characters.

```
red>> append "blah" "blah^2"
== "blah2"
```



Comments:
--------------------------------------------------------------------------------

On 2014-03-06T11:38:23Z, dockimbel, commented:
<https://github.com/red/red/issues/715#issuecomment-36847293>

    It is a lexer issue:
    
    ```
    red>> "blah^2"
    == "2"
    ```

--------------------------------------------------------------------------------

On 2016-09-12T05:01:34Z, rebolek, commented:
<https://github.com/red/red/issues/715#issuecomment-246249151>

    Currently the results are inconsistent between interpreter and compiler:
    
    0.6.1 console behaviour: 
    
    ```
    red>> append "blah" "blah^2"
    == "blahblah2"
    ```
    
    0.6.1 compiled behaviour:
    
    ```
    ; append "blah" "blah^2"
    ; "blahblah^^2"
    ```

--------------------------------------------------------------------------------

On 2018-12-05T08:39:49Z, bitbegin, commented:
<https://github.com/red/red/issues/715#issuecomment-444403548>

    https://github.com/red/red/pull/3633 will be good fix for this?
    
    ```
    >> probe append "blah" "blah^^2"
    "blahblah^^2"
    == "blahblah^^2"
    >> probe append "blah" "blah^2"
    "blahblah^^2"
    == "blahblah^^2"
    >> 
    ```

--------------------------------------------------------------------------------

On 2018-12-05T08:42:04Z, bitbegin, commented:
<https://github.com/red/red/issues/715#issuecomment-444404206>

    if it's ok, i will add some tests

--------------------------------------------------------------------------------

On 2018-12-05T11:53:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/715#issuecomment-444459795>

    @bitbegin I think it may make more sense to fix https://github.com/red/red/blob/master/lexer.r (compiler behavior). For consistency with R2 and R3 (they skip single caret chars when they don't make a proper escape sequence).

--------------------------------------------------------------------------------

On 2018-12-05T17:48:59Z, greggirwin, commented:
<https://github.com/red/red/issues/715#issuecomment-444578225>

    @bitbegin tests aren't passing for your PR, so that would need to be addressed first.
    
    From the historical messages, if it's only the compiler that now has the issue, we should compare %lexer.r and %lexer.red for how each handles this.

--------------------------------------------------------------------------------

On 2018-12-05T20:10:56Z, meijeru, commented:
<https://github.com/red/red/issues/715#issuecomment-444628700>

    In the specs document it reads: "[...] `^` will be ignored in front of any single character with which it does not form (the beginning of) an `<escaped-character>` or `<hexadecimal-codepoint>`. Thus e.g. `^3` yields the same as `3`." This behaviour would be consistent  with R2/3, and the lexer(s) could be adapted accordingly.

