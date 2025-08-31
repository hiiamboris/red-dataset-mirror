
#2576: SIGN? doesn't support percent!
================================================================================
Issue is closed, was reported by greggirwin and has 12 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2576>

```
>> sign? 1%
*** Script Error: sign? does not allow percent! for its <anon> argument
*** Where: sign?
```
But the spec uses `number!`, which contains `percent!`


Comments:
--------------------------------------------------------------------------------

On 2017-04-14T06:26:38Z, greggirwin, commented:
<https://github.com/red/red/issues/2576#issuecomment-294099345>

    May just need to add TYPE_PERCENT to sign?* in %natives.reds.

--------------------------------------------------------------------------------

On 2017-04-14T11:48:40Z, meijeru, commented:
<https://github.com/red/red/issues/2576#issuecomment-294141104>

    The comment to the code in %natives.red says: add  [...] pair! How would one define the sign of a pair?

--------------------------------------------------------------------------------

On 2017-04-14T15:09:59Z, greggirwin, commented:
<https://github.com/red/red/issues/2576#issuecomment-294170704>

    It could return a pair value itself, e.g. 10x50 would return 1x1, -5x10 would return -1x1, etc.

--------------------------------------------------------------------------------

On 2017-04-14T15:22:01Z, meijeru, commented:
<https://github.com/red/red/issues/2576#issuecomment-294172989>

    Yes, that makes sense. It goes in the same direction of some of my WISH issues asking for extension of various built-in functions to suitable composite datatypes.

--------------------------------------------------------------------------------

On 2017-04-16T00:54:38Z, greggirwin, commented:
<https://github.com/red/red/issues/2576#issuecomment-294326609>

    This ticket applies to negative? and positive? as well.

--------------------------------------------------------------------------------

On 2017-04-28T04:35:02Z, greggirwin, commented:
<https://github.com/red/red/issues/2576#issuecomment-297904852>

    Fix merged. Should be able to close this now.

