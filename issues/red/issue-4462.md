
#4462: `Round` doesn't return an integer for float values by default
================================================================================
Issue is open, was reported by greggirwin and has 14 comment(s).
[type.review]
<https://github.com/red/red/issues/4462>

(Disregard this message. It has never worked this way.)

It used to, but the new `/` behavior leaks through now. You can work around it for now by using `/to` with an integer scale.

```
>> round 100 / 3
== 33.0
>> round/to 100 / 3 1
== 33
```
Expected:
```
>> round 100 / 3
== 33
```


Comments:
--------------------------------------------------------------------------------

On 2020-05-21T20:13:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/4462#issuecomment-632318657>

    > It used to
    
    It's not true though. I have versions down to 0.6.1, all return floats:
    ```
    red>> round 0.3
    == 0.0
    ```

--------------------------------------------------------------------------------

On 2020-05-21T20:40:54Z, greggirwin, commented:
<https://github.com/red/red/issues/4462#issuecomment-632333878>

    OK, I tested on an old one, but didn't note *which*. :^\

--------------------------------------------------------------------------------

On 2020-05-21T20:41:35Z, greggirwin, commented:
<https://github.com/red/red/issues/4462#issuecomment-632334181>

    Aha! Different test.
    ```
    >> round .3
    == 0.0
    >> round 100 / 3
    == 33
    ```

--------------------------------------------------------------------------------

On 2020-05-21T20:42:06Z, greggirwin, commented:
<https://github.com/red/red/issues/4462#issuecomment-632334434>

    Because the old `/` was returning an int. Duh.

--------------------------------------------------------------------------------

On 2020-05-21T20:43:05Z, greggirwin, commented:
<https://github.com/red/red/issues/4462#issuecomment-632334898>

    Renamed the ticket.

--------------------------------------------------------------------------------

On 2020-08-12T17:29:01Z, 9214, commented:
<https://github.com/red/red/issues/4462#issuecomment-673009528>

    So, should this ticket be closed, or do we want `round` to implicitly coerce rounded `float!` to an `integer!`?
    ```red
    >> round 33.3
    == 33.0
    >> round/to 33.3 1
    == 33
    >> round/to 33.3 1.0
    == 33.0
    ```
    OTOH this looks odd:
    ```red
    >> round/to 33.3 1:2:3
    == 0:00:00
    ```

--------------------------------------------------------------------------------

On 2020-10-25T19:26:01Z, greggirwin, commented:
<https://github.com/red/red/issues/4462#issuecomment-716198517>

    I vote to return an integer by default for floats. 
    
    The time example seems OK to me @9214. You do have to know how types translate, but that's systemic.

