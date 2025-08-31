
#2853: Date: isoweek number calculation is off by two days
================================================================================
Issue is closed, was reported by meijeru and has 12 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2853>

Week 2 of 2017 begins on 7 Jan according to Red. It begins on 9 Jan according to ISO.


Comments:
--------------------------------------------------------------------------------

On 2017-07-06T14:45:58Z, dockimbel, commented:
<https://github.com/red/red/issues/2853#issuecomment-313417983>

    Seems to work fine here:
    ```
    >> d: now/date
    == 6-Jul-2017
    >> d/isoweek: 1
    == 1
    >> d
    == 2-Jan-2017
    >> d/isoweek: 2
    == 2
    >> d
    == 9-Jan-2017
    ```

--------------------------------------------------------------------------------

On 2017-07-06T15:21:27Z, meijeru, commented:
<https://github.com/red/red/issues/2853#issuecomment-313428748>

    I am not denying you can SET isoweek. What I protest is that upon retrieving isoweek, the calculation is not correct. See
    ```
    >> d: 7-Jan-2017
    == 7-Jan-2017
    >> d/isoweek
    == 2
    ```

--------------------------------------------------------------------------------

On 2017-07-06T15:51:01Z, greggirwin, commented:
<https://github.com/red/red/issues/2853#issuecomment-313437574>

    Is http://www.staff.science.uu.nl/~gent0113/calendar/isocalendar.htm / https://en.wikipedia.org/wiki/ISO_week_date our point of reference?

--------------------------------------------------------------------------------

On 2017-07-06T15:57:27Z, dockimbel, commented:
<https://github.com/red/red/issues/2853#issuecomment-313439495>

    @greggirwin That's correct, `/isoweek`  implements the ISO week date. Though, the current implementation seems to be missing some requirements to meet the ISO spec.

--------------------------------------------------------------------------------

On 2017-07-06T16:17:56Z, greggirwin, commented:
<https://github.com/red/red/issues/2853#issuecomment-313445350>

    No problem on current problems it may have. Just want to make sure we can point people to references for expected behavior.

--------------------------------------------------------------------------------

On 2017-07-06T17:58:49Z, dockimbel, commented:
<https://github.com/red/red/issues/2853#issuecomment-313472556>

    `/isoweek` should now fully conform to the ISO 8601 week.
    
    Setting `/isoweek` probably needs some adjustments too for full conformity.

