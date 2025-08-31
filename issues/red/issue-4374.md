
#4374: [View] Containers react to their child faces' timers
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[status.reviewed] [type.review] [GUI]
<https://github.com/red/red/issues/4374>

**Describe the bug**

`on-time` of parent face is triggered by `on-time` of it's child.

**To reproduce**

Group-box (or panel) is affected:
`view [group-box [text rate 5] rate 0:0:3 on-time [print 'time]]`

Window is affected:
`view/options [text rate 5] [rate: 0:0:3 actors: object [on-time: func [f e] [print 'time]]]`

See that it prints `time` every 200ms.

**Expected behavior**

Should print `time` every 3 seconds.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Mar-2020/14:57:39+03:00 commit #101a64f
```



Comments:
--------------------------------------------------------------------------------

On 2020-03-31T11:28:48Z, qtxie, commented:
<https://github.com/red/red/issues/4374#issuecomment-606569750>

     Event goes from face to parent window in event bubbling stage. https://github.com/red/red/blob/master/modules/view/view.red#L663
    
    Maybe we should filter some events.
    As a workaround, return `done` in the child's handler function.
    ```
    view [group-box [text rate 5 on-time ['done]] rate 0:0:3 on-time [print 'time]]
    ```

