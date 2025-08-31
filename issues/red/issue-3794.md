
#3794: [View] Menu mutation bugs future event offsets
================================================================================
Issue is open, was reported by hiiamboris and has 8 comment(s).
[GUI] [GUI.Win7]
<https://github.com/red/red/issues/3794>

**Describe the bug**

After the `face/menu` facet has been altered, further mouse clicks on the face are detected with an offset ~20px below the real one.

**To reproduce**
```
view [box 200.0.200.20 with [menu: []] on-alt-down [
    probe event/offset
    change face/menu reduce [form #"A" - 1 + random 26]
]]
```
1. run the code
2. right-click on the base once
3. try right-clicking on the topmost 20 pixel band - will not react
4. try right-clicking below the topmost 20px - will report wrong event/offset value

(the bug appears only when the `base` color is not opaque, so probably a W7-only issue)

**Screenshots**

![](https://i.gyazo.com/d2090b8ba722e65d86e2cfa40b0e5970.gif)
(the base appears black on the video, but it was visible on the screen - layered capturing problems)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 30-Jan-2019/9:03:13+03:00 commit #25ef631
W7
```



Comments:
--------------------------------------------------------------------------------

On 2019-02-27T22:33:04Z, greggirwin, commented:
<https://github.com/red/red/issues/3794#issuecomment-468057828>

    Can't reproduce on Win10. 20px always makes me title bar suspicious. 

--------------------------------------------------------------------------------

On 2019-03-02T11:12:55Z, endo64, commented:
<https://github.com/red/red/issues/3794#issuecomment-468911067>

    Can't reproduce on Win10 either, could it be related to DPI scaling?

--------------------------------------------------------------------------------

On 2019-03-02T17:44:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/3794#issuecomment-468942661>

    More likely to layered windows code.

--------------------------------------------------------------------------------

On 2020-02-28T17:19:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/3794#issuecomment-592614628>

    You know what's funny is that it maybe a W7 bug.
    I have extended the code to show the client offset of the layered window, and this offset does indeed increase by 25px (which is 20px * 125% scaling in my W7):
    ```
    view [box 200.0.200.20 with [menu: []] on-alt-down [
        print [client-offset-of face  client-offset-of face/parent]
        change face/menu reduce [form #"A" - 1 + random 26]
    ]]
    ```
    The base is not visibly moving, but it's client area offset on the screen changes:
    ```
    912x518 900x506
    912x543 900x506
    ```
    
    Source code:
    ```
    set 'window-size-of func [window [object!]][
    	get-window-size* window/state/1
    ]
    
    get-client-offset*: routine [
    	hwnd [any-type!] "handle! or integer!"
    	return: [pair!]
    	/local p h
    ][
    	h: as red-handle! hwnd
    	p: gui/screen-to-client as handle! h/value 0 0
    	as red-pair! stack/set-last as cell! pair/push 0 - p/x 0 - p/y
    ]
    ```
    And `screen-to-client` is:
    https://github.com/red/red/blob/bf15211a20a482bbd7ab56cba5b26a394f896581/modules/view/backends/windows/events.reds#L890
    
    So unless the `base` window somehow grows an invisible title bar, it looks like a bug in [ScreenToClient](https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-screentoclient) to me. If that is the case, we should find out what action triggers it and try to find a workaround.

