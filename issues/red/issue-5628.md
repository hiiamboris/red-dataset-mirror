
#5628: [WSL] GUI console crashes on startup on openSUSE
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[GUI.GTK]
<https://github.com/red/red/issues/5628>

**Describe the bug**
```
$ ./redgui-debug-master-2025-06-18-3d9dd1f

(redgui-debug-master-2025-06-18-3d9dd1f:458): Gdk-WARNING **: 21:44:33.994: Native Windows taller than 65535 pixels are not supported

(redgui-debug-master-2025-06-18-3d9dd1f:458): Gdk-CRITICAL **: 21:44:34.018: ../gdk/wayland/gdkdisplay-wayland.c:1372: Truncating shared memory
file failed: Invalid argument

*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
***   --Frame-- --Code--  --Call--
***   0A229E60h F5C59CF4h <external>
***   41544D4Ch 00000000h <external>
```
Both CLI+TUI and CLI+View(GTK) consoles do run, but there's no way to display text - only empty glyphs, and most of the view-related tests from `tests/` directory fail, showing extreme coordinates, e.g.:
```
...
show: window  with?: false
*** Script Error: invalid argument: (554, 477442)
*** Where: make-view
*** Near : exit
*** Stack: do-file view show
*** Files: %tests/vid.red
```


**To reproduce**

I tested from 'openSUSE Tumbleweed' from the MS Store on W11.

Libs - it's not on the website, but from what I figured:
`sudo zypper install glibc-32bit libcurl4-32bit libgtk-3-0-32bit libgdk_pixbuf-2_0-0-32bit gtk3-tools-32bit`

Then just run the GUI console.

**Expected behavior**

1. Should display the console
2. Should display text
3. Should run most of the tests

**Platform version**
```
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.6 ahead: 73 date: 18-Jun-2025/9:52:24 commit: #3d9dd1fe542723763562536199caf4f25cad6488 ]
PLATFORM: [ name: "openSUSE Tumbleweed" OS: 'Linux arch: 'x86_64 version: 6.6.87 build: {#1 SMP PREEMPT_DYNAMIC Thu Jun  5 18:30:46 UTC 2025} ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2025-06-29T16:35:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/5628#issuecomment-3016840162>

    It is [reported to work](https://matrix.to/#/%23red_bugs%3Agitter.im/%24QG36hVGpKke5UcHjhMQtjHRudiLAyANpDAUMJUvR6Hg?via=gitter.im&via=matrix.org&via=nitro.chat) on a real system so this is a WSL-specific issue most likely. I'm still setting up my WSL after a laptop wipe, so may have more info later. On the same WSL, AlmaLinux runs Red/GTK flawlessly.

--------------------------------------------------------------------------------

On 2025-06-30T07:25:20Z, dockimbel, commented:
<https://github.com/red/red/issues/5628#issuecomment-3018084808>

    Interesting, I could never install 32-bit libs on Ubuntu/WSL/Win11, so could never run Red there.

