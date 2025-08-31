
#2961: Basing custom style on IMAGE leads to Access violation on macOS
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2961>

Doing this in macOS results in crash. Works fine under W10:

```
view [style my-style: image 400x400 draw [] my-style]
```


