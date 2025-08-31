
#5224: In draw block circles with same center but litlle different radii are not centered
================================================================================
Issue is closed, was reported by luce80 and has 0 comment(s).
[GUI]
<https://github.com/red/red/issues/5224>

**Describe the bug**
In `draw` block circles with same center but litlle different radii are not centered

**To reproduce**
view [base white draw [
pen red
circle 30x30 20.4
pen black
circle 30x30 20.5
]]

**Expected behavior**
Circles should be centered.

**Screenshots**
![](https://files.gitter.im/55b1d8290fc9f982beaacceb/TnxW/image.png)

**Platform version**
Win11
```
>> about
Red 0.6.4 for Windows built 5-Oct-2022/19:40:17+02:00  commit #cbe1935
```


