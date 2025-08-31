
#1698: INSERT TAIL to HASH! crashes after seven elements
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1698>

Inserting to hash!’s tail crashes after seven elements. Appending works fine though.

```
red>> h: make hash! []
== make hash! []
red>> insert tail h 1
== make hash! []
red>> insert tail h 1
== make hash! []
red>> insert tail h 1
== make hash! []
red>> insert tail h 1
== make hash! []
red>> insert tail h 1
== make hash! []
red>> insert tail h 1
== make hash! []
red>> insert tail h 1

*** Runtime Error 1: access violation
*** at: 00015A51h
```



