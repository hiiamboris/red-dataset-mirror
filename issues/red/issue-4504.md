
#4504: [View] Face not yet attached to the window is a reactor, but not a deep reactor
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[GUI]
<https://github.com/red/red/issues/4504>

**Describe the bug**
```
v: view/no-wait []
system/view/auto-sync?: no
append v/pane c: make-face/spec 'panel [[]]
system/view/auto-sync?: yes
react/later [[c/pane] print "PANE CHANGED"]
; show v	;) this fixes it
do probe [c/pane: reduce [make-face 'base]]
do probe [append c/pane reduce [make-face 'base]]
```
Output:
```
[c/pane: reduce [make-face 'base]]
PANE CHANGED
[append c/pane reduce [make-face 'base]]
```
`c/pane:` triggers a reaction `append c/pane` does not
It only behaves this way while panel is not attached to the window (c/parent = none)

**Expected behavior**

Symmetry between `on-change` and `on-deep-change`. Preferably reactions should fire normally, else it's harder to reason about and not documented anywhere.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



