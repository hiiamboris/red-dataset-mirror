
#603: (KEEP) COPY empty inconsistent
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 10 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/603>

red>> parse " " [collect [keep copy x " "]]
== [" "]
red>> parse "" [collect [keep copy x ""]]
== []
red>> x
== " "
red>> parse "" [collect [keep copy x 0 skip]]
== []
red>> x
== ""

I would expect COPY to always yield a string!, including an empty string on matching an empty string.



Comments:
--------------------------------------------------------------------------------

On 2013-12-17T10:58:48Z, dockimbel, commented:
<https://github.com/red/red/issues/603#issuecomment-30742104>

    There are several different issues there: KEEP behavior, COPY behavior and empty string matching.
    
    First issue:
    
    Red:
    
    ```
    red>>  parse "" [""]
    == true
    ```
    
    Rebol3:
    
    ```
    >> parse "" [""]
    == false
    ```

--------------------------------------------------------------------------------

On 2013-12-17T11:04:17Z, dockimbel, commented:
<https://github.com/red/red/issues/603#issuecomment-30742429>

    For the KEEP behavior, since the fix for #601, KEEP won't return anything if the input has not advanced, so an empty string will not be kept that way (it can still be kept using a paren expression like **keep ("")**).

--------------------------------------------------------------------------------

On 2013-12-17T19:42:52Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/603#issuecomment-30783583>

    I'd say Red is correct by matching an empty string, and R3 isn't. It's consistent with 0 SKIP.
    
    The biggest problem is COPY not setting its variable when an empty string is matched.
    
    It would be nice if KEEP could distinguish between not advancing input and COPY returning an empty string. Perhaps that would happen automatically when COPY sets its variable correctly?

--------------------------------------------------------------------------------

On 2013-12-19T02:18:28Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/603#issuecomment-30900182>

    Thanks. I see it hasn't affected KEEP.
    
    In the code for #601, I see there are different tests for match? and input advancing. Couldn't KEEP return an empty string when the rule matches but the input doesn't advance? That would allow me to simplify my code the most.
    
    You could still use COPY to force KEEP to treat a single char! as a string!.

--------------------------------------------------------------------------------

On 2017-02-21T12:34:08Z, dockimbel, commented:
<https://github.com/red/red/issues/603#issuecomment-281332513>

    KEEP will now accept empty series from COPY.

