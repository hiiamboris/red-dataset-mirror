
#2895: Some chars in string cannot be converted to binary
================================================================================
Issue is closed, was reported by rebolek and has 10 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2895>

See this example:

```
>> #"^(10FFFF)"
== #"􏿿"
>> mold #"^(10FFFF)"
== {#"􏿿"}
>> to binary! mold #"^(10FFFF)"
*** Script Error: Invalid char! value: #"􏿿"
*** Where: to
*** Stack:
```

It is valid char, so it should work IMO.


Comments:
--------------------------------------------------------------------------------

On 2017-07-17T08:25:11Z, meijeru, commented:
<https://github.com/red/red/issues/2895#issuecomment-315693958>

    According to Unicode (`http://www.unicode.org/charts/PDF/U10FF80.pdf`) both `10FFFE` and `10FFFF` are "Noncharacters", "These codes are intended for process-internal uses"

--------------------------------------------------------------------------------

On 2017-07-17T08:35:47Z, rebolek, commented:
<https://github.com/red/red/issues/2895#issuecomment-315696071>

    True, but they can be represented as `char!` in Red. So either forbid it (which I think is a wrong solution, lot (all) of first 32 ASCII codepoints are non-characters too), or fix it.
    
    Anyway, take a look this:
    ```
    >> to binary! mold #"^(10FFFA)"
    == #{2322F48FBFBA22}
    >> to binary! mold #"^(10FFFD)"
    == #{2322F48FBFBD22}
    >> to binary! mold #"^(10FFFE)"
    == #{2322F48FBFBE22}
    >> to binary! mold #"^(10FFFF)"
    *** Script Error: Invalid char! value: #"􏿿"
    *** Where: to
    *** Stack:
    ```
    
    Especially this: 
    ```
    >> to binary! mold #"^(10FFFE)"
    == #{2322F48FBFBE22}
    ```
    
    So `10FFFE` is fine and `10FFFF` not. Definitely a bug.

--------------------------------------------------------------------------------

On 2017-07-17T08:39:01Z, meijeru, commented:
<https://github.com/red/red/issues/2895#issuecomment-315696710>

    Possibly a `<` instead of a `<=`  somewhere...

--------------------------------------------------------------------------------

On 2017-07-17T09:58:09Z, meijeru, commented:
<https://github.com/red/red/issues/2895#issuecomment-315713251>

    Indeed! `%runtime/unicode.reds` line 62 is the culprit, and see also line 56...

--------------------------------------------------------------------------------

On 2017-07-17T11:25:19Z, rebolek, commented:
<https://github.com/red/red/issues/2895#issuecomment-315729488>

    @meijeru Thanks for looking into it! I checked it locally and it seems that changing line 62 fixes the problem (line 56 is fine, molding #"^(FFFF)" works). I've created pull request for it.

