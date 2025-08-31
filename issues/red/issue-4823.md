
#4823: `resize` event not firing on certain conditions
================================================================================
Issue is closed, was reported by toomasv and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4823>

**Describe the bug**
With following setup:
```
reposition: does [other/offset: main/offset + as-pair main/size/x + 7 0] 
view/no-wait other: layout [] 
view main: layout/flags [on-resize [reposition print "Resized"] on-resizing :reposition] 'resize
```
`resize` event does not fire after dragging from top and right borders.

If `reposition` is redefined as e.g.`other/offset: main/offset`, `resize` does not fire on dragging from top and left borders.

**Expected behavior**
I expect `resize` event to fire regardless of what `on-resizing` actor does.

**Platform version**
```
Red 0.6.4 for Windows built 1-Feb-2021/10:19:14+02:00 commit #67e7d60
```



Comments:
--------------------------------------------------------------------------------

On 2021-02-10T15:42:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/4823#issuecomment-776801681>

    For me, only the bottom border produces events always, all other borders skip ~80% of events, especially when I resize little by little.
    Under the 2nd setup borders bottom and right work fine, left and top again skip ~80% of events.

