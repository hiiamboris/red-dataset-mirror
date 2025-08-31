
#5221: [View] Face resize renders annoying black bands
================================================================================
Issue is open, was reported by hiiamboris and has 8 comment(s).
[type.review] [GUI]
<https://github.com/red/red/issues/5221>

**Describe the bug**
<img width=500 src=https://i.gyazo.com/baf202dd834d0d56486ab2e9f3bce995.gif></img>
(it's even worse on the screen)

**To reproduce**
```
Red []
system/view/auto-sync?: off
window: view/no-wait/options/flags [
	base: base with [
		size: system/view/screens/1/size - 34x100
		color: system/view/metrics/colors/panel
	]
	at 100x100 box: base brick 20x20 loose
	react later [base/size: face/offset - base/offset show window]
] [offset: 0x0] 'resize
unless system/build/config/gui-console? [do-events]
```
(auto-sync turned off just in case, but has no noticeable effect)

**Expected behavior**

Faces should be valid at the time of render. If it's not possible, parent's backdrop should be used to paint the background (or panel color if no backdrop).

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4521 date: 30-Sep-2022/10:21:30 commit: #7e39cd7b25970fa6405d7a26eb54dd6c17efc252 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2022-10-03T17:33:32Z, hiiamboris, commented:
<https://github.com/red/red/issues/5221#issuecomment-1265799361>

    Could be related to https://github.com/red/red/issues/4355

--------------------------------------------------------------------------------

On 2022-10-03T18:48:41Z, greggirwin, commented:
<https://github.com/red/red/issues/5221#issuecomment-1265884801>

    Reproduced here, thought not as bad as in Boris' gif.

--------------------------------------------------------------------------------

On 2022-10-03T18:50:08Z, greggirwin, commented:
<https://github.com/red/red/issues/5221#issuecomment-1265886104>

    Ah, I can make the black bands wider if I _really_ slam the mouse around.

--------------------------------------------------------------------------------

On 2022-10-05T01:53:14Z, qtxie, commented:
<https://github.com/red/red/issues/5221#issuecomment-1267812500>

    A known issue on D2D backend.

