
#5249: [View] draw crashes Red if <bg> is used with rtd-layout
================================================================================
Issue is closed, was reported by luce80 and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5249>

**Describe the bug**
`draw` crashes Red if `<bg>` is used with `rtd-layout`

**To reproduce**
`draw size-text r: rtd-layout [<bg> 255.0.0 "a" </bg> ] compose [text 0x0 (r)]`

**Expected behavior**
No crash.

**Platform version**
```
>> about
Red 0.6.4 for Windows built 26-Nov-2022/15:40:58+01:00  commit #94beb4d
```



Comments:
--------------------------------------------------------------------------------

On 2022-12-03T18:19:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/5249#issuecomment-1336212272>

    ```
    >> draw size-text r: rtd-layout [<bg> red "a" </bg> ] compose [text 0x0 (r)]
    
    *** Runtime Error 1: access violation
    *** in file: /d/devel/red/red-src/master/modules/view/backends/windows/text-box.reds
    *** at line: 75
    ***
    ***   stack: gui/OS-text-box-background 0130D510h 0130ED68h 0 1 255
    ***   stack: parse-text-styles 0130D510h 0130ED68h 05741520h 057414E0h true
    ***   stack: gui/OS-text-box-layout 05741F78h 0130D510h 0 true
    ***   stack: gui/OS-draw-text 0107FB18h 05741F68h 05741F78h false
    ***   stack: parse-draw 0107FB18h 012A027Ch false
    ***   stack: do-draw 00000000h 012A026Ch 012A027Ch false false false false
    ***   stack: gui/OS-do-draw 012A026Ch 012A027Ch
    ***   stack: ctx||459~draw-image 012A026Ch 012A027Ch
    ***   stack: draw
    ***   stack: red/_function/call 012A022Ch 01243884h 0573A558h 0
    ***   stack: red/interpreter/eval-code 04B841B8h 0573A5C8h 0573A5C8h 012A020Ch false 00000000h 00000000h 04B841B8h
    ***   stack: red/interpreter/eval-expression 0573A568h 0573A5C8h 012A020Ch false false false
    ***   stack: red/interpreter/eval 012A020Ch true
    ***   stack: red/natives/catch* true 1
    ***   stack: ctx||603~try-do 01380C1Ch
    ***   stack: ctx||603~do-command 01380C1Ch
    ***   stack: ctx||603~eval-command 01380C1Ch
    ***   stack: ctx||603~run 01380C1Ch
    ***   stack: ctx||603~launch 01380C1Ch
    ***   stack: ctx||622~launch 01380628h
    ```

