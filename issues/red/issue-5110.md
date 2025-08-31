
#5110: [View] `event/picked` randomly overflows
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5110>

**Describe the bug**
![](https://i.gyazo.com/dcfb7264afde50bd14aa3cb9b809aa51.gif)

On the vertical is `event/picked` value. Outliers are:
```
253.6
252.925
255.375
-251.9583333333333
251.3083333333333
251.8333333333333
```
that is they seem to equal real event/picked + 256 if it's negative and event/picked - 256 if it's positive

**To reproduce**

run this script
```
Red []
x: 0
view [
	base purple cyan 300x300 focus draw [
		pen cyan text 100x30 "Scroll me like crazy" 
		translate 0x150 scale 0.5 0.5
		shape []
	]
	on-wheel [
		if 10 < absolute event/picked [print event/picked]
		repend last face/draw ['line x * 1x0 as-pair x event/picked]
		x: x + 1 % 600
	]
]
```
like it says, scroll up or down insistently (I used touchpad 2-finger scroll on W10)

**Expected behavior**

No overflow

**Platform version**
```
Red 0.6.4 for Windows built 11-Mar-2022/2:40:53+03:00  commit #27f71f9
```



Comments:
--------------------------------------------------------------------------------

On 2022-09-15T15:19:42Z, dockimbel, commented:
<https://github.com/red/red/issues/5110#issuecomment-1248250537>

    ![image](https://user-images.githubusercontent.com/411393/190442190-a26ce162-2245-4943-9a2e-d50cc8cc07b8.png)
    
    Can't reproduce with a touchpad or a mouse wheel. I had to take my mouse with one hand, keeping it firm on the table, then using a finger on the wheel to repeatedly scroll it strongly in order to get those tiny spikes. If I scroll it normally, I get pretty much a straight line.
    
    
    It could be a driver issue on your touchpad. Trying upgrading to last driver from the vendor or switch to Windows default driver (which sometimes works better than the original one, from my own experience).

--------------------------------------------------------------------------------

On 2022-09-15T15:31:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/5110#issuecomment-1248267952>

    Could be some windows settings affecting scroll speed too.

--------------------------------------------------------------------------------

On 2022-09-15T15:32:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/5110#issuecomment-1248268445>

    Anyway, I'm sure we can patch this on our side.

--------------------------------------------------------------------------------

On 2022-09-15T15:41:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/5110#issuecomment-1248279563>

    I'll study this more, since it's easy to reproduce here.

--------------------------------------------------------------------------------

On 2022-09-15T15:51:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/5110#issuecomment-1248290106>

    You're right. The high word of `wparam` I'm getting:
    ```
    idx: 1339
    idx: 1131
    idx: 924
    idx: -29747
    idx: 1106
    idx: 1098
    idx: 1026
    idx: 1082
    idx: 1075
    idx: -30469
    idx: 1459
    idx: 1067
    idx: 892
    ```

--------------------------------------------------------------------------------

On 2022-09-15T16:22:44Z, hiiamboris, commented:
<https://github.com/red/red/issues/5110#issuecomment-1248327368>

    I confirm `ASUS Precision Touchpad` is the culprit:
    ![](https://i.gyazo.com/9c18fefe10ce99cac635d964c58e90c8.png)
    
    No issues on generic MS driver.

