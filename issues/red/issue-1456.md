
#1456: drop-down face not wide enough
================================================================================
Issue is closed, was reported by WiseGenius and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1456>

```
view [drop-down "This is fairly long and won't quite fit." data ["This is even longer and its length is ignored altogether."]]
```

On both Windows XP and Windows 7, the above code results in displaying only “This is fairly long and won't quite”. The rest of it, “ fit.”, doesn't fit. My guess is that the width of the box on the end with the triangle wasn't taken into account when calculating the size.
`data` isn't checked at all to see if its longest item will fit.
As a result, if the user tries to type either of the above values into the `drop-down`, it will beep as being too long.



Comments:
--------------------------------------------------------------------------------

On 2015-11-17T16:18:19Z, dockimbel, commented:
<https://github.com/red/red/issues/1456#issuecomment-157418370>

    We cannot yet fix this issue totally as we need to extract the metrics for all decorations used by widgets and take them into account in internal size calculation. Similar issues exists for other widgets with special decorations.

--------------------------------------------------------------------------------

On 2016-05-09T04:51:46Z, dockimbel, commented:
<https://github.com/red/red/issues/1456#issuecomment-217775575>

    It works fine now.

