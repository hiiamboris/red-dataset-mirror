
#310: `either` expression evaluates to the condition value
================================================================================
Issue is closed, was reported by earl and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/310>

Simple demo code:

``` rebol
Red []
either true ["good"] ["bad"] ; == true, expected "good"
either false ["bad"] ["good"] ; == false, expected "good"
either 42 ["good"] ["bad"] ; == 42, expected "good"
```



Comments:
--------------------------------------------------------------------------------

On 2012-11-20T23:36:24Z, dockimbel, commented:
<https://github.com/red/red/issues/310#issuecomment-10579343>

    How do you see the intermediary outputs? Using `print` in front of expressions?
    
    EDIT: issue reproduced, so ignore theses questions.

