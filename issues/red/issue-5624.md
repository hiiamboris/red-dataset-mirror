
#5624: [View] Window displayed on another monitor is invisible
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/5624>

**Describe the bug**

Window displayed on another monitor is invisible!

**To reproduce**

1. Run any console on display 1
2. Show a window `view []` on display 2 (must initially appear on display 2 - currently (#5625) it is done by placing a pointer there)
3. Observe no window on any of the displays: it is in the taskbar but not on the screen
4. With the window focused, press Alt+Space, select 'Move' then press any arrow, and after that move the pointer - window magically appears under the pointer

**Expected behavior**

The window must be visible from the start.

**Platform version**

```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.6 ahead: 73 date: 18-Jun-2025/9:52:24 commit: #3d9dd1fe542723763562536199caf4f25cad6488 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2025-06-23T12:51:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/5624#issuecomment-2996379801>

    This pretty mathemagics must be the key to it:
    ```
    >> w: view/no-wait []
    >> ? w/offset
    W/OFFSET is a point2D! value: (590, 2293)
    
    >> ? system/view/screens/1/size
    SYSTEM/VIEW/SCREENS/1/SIZE is a pair! value: 1280x720
    
    >> ? system/view/screens/2/size
    SYSTEM/VIEW/SCREENS/2/SIZE is a pair! value: 1280x366
    
    >> ? system/view/metrics/dpi
    SYSTEM/VIEW/METRICS/DPI is an integer! value: 288
    ```

