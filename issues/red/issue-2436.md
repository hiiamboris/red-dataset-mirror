
#2436: Crash when trying to view an area with a huge text
================================================================================
Issue is closed, was reported by Rebol2Red and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2436>

```
x: copy {}
loop 600 * 1024 [append x {a}]
view [a: area 600 x]
```


Comments:
--------------------------------------------------------------------------------

On 2017-02-14T07:08:30Z, qtxie, commented:
<https://github.com/red/red/issues/2436#issuecomment-279625521>

    Use a more standard way to set text in edit control according to MSDN: https://msdn.microsoft.com/en-us/library/windows/desktop/hh298433(v=vs.85).aspx

