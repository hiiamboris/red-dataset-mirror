
#5575: [View] R/S-initiated changes to `window/selected` are not triggering reactions
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.wish] [GUI]
<https://github.com/red/red/issues/5575>

**Describe the bug**

As a poor man's attempt to track focus movement within GUI one could assign a reaction. 
It will work correctly when `set-focus` is involved, but never on clicks:

<img width=120 src=https://i.gyazo.com/830e2ac6de642c83690bf6062a084347.gif />

**To reproduce**
1. Run `view/no-wait [field "1" field "2" react [print select face/parent/selected 'text]]`
2. Click into any field to focus it
3. See that no message is printed

**Expected behavior**

It's a more general problem, which I'm sure isn't limited to the `/selected` facet.
But for this particular case, as for `/size`, I expect it to trigger `on-change*`.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 217 date: 28-Nov-2024/20:56:25 commit: #a69159226c6885ef7e67c7c9bc50514fd49f03b2 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2025-03-13T10:15:58Z, dockimbel, commented:
<https://github.com/red/red/issues/5575#issuecomment-2720711185>

    Reactions are meant to be triggered by user-level changes. There are moments in the lifetime of a face object (like setting up) where such reactions would not only slow down the GUI engine noticeably, but also cause unpredictable issues when the face is not fully formed and its backend OS resources are not yet fully initialized. 
    
    That said, during the face object lifetime, some of those low-level changes (mostly related to GUI events) _should_ trigger a reaction. This has been so far supported by using a global event handler to trigger appropriate reactions in some useful cases. That is an adhoc approach that is not fully satisfying, but does the job, is simple, gathers all such relations in a single place and is backend-independent: https://github.com/red/red/blob/master/modules/view/view.red#L1348

