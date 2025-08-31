
#2948: Timezone beyond 15:45 not handled correctly in date-literal and with /zone
================================================================================
Issue is closed, was reported by meijeru and has 24 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2948>

```
>> 1-2-2003/10:30+16:00
== 1-Feb-2003/10:30:00-00:00
>> 1-2-2003/10:30+16:15
== 1-Feb-2003/10:30:00-00:15
```
etc.
Also: 
```
>> d: now
== 31-Jul-2017/14:33:47+02:00
>> d/zone: 16:00
== 16:00:00
>> d
== 31-Jul-2017/14:33:47-00:00
```



Comments:
--------------------------------------------------------------------------------

On 2017-07-31T13:21:49Z, dockimbel, commented:
<https://github.com/red/red/issues/2948#issuecomment-319065301>

    The documentation says:
    > Timezones are returned as time! values between -16:00 and +15:00. Setting the timezone with /zone will only modify that field, time is kept the same. Out of range argument values will result in a normalized date.
    
    Maybe the valid range for timezones should be given at the beginning of the document with other range information.

--------------------------------------------------------------------------------

On 2017-07-31T15:16:36Z, x8x, commented:
<https://github.com/red/red/issues/2948#issuecomment-319098909>

    "Out of range argument values will result in a normalized date."
    Thought, I think you have a bit to set show/hide timezone and in case it is normalized to 0, then it should be hidden:
    ```
    ;   31-Jul-2017/14:33:47+02:00
      t/zone: 16
    ;   16
      t
    ;   31-Jul-2017/14:33:47-00:00
      t/zone: 0
    ;   0
      t
    ;   31-Jul-2017/14:33:47
    ```
    Personally I think it would be more useful for the user to get an error instead of normalisation for out of range values and according to this https://en.wikipedia.org/wiki/Time_zone , the range is -12 to +14.
    

--------------------------------------------------------------------------------

On 2017-07-31T15:31:00Z, meijeru, commented:
<https://github.com/red/red/issues/2948#issuecomment-319104263>

    Even when normalized, +16:00 should not yield -00:00 but +00:00 IMHO. Likewise, +16:15 should become +00:15, not -00:15. The principle of least surprise is best obeyed by taking the value modulo 16:00. Lastly, values up to +15:45 are allowed, even though the documentation says the upper limit is +15:00. Also, -16:00 is not allowed, lower limit is -15:45.

--------------------------------------------------------------------------------

On 2017-07-31T18:45:01Z, greggirwin, commented:
<https://github.com/red/red/issues/2948#issuecomment-319159913>

    In a *literal* out of bounds case, an error may be appropriate here, as with invalid day values for a given month, like 32-jan-2017. When modifying a value, things get trickier. Really, the useful values for a zone are -11:00 to +13:00. We could view it as +/-12:00, but the offset matches the real world better. That leaves out a couple uninhabited islands, but also part of New Zealand. We probably don't want to do that, which means, I wonder, if we can really come up with any modulo system that operates according to the PoLS Rudolf mentions. If the Chatham Islands don't observe DST...
    
    What is the benefit of normalizing in this case, versus an error?

--------------------------------------------------------------------------------

On 2017-07-31T19:36:06Z, meijeru, commented:
<https://github.com/red/red/issues/2948#issuecomment-319173116>

    The most radical solution would be to have a list of all really occurring timezones, and check against those. This is comparable to checking allowable dates of the month (28, 29, 30 or 31 as the case may be). 

--------------------------------------------------------------------------------

On 2017-07-31T20:12:12Z, greggirwin, commented:
<https://github.com/red/red/issues/2948#issuecomment-319182586>

    Yes, but consider an even more radical view, allowing *any* timezone could be used to simulate worlds with different rules, including ours in the future! Adding a list of real timezones could be done in `system/locale`.

--------------------------------------------------------------------------------

On 2017-07-31T20:14:54Z, greggirwin, commented:
<https://github.com/red/red/issues/2948#issuecomment-319183296>

    Well, not locale, as that's for text. 

--------------------------------------------------------------------------------

On 2017-07-31T20:19:20Z, greggirwin, commented:
<https://github.com/red/red/issues/2948#issuecomment-319184418>

    `[−12:00  −11:00  −10:00  −09:30  −09:00  −08:00  −07:00  −06:00  −05:00  −04:00  −03:30  −03:00  −02:00  −01:00  +00:00  +01:00  +02:00  +03:00  +03:30  +04:00  +04:30  +05:00  +05:30  +05:45  +06:00  +06:30  +07:00  +08:00  +08:30  +08:45  +09:00  +09:30  +10:00  +10:30  +11:00  +12:00  +12:45  +13:00  +14:00]`

--------------------------------------------------------------------------------

On 2017-08-01T15:57:00Z, x8x, commented:
<https://github.com/red/red/issues/2948#issuecomment-319414412>

    @greggirwin Anything that is not in your `block!` should not be allowed and should return an error and not be normalised.
    If someone discover a new planet, he is free to add other values to `system/catalog/timezones` before working with those new dates.

--------------------------------------------------------------------------------

On 2017-09-16T04:17:08Z, dockimbel, commented:
<https://github.com/red/red/issues/2948#issuecomment-329944145>

    We won't include a hardcoded list of timezones, for several reasons:
    1. Some of them change, not often, but enough for breaking an app relying on such list after a few years.
    2. They are politically-sensitive (they relate to country borders), and some of them are in dispute. So including such list means taking sides, which we won't do.

--------------------------------------------------------------------------------

On 2017-09-16T21:57:28Z, meijeru, commented:
<https://github.com/red/red/issues/2948#issuecomment-329997247>

    I think that is a wise decision, but it does not address the issues raised in my second comment. 

--------------------------------------------------------------------------------

On 2019-09-10T20:46:47Z, dockimbel, commented:
<https://github.com/red/red/issues/2948#issuecomment-530112326>

    We will normalize the out-of-range TZ, as we do for other fields, and as described in the documentation.

