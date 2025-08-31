
#5175: [VID] Grid layout glitches when face size is explicitly provided
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[GUI]
<https://github.com/red/red/issues/5175>

**Describe the bug**

```
view [panel 2 [button "A" button "B" button 200 "C" button "D"]]
```
![](https://i.gyazo.com/a2c1df345fe571cfcf76f1d26a247473.png)
So basically "D" is painted on top of "C".

**Expected behavior**

```
view [panel 2 [button 200 "A" button "B" button 200 "C" button "D"]]
```
![](https://i.gyazo.com/09b1120088a11a6697fac0a1c84c0596.png)
or
```
view [panel 2 [button "A" at 220x10 button "B" button 200 "C" button "D"]]
```
![](https://i.gyazo.com/2ec45bb22e0ff59f6b0a1a77b857d8a0.png)

Will require a two-pass algorithm.

**Platform version**
```
red+view-master-2022-08-12-6848bc4.exe
```



