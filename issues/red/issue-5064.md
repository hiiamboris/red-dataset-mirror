
#5064: `drop-down/selected` is sometimes pair on Mac
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[status.deferred] [type.bug] [GUI]
<https://github.com/red/red/issues/5064>

**Describe the bug**

[According to @builderguy1](https://gitter.im/red/help?at=62042b076e4c1e1c8457b2b2), this code:
`view [drop-down data ["aa" "bb"] select 1 rate 2 on-time [probe face/selected]]`
outputs `1` until user selects something (in this case "bb") and then starts outputting `1x2` on MacOS

**Expected behavior**

On Windows and GTK `/selected` always returns integer or none

**Platform version**
```
MacOS 10.14.6 I (with 32-bit support)
```



