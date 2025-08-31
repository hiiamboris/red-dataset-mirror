
#5623: [View] GUI console is borked after closing a window on another monitor
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/5623>

**Describe the bug**

After closing a window that was opened on 2nd monitor, the GUI console on the 1st monitor doesn't accept any input, as if `view` was never terminated.

**To reproduce**

1. Run GUI console on monitor 1
2. Open a new window `view []` but ensure it's opened initially on monitor 2
3. Close that window
4. Try interacting with the GUI console - its menus work but the terminal doesn't

**Expected behavior**

Terminal input working

**Platform version**

```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.6 ahead: 73 date: 18-Jun-2025/9:52:24 commit: #3d9dd1fe542723763562536199caf4f25cad6488 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
--------------------------------------------
```

See also #5622


Comments:
--------------------------------------------------------------------------------

On 2025-06-23T18:18:36Z, greggirwin, commented:
<https://github.com/red/red/issues/5623#issuecomment-2997456575>

    Can't reproduce. Just synced and it works fine here. Also works fine on a 13-May-2025 build.

--------------------------------------------------------------------------------

On 2025-06-23T18:25:17Z, greggirwin, commented:
<https://github.com/red/red/issues/5623#issuecomment-2997498769>

    Ah, I can dupe it now. I misunderstood your instructions, and used `view/options` with an offset to the other monitor. Using the pointer trick messes up the console input, as you say.

