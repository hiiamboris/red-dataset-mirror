
#2979: Draw dialect: pen pattern draw block doesn't catching parsing errors
================================================================================
Issue is open, was reported by honix and has 8 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/2979>

```
1 >> view [base draw [line-width 5  circle 0x0 5x5]]
2 *** Script Error: invalid Draw dialect input at: [5x5]
3 *** Where: ???
4 >> view [base draw [line-width 5  pen pattern 5x5 [circle 0x0 5x5]  line 0x0 10x10]]
```
**(1)** there is type error ```5x5``` will be ```(integer! float!)```
**(2)** good, error catched, no window view
**(4)** same error as (1) but in pattern block, no errors, window is shown, and when i close the window, console crashes

Red 0.6.3 @ Windows 8.1


Comments:
--------------------------------------------------------------------------------

On 2020-07-15T09:37:32Z, hiiamboris, commented:
<https://github.com/red/red/issues/2979#issuecomment-658662434>

    Still "crashes", however it's more like uncaught Red error somewhere:
    ```
    >> view [base draw [line-width 5  pen pattern 5x5 [circle 0x0 5x5]  line 0x0 10x10]]
    *** Script Error: either does not allow unset for its cond argument
    *** Where: either                                                  
    *** Stack:                                                         
    ```
    The error message is fishy as well, can't dupe it:
    ```
    >> either () [1][2]                           
    *** Script Error: block did not return a value
    *** Where: either                             
    *** Stack:                                    
    ```

--------------------------------------------------------------------------------

On 2023-10-01T11:24:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/2979#issuecomment-1742049292>

    Another reproduction scenario I've stumbled upon:
    ```
    Red [needs: view]
    view [box draw compose [shape [line]] rate 99 on-time [face/draw: face/draw]]
    ```
    This script breaks out of the error loop when run and terminates:
    ```
    *** Script Error: invalid Draw dialect input at: []
    *** Where: ???
    *** Near : exit
    *** Script Error: invalid Draw dialect input at: []
    *** Where: ???
    *** Near : show self
    *** Script Error: either does not allow unset! for its cond argument
    *** Where: either
    *** Near : set/any 'result do code none
    *** Stack:
    ```
    But if I remove `compose` (that's meaningless anyway):
    ```
    Red [needs: view]
    view [box draw [shape [line]] rate 99 on-time [face/draw: face/draw]]
    ```
    Then it will keep spamming me the same message but does not terminate:
    ```
    *** Script Error: invalid Draw dialect input at: []
    *** Where: ???
    *** Near : show self
    ```
    Looks like yet another stack mess somewhere in Draw.

--------------------------------------------------------------------------------

On 2023-10-17T09:54:03Z, dockimbel, commented:
<https://github.com/red/red/issues/2979#issuecomment-1766073531>

    The crash occurs on an assertion failure caused by some wrong stack unwinding:
    ```
    *** Runtime Error 98: assertion failed
    *** in file: /C/dev/Red/runtime/stack.reds
    *** at line: 303
    ***
    ***   stack: red/stack/unwind
    ***   stack: red/stack/unwind-last
    ***   stack: red/interpreter/eval 04B8C8E4h true
    ***   stack: red/natives/catch* true 1
    ***   stack: do-safe
    ***   stack: do-actor
    ***   stack: ctx||467~awake 04C69D14h
    ***   stack: gui/make-event 0102FE6Ch 0 33
    ***   stack: gui/TimerProc 02CF0FC0h 275 00000001h 633571109
    ```
    
    For the odd repeating error message, it's caused by the following commit https://github.com/red/red/commit/ffe97130733e45a9e40c6ec38e61984154bef4b8, meant to fix #4430. It is causing a corruption in the copied block. Using the following probing code around L119 of `draw.red`:
    ```
    dump4 GET_BUFFER(cmds)			
        _series/copy as red-series! cmds as red-series! cmds part no null
    dump4 GET_BUFFER(cmds)
    ```
    I get:
    ```
    Hex dump from: 057A8F24h
    
    057A8F24: A0020010 03551510  00000010 057A8F38  ?.????U??...8?z?
    057A8F34: 057A8F48 0000000F  01393884 000001EC  H?z??...?89???..
    057A8F44: 000001B2 00000000  A0000010 0355150C  ??......?..???U?
    057A8F54: 00000020 057A8F60  057A8F80 0000001B   ...`?z???z??...
    057A8F64: 00000000 03551508  00000000 00000019  ....??U?....?...
    057A8F74: 00000000 03551504  00000000 00000000  ....??U?........
    057A8F84: A0000010 03551508  00000020 057A8F98  ?..???U? ...??z?
    057A8F94: 057A8FB8 0000000F  01393884 00000071  ??z??...?89?q...
    
    Hex dump from: 0585AB4Ch
    
    0585AB4C: A0000010 03549D4C  00000010 0585AB60  ?..?L?T??...`???
    0585AB5C: 0585AB60 00000000  00000000 00000000  `???............
    0585AB6C: 00000000 00000000  00000000 00000000  ................
    0585AB7C: 00000000 00000000  00000000 00000000  ................
    0585AB8C: 00000000 00000000  00000000 00000000  ................
    0585AB9C: 00000000 00000000  00000000 00000000  ................
    0585ABAC: 00000000 00000000  00000000 00000000  ................
    0585ABBC: 00000000 00000000  00000000 00000000  ................
    ```
    The copied block series buffer contains an empty slot with invalid header.
    
    That fix was later superseded by other fixes (#4430) to limit the size of the error message fields, so I will revert that commit as it's harmful and not needed anymore.

--------------------------------------------------------------------------------

On 2023-10-17T10:17:07Z, dockimbel, commented:
<https://github.com/red/red/issues/2979#issuecomment-1766112833>

    The crash is caused by a `EVT_TIME` event triggering [`awake`](https://github.com/red/red/blob/master/modules/view/backends/windows/events.reds#L613) before `awake` returns from a previous call for a `EVT_TIME` event.
    
    @qtxie How do we filter out such events to avoid stack corruption?

