
#5357: [GTK] Extremely slow text rendering
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[status.built] [GUI.GTK]
<https://github.com/red/red/issues/5357>

**Describe the bug**

Same [Spaces demo](https://codeberg.org/hiiamboris/red-spaces/src/branch/master/tests/spiral-test.red) boots quickly under Windows, but takes over 3 minutes per frame on GTK.

**To reproduce**

Grab this minified version (warning: 500kb long string): https://gist.github.com/hiiamboris/89fa690858812af2128874dcf6564963 and run it.

Output on Windows:
```
509 ms  [view [box 400x400 draw drawn rate 3 on-time [unview]]] 
```
Output on GTK:
```
190612 ms       [view [box 400x400 draw drawn rate 3 on-time [unview]]]
```
To double-check remove `unview` (but then can't measure the timing).

**Expected behavior**

Reasonable rendering speed. Currently it's 370x times slower.

**Screenshots**

Without unview the output must look like:
![](https://i.gyazo.com/281431172c96f87a85be0056507de6aa.png)

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4805 date: 18-Jul-2023/19:56:01 commit: #af3d35a2f444b3d02058226effd63714eb4bf2bc ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------

-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 4805 date: 18-Jul-2023/19:56:01 commit: #af3d35a2f444b3d02058226effd63714eb4bf2bc ]
PLATFORM: [ name: "Ubuntu 20.04.1 LTS" OS: 'Linux arch: 'x86_64 version: 5.15.90 build: "#1 SMP Fri Jan 27 02:56:13 UTC 2023" ]
--------------------------------------------
```
I'm running it on WSL2, so it could be that WSL or VcXsrv are culprits.



Comments:
--------------------------------------------------------------------------------

On 2024-05-26T19:46:14Z, cedric780, commented:
<https://github.com/red/red/issues/5357#issuecomment-2132376750>

    Reproduced with Red 0.6.5 on native Ubuntu :
    
    ```
    -----------RED & PLATFORM VERSION----------- 
    RED: [ branch: "master" tag: #v0.6.5 ahead: 39 date: 8-May-2024/8:49:36 commit: #27b2a730b6178928c0f205718d903e0edb546ee0 ]
    PLATFORM: [ name: "Ubuntu 22.04.4 LTS" OS: 'Linux arch: 'x86_64 version: 5.15.0 build: "#117-Ubuntu SMP Fri Apr 26 12:26:49 UTC 2024" ]
    --------------------------------------------
    ```

--------------------------------------------------------------------------------

On 2024-06-03T06:48:35Z, qtxie, commented:
<https://github.com/red/red/issues/5357#issuecomment-2144403700>

    `pango_cairo_*` related functions are quite slow. If I comment those functions in `draw-text-at`, the speed is on par with Windows. 
    `cairo_show_text` is fast, we should use it.

