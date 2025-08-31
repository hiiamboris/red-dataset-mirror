
#606: No error raised on unclosed braces
================================================================================
Issue is closed, was reported by hostilefork and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/606>

Given the code:

```
Red []
print ["No error"
```

It runs without raising any errors about the unmatched brace with system/version = _0.4.1, 13-Dec-2013/23:19:35-5:00_

```
$ ~/Downloads/red test.red
No error...
```

Ties in with hard-to-find problems in larger examples.



Comments:
--------------------------------------------------------------------------------

On 2013-12-14T18:25:36Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/606#issuecomment-30582652>

    This is a LOAD issue. It delimits the input silently.

