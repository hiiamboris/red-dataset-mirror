
#3795: [View] `on-menu` `event/offset` is not DPI-aware
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3795>

**Describe the bug**
```
view [
    box 100x100 200.0.200.20 with [menu: ["a"]]
    on-down [probe event/offset]
    on-menu [probe event/offset]
]
```
In the above:
- on-down prints [0x0 .. 99x99]
- on-menu prints [0x0 .. 124x124] (I have 125% scaling in Windows)

**Expected behavior**

Both `event/offset` should be within `face/size`.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 30-Jan-2019/9:03:13+03:00 commit #25ef631
```



