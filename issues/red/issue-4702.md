
#4702: [GTK] Crash on image buffer access
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[type.bug]
<https://github.com/red/red/issues/4702>

**Describe the bug**
```
*** Runtime Error 1: access violation
*** in file: /media/sf_xfer/platform/image-gdk.reds
*** at line: 294
***
***   stack: red/OS-image/revert F31DD008h F11EB008h 8373872 false
***   stack: red/OS-image/pixbuf-to-buf 0979AF50h
***   stack: red/OS-image/lock-bitmap 096B0BFCh false
***   stack: red/image/serialize 096B0BFCh 096B0C0Ch false false false 096B0C0Ch 979 1
***   stack: red/image/mold 096B0BFCh 096B0C0Ch false false false 096B0C0Ch 1000 0
***   stack: red/actions/mold 096B0BFCh 096B0C0Ch false false false 096B0C0Ch 1000 0
***   stack: red/actions/mold* -1 -1 -1 1
***   stack: red/interpreter/eval-arguments 096B0BECh F4C18610h F4C18610h F4C185E0h F4C18688h F4EF1598h
***   stack: red/interpreter/eval-code F4EF1598h F4C185F0h F4C18610h true F4C185E0h F4C18688h F4EF1598h
***   stack: red/interpreter/eval-path F4C185E0h F4C185F0h F4C18610h false false true false
***   stack: red/interpreter/eval-expression F4C185F0h F4C18610h false true false
***   stack: red/interpreter/eval-arguments F4EF63E8h F4C185E0h F4C18610h 00000000h 00000000h F4EF63E8h
***   stack: red/interpreter/eval-code F4EF63E8h F4C185E0h F4C18610h false 00000000h 00000000h F4EF63E8h
***   stack: red/interpreter/eval-expression F4C185E0h F4C18610h false false false
***   stack: red/interpreter/eval 096B0BCCh true
***   stack: red/natives/do* true -1 -1 -1
***   stack: ***_start
```


**To reproduce**

1. Grab this PNG file & save it as `1.png`: https://i.gyazo.com/f0a0d8681391ecf5d37cdfd33770b290.png
2. Try to load it in console: `load %1.png`
Or alternatively just use `pick`: `first load %1.png`

**Expected behavior**

Load image

**Platform version**
```
Red 0.6.4 for Linux built 16-Oct-2020/13:35:47-05:00 commit #df54dcd
```
I can reproduce this crash on Debian 9.13 VM in VirtualBox, but not on Ubuntu 20.04.1 LTS in WSL2, so it may be just luck


