
#3810: [View] tab-panel background does not respect native theme choice
================================================================================
Issue is open, was reported by hiiamboris and has 10 comment(s).
[GUI]
<https://github.com/red/red/issues/3810>

**Describe the bug**

![](https://i.gyazo.com/1c8480c28d0fd2518875e877080442ed.png)
Should be black (system/view/metrics/colors/panel to be precise)

**To reproduce**

`view [tab-panel ["A" []]]`

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 5-Mar-2019/0:09:36+03:00 commit #53b5b37
```



Comments:
--------------------------------------------------------------------------------

On 2019-03-12T16:34:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/3810#issuecomment-472078483>

    It's even in the metrics:
    ```
    >> ? system/view/metrics/colors
    SYSTEM/VIEW/METRICS/COLORS is a map! with the following words and values:
         ...
         tab-panel  tuple!        255.255.255
    ```

--------------------------------------------------------------------------------

On 2019-03-12T18:51:06Z, dockimbel, commented:
<https://github.com/red/red/issues/3810#issuecomment-472134732>

    @hiiamboris I don't get it, you say it should be black, as in `system/view/metrics/colors/panel`, but that value is white...

--------------------------------------------------------------------------------

On 2019-03-12T19:00:09Z, hiiamboris, commented:
<https://github.com/red/red/issues/3810#issuecomment-472137952>

    @dockimbel I don't know why is it white. There is no white in my color theme at all. I mean that this `colors/tab-panel` value probably is the reason why it appears white on the screen :) but the value itself should be black and the bug is likely in the code that assigns it.

--------------------------------------------------------------------------------

On 2019-03-12T19:06:20Z, greggirwin, commented:
<https://github.com/red/red/issues/3810#issuecomment-472140077>

    It is pre-coded as white for Windows, not inheriting from the OS. 
    
    https://github.com/red/red/blob/master/modules/view/backends/platform.red#L773

--------------------------------------------------------------------------------

On 2019-03-12T19:07:29Z, greggirwin, commented:
<https://github.com/red/red/issues/3810#issuecomment-472140445>

    Why it's a special case there...perhaps an old issue with Win7 compatibility? I recall tab panel colors being a problem at one point.

