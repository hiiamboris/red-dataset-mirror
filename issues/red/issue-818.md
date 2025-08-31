
#818: Invalid result of escaped char value
================================================================================
Issue is closed, was reported by Oldes and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/818>

```
red>> #"^(f)"
== "(f)"
red>> type? "a"
== string!
red>> type? #"^(f)"
== "(f)"
red>> type? #"^(0f)"
== char!
```

in REBOL2:

```
>> #"^(f)"
== #"^O"
>> #"^(0f)"
== #"^O"
```



Comments:
--------------------------------------------------------------------------------

On 2014-05-15T08:58:09Z, qtxie, commented:
<https://github.com/red/red/issues/818#issuecomment-43184404>

    @Oldes This is caused by the Red runtime lexer doesn't accept this form of `escape char`. In current implement, must have 2 - 6 hex numbers when use escape form.

--------------------------------------------------------------------------------

On 2014-05-19T22:24:29Z, dockimbel, commented:
<https://github.com/red/red/issues/818#issuecomment-43566110>

    @qtxie We could relax that restriction for escaped values, as they have special delimiters around them. The 2-6 limit was just added to reduce the risk of collision between integer hex notation and words. What do you think?

--------------------------------------------------------------------------------

On 2014-05-20T07:13:41Z, qtxie, commented:
<https://github.com/red/red/issues/818#issuecomment-43593221>

    @dockimbel Yes, I agree with you. I'll change the rule to accept it.

--------------------------------------------------------------------------------

On 2014-05-20T08:02:35Z, Oldes, commented:
<https://github.com/red/red/issues/818#issuecomment-43596759>

    Also it would be good to throw an error on invalid value. Now the # char seems to be skipped and rest is treated as a valid string!, which is not good behavior.
    EDIT: above is not true:) it does not return any type, so it's even more invalid.

--------------------------------------------------------------------------------

On 2016-09-08T06:49:54Z, rebolek, commented:
<https://github.com/red/red/issues/818#issuecomment-245509179>

    @qtxie You wrote that you’ll relax the rules, but current behaviour is:
    
    ```
    red>> #"^(f)"
    *** Syntax Error: invalid char! at {#"^^(f)"}
    *** Where: do
    ```
    
    Is it expected, or should it work as Rebol?

