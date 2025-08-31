
#1489: setting area/text does not clear subsequent lines
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/1489>

Try

```
view [
    button "Push me" [a/text: "I was pushed"]
    a: area "Waiting for text^M^/This does not get overwritten"
]
```



Comments:
--------------------------------------------------------------------------------

On 2015-12-04T15:22:28Z, meijeru, commented:
<https://github.com/red/red/issues/1489#issuecomment-161992869>

    I now suspect it doesn't even clear anything beyond the string that is written.

--------------------------------------------------------------------------------

On 2016-01-16T06:47:04Z, qtxie, commented:
<https://github.com/red/red/issues/1489#issuecomment-172166161>

    It's fixed in latest version.

