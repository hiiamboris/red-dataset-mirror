
#4472: Annoyances of GUI console prompt related to `view/no-wait`
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4472>

![](https://i.gyazo.com/4afc6fa19ab78b68537d79b45ff648ae.gif)

**Describe the bug**

I often use `view/no-wait`, as this gives me the ability to alter values from console. At the same time, window might have some debug output. But it all behaves unacceptably bad:
1. `view/no-wait` brings the console to the top, but sets focus to the shown window. This is the most unfortunate outcome that it can possibly produce ;) All keys are eaten by the window, while I'm looking at the console.
2. Output from `print` is not visible in the console until I scroll it. 
3. Input prompt, instead of jumping after the last printed line, stays in it's place. But the caret appears where it should be - after the last printed line.

**To reproduce**

`view/no-wait [button "PRINT" [print "text"]]`
Then click some (see the gif).

**Expected behavior**

1. Either it should bring the shown window to the top, or it should activate console so it accepts input. I don't have a strong opinion which behavior is the best, as sometimes first thing to do is interact with the window, and other times first thing is inspect some values. I'm more in favor of activating the console though, as I more often find myself continuing to use the console after `view/no-wait`.
2. Prints must be immediately rendered
3. Input prompt should automatically relocate itself below the last printed line (and scroll the console so that the prompt is visible).

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/10:24:10+03:00 commit #a3afc9e
```



Comments:
--------------------------------------------------------------------------------

On 2020-05-29T07:03:19Z, qtxie, commented:
<https://github.com/red/red/issues/4472#issuecomment-635799890>

    > 1. view/no-wait brings the console to the top, …
    
    Seems Win7 only, no this issue on Win10.
    
    > 2. Prints must be immediately rendered
    
    This one is tricky. I haven't found a good solution. If every print refresh the console immediately, printing will slow down a lot. It's already much slower than the CLI console.

--------------------------------------------------------------------------------

On 2020-05-29T07:50:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/4472#issuecomment-635820151>

    > This one is tricky. I haven't found a good solution. If every print refresh the console immediately, printing will be slow down a lot. It's already much lower than the CLI console.
    
    In this case, what about refresh on time? E.g. 5 times a second.

--------------------------------------------------------------------------------

On 2020-05-29T18:57:56Z, dockimbel, commented:
<https://github.com/red/red/issues/4472#issuecomment-636134265>

    Not refreshing the console immediately is causing many visual issues. Console output accuracy takes precedence over speed.

--------------------------------------------------------------------------------

On 2020-06-08T08:21:10Z, qtxie, commented:
<https://github.com/red/red/issues/4472#issuecomment-640447548>

    > Prints must be immediately rendered
    
    Actually prints is immediately rendered except this case when using `/no-wait`. I pushed a commit for it.

