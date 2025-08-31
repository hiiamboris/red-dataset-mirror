
#4730: Using decimal pair leads to invalid values for pair parts
================================================================================
Issue is closed, was reported by Oldes and has 2 comment(s).
[status.built] [status.tested] [type.bug] [status.reviewed]
<https://github.com/red/red/issues/4730>

Currently:
```
>> 1.1x3
== 2641x3 ;<- should be 1.1x3 or error, if not yet implemented
```
```
Red 0.6.4 for Windows built 18-Nov-2020/3:13:59+01:00 commit #8ee5a9f
```


Comments:
--------------------------------------------------------------------------------

On 2020-11-18T22:13:23Z, dockimbel, commented:
<https://github.com/red/red/issues/4730#issuecomment-729989941>

    The lexer scanner allows it, but the loader does not support it yet. So it needs to output an error in such cases for now.

