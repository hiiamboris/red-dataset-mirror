
#2930: WISH: a date literal with time part should use local time zone by default.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 10 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/2930>

I am in time zone +08:00. 

When I write 2017-07-26/00:00, I actually mean 2017-07-26/00:00+08:00 instead of 2017-07-26/00:00+00:00. So when I first saw this, I was surprised:
```Red
>> t1: now
== 25-Jul-2017/23:37:29+08:00
>> t2: 25-Jul-2017/23:37:29   ; it's the same as t1, I just omit the time zone, hoping the local time zone +8:00 by default
== 25-Jul-2017/23:37:29
>> to-time ((to-integer t1 ) - to-integer t2)
== -8:00:00
```



Comments:
--------------------------------------------------------------------------------

On 2017-07-26T05:03:03Z, dockimbel, commented:
<https://github.com/red/red/issues/2930#issuecomment-317948334>

    This is not possible to support, as a given literal date would then take different values depending on which country the Red script it is contained in would run, that is obviously not a desirable behavior.

--------------------------------------------------------------------------------

On 2017-07-31T08:28:33Z, DideC, commented:
<https://github.com/red/red/issues/2930#issuecomment-319002255>

    May be it could exist on option for the default timezone.
    
    If not set, it's the current behaviour, if it is, date/time value would use it as default.
    
    Just a rough idea.

--------------------------------------------------------------------------------

On 2017-07-31T15:31:12Z, greggirwin, commented:
<https://github.com/red/red/issues/2930#issuecomment-319104367>

    This ticket compares the behavior of `now` with that of a literal `date!` value. `Now` has context: the current date/time when and *where* it is evaluated. A literal date value *is* the when, but doesn't have a *where*, unless you explicitly provide it. It's tempting to think that you will always mean to use the local timezone, but that ignores the basis of Redbol's design: messaging. If I write `run backup at 23:59` and send that to a server, does that mean I want it to run at 23:59 *my* time? If I load a log file from the server, should all the timestamps in it be interpreted as occurring in my timezone?

--------------------------------------------------------------------------------

On 2017-07-31T16:55:28Z, dockimbel, commented:
<https://github.com/red/red/issues/2930#issuecomment-319130706>

    If your script is only used by yourself in the same place, you can just forget about the timezone and consider all the dates you produce as *local time*, and use then `d: now d/zone: 0` to retrieve the current time without zone information. Just be very careful if you later decide to share your script with people in other countries.

--------------------------------------------------------------------------------

On 2017-07-31T18:13:36Z, greggirwin, commented:
<https://github.com/red/red/issues/2930#issuecomment-319151041>

    I have an old R2 func for just that purpose:
    ```
    now-local: func [/precise /local n] [
        n: either precise [now/precise] [now]
        n/zone: 00:00  
        n
    ]
    ```

