
#3881: Problem with date calculations for 29-Feb
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/3881>

**Describe the bug**
Changing the `/year` component of a valid `29-Feb` date yields an invalid date.
**To reproduce**
Steps to reproduce the behavior:
```
>> d: 29-Feb-2020
== 29-Feb-2020
>> d/year: d/year - 1
== 2019
>> d
== 29-Feb-2019
```
**Expected behavior**
```
== 1-Mar-2019
```
**Platform version (please complete the following information)**
```
All
```



Comments:
--------------------------------------------------------------------------------

On 2019-05-17T18:45:46Z, greggirwin, commented:
<https://github.com/red/red/issues/3881#issuecomment-493558780>

    R2 converts it to 1-Mar-2019 if you do that.

--------------------------------------------------------------------------------

On 2019-05-17T18:52:18Z, greggirwin, commented:
<https://github.com/red/red/issues/3881#issuecomment-493560792>

    Looks like it normalizes if you set the month or the day.

--------------------------------------------------------------------------------

On 2019-05-18T12:13:00Z, meijeru, commented:
<https://github.com/red/red/issues/3881#issuecomment-493672574>

    Apparently, normalization is not invoked when the year is set, then?

--------------------------------------------------------------------------------

On 2019-05-22T16:33:34Z, dockimbel, commented:
<https://github.com/red/red/issues/3881#issuecomment-494878825>

    @meijeru Correct.

