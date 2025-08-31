
#188: Error line is off
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/188>

Just for testing, I tried to compile Kaj de Vos' %browser.reds, knowing full well it would stumble on the not yet existing include file. But the point here is the error message, at least the reported location of the error:

```
*** Loading Error: include file access error: %GTK-WebKit.reds
*** in file: %runtime/win32.reds
*** at line: 185
```

Note that %win32.reds has only 178 lines...



