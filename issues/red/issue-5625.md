
#5625: [View] Current display detection needs a better approach
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
<https://github.com/red/red/issues/5625>

**Describe the bug**

It seems current display is identified from a [pointer position](https://github.com/red/red/blob/3d9dd1fe542723763562536199caf4f25cad6488/modules/view/backends/windows/gui.reds#L1460). This seems to often lead to undesirable outcomes. 

For example:

**To reproduce**

1. I hide the pointer to the display 2 because it's an eyesore, don't even pay attention to where it is
2. I run Red CLI console on display 1 (where I'm actually working) and type `view []`
3. The new window is going to be displayed on display 2, which is not what I expected (in reality it is not displayed at all - see #5624)

**Expected behavior**

Active window position would be a better test IMO

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.6 ahead: 73 date: 18-Jun-2025/9:52:24 commit: #3d9dd1fe542723763562536199caf4f25cad6488 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2025-06-23T13:15:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/5625#issuecomment-2996465153>

    See https://github.com/red/REP/issues/175 as well

--------------------------------------------------------------------------------

On 2025-06-23T18:22:23Z, greggirwin, commented:
<https://github.com/red/red/issues/5625#issuecomment-2997478679>

    I've noticed this as well, but attributed it to something in the OS. I very, very rarely want my console on a non-primary monitor. I used to use MultiMon(?), which had a really nice feature on the context menu to jump windows to another monitor, maintaining their relative offset. 

