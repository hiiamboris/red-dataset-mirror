
#2052: gui-console can't be closed from task bar
================================================================================
Issue is closed, was reported by asampal and has 6 comment(s).
[type.bug] [status.resolved] [GUI]
<https://github.com/red/red/issues/2052>

Windows 10 64 bit, Red 8ec8635b4af8defb8b95b85824324f5eadb1fece

The gui-console doesn't respond to closing from the task bar: neither through the context-menu on the task bar entry nor by clicking the **X** on the task bar preview of the window.



Comments:
--------------------------------------------------------------------------------

On 2016-06-20T23:28:54Z, qtxie, commented:
<https://github.com/red/red/issues/2052#issuecomment-227299961>

    I cannot close it through the context-menu either, but I can close the window by clicking the X on preview window. 

--------------------------------------------------------------------------------

On 2016-06-21T02:22:27Z, asampal, commented:
<https://github.com/red/red/issues/2052#issuecomment-227323480>

    Hmm, you're right - I can now close it using the X on the preview. Also, if I try repeatedly, I can also close it using the context menu. Sometimes I can do it on the second try, sometimes it takes a few more attempts. It's not consistent.
    
    I'm pretty sure when I reported the issue the X on the preview wasn't working either, for me. Maybe I had gotten it into some kind of unresponsive state by running various scripts. I've rebooted since, though.

--------------------------------------------------------------------------------

On 2016-06-21T03:29:48Z, asampal, commented:
<https://github.com/red/red/issues/2052#issuecomment-227331552>

    I managed to reproduce the failure to close using the X on the task bar relatively consistently (well, maybe 8 or so times out of 40) by running the Gregg's [bubbles script](https://gist.githubusercontent.com/greggirwin/6a444d61e4dd2a2d59e430b6d40b25ad/raw/f3c79db07cb6d95cff7bb844621dd02a5c5ba5e7/bubbles-fast.red). 
    
    What I do is:
    - run gui-console
    - paste the bubbles script
    - move the cursor around in a circle to process events faster for a little bit, then pause and let the script run at normal speed for a while; I do this for about 20-30s
    - I close the bubbles window
    - I wait a few seconds (I might be imagining that there's a correlation between waiting a bit after closing the bubbles window and not being able to close the console using the X (when it doesn't close using the X, it also doesn't close from the context menu)
    - if the console closes, I repeat
    
    Every once in a while something happens that makes the CPU take a bigger hit than normal (usually, when this animation is running, the CPU is at about 12%) and the bubbles animation really slows down - to 1-2 fps. At this point my whole system becomes pretty unresponsive. Once, while trying to reproduce, my notebook actually reset itself.
    
    It's pretty clear that something's not quite right wrt the event handling - at least in the script I referenced.
    
    The laptop I'm running this on is not super powerful by today's standards. It's a quad-core i7 at 1.73 GHz (boosts to about 2.8 GHz, IIRC) with 16GB or RAM. It could be that on faster systems the behaviour I'm observing won't be seen or would be less frequent.

