
#4439: [CRASH] when clicking on drop-list face
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4439>

**Describe the bug**
Clicking on a `drop-list` face in a window crashes the interpreter

**To reproduce**
Steps to reproduce the behavior:
Execute `view [drop-list data ["1" "2"]]` and click on the drop-list face to select an element.

**Expected behavior**
Should not crash but show the clicked element.

**Platform version (please complete the following information)**
```
W10 latest, at least
```



Comments:
--------------------------------------------------------------------------------

On 2020-05-11T15:42:56Z, dockimbel, commented:
<https://github.com/red/red/issues/4439#issuecomment-626783916>

    Crashes also on Win7 in fast-lexer branch.

--------------------------------------------------------------------------------

On 2020-05-11T15:48:02Z, 9214, commented:
<https://github.com/red/red/issues/4439#issuecomment-626786824>

    @qtxie 
    ```red
    *** Runtime Error 1: access violation
    *** in file: .../red/modules/view/backends/windows/gui.reds
    *** at line: 131
    ***
    ***   stack: gui/get-face-values 006C0972h
    ***   stack: gui/process 0019FBD0h
    ***   stack: gui/do-events false
    ***   stack: ctx||435~do-event-loop false
    ***   stack: do-events
    ***   stack: view
    ***   stack: red/_function/call 02BD9294h 00EA3884h
    ***   stack: red/interpreter/eval-code 02BD9294h 03087758h 03087758h false 00000000h 00000000h 02CC18E8h
    ***   stack: red/interpreter/eval-expression 03087748h 03087758h false false false
    ***   stack: red/interpreter/eval 02BD9274h true
    ***   stack: red/natives/catch* true 1
    ***   stack: ctx||532~try-do 00F41F28h
    ***   stack: ctx||532~do-command 00F41F28h
    ***   stack: ctx||532~eval-command 00F41F28h
    ***   stack: ctx||532~run 00F41F28h
    ***   stack: ctx||532~launch 00F41F28h
    ***   stack: ctx||565~launch 00F4167Ch
    ```
    
    https://github.com/red/red/blob/9b50a8a121dce2cd4f6b07f7646d572a67ca4677/modules/view/backends/windows/gui.reds#L131

--------------------------------------------------------------------------------

On 2020-05-11T23:01:50Z, qtxie, commented:
<https://github.com/red/red/issues/4439#issuecomment-627010501>

    Was it fixed yesterday? https://github.com/red/red/pull/4437
    I cannot reproduce it.

--------------------------------------------------------------------------------

On 2020-05-12T09:51:47Z, meijeru, commented:
<https://github.com/red/red/issues/4439#issuecomment-627236549>

    It is gone! Commit #18ccd92 does not have the problem anymore.

