
#1501: `foreach` always iterates over 3 pixels
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1501>

`foreach` always iterates over 3 pixels of an image, regardless of the size.

```
red>> foreach i make image! 100x100 [probe i]
0.0.0.255
0.0.0.255
0.0.0.255
== 0.0.0.255
```

```
red>> foreach i make image! 1x1 [probe i]
0.0.0.255
none
none
== none
```



Comments:
--------------------------------------------------------------------------------

On 2015-12-17T13:48:18Z, WiseGenius, commented:
<https://github.com/red/red/issues/1501#issuecomment-165457260>

    Seems to be fixed here.

