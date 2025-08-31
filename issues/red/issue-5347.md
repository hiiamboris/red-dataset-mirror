
#5347: CRASH in `sign? 1.#nan` 
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5347>

**Describe the bug**
```
>> sign? 1.#nan

*** Runtime Error 100: no value matched in CASE
*** in file: /D/devel/red/red-src/red/runtime/natives.reds
*** at line: 597
***
***   stack: red/natives/sign?* true
***   stack: red/natives/sign?* false
***   stack: red/interpreter/eval-arguments 052B06BCh 0575C460h 0575C460h 052B069Ch 00000000h 00000000h 0 false
***   stack: red/interpreter/eval-code 05391408h 0575C450h 0575C460h 052B069Ch false 00000000h 00000000h 05391408h 0 false
***   stack: red/interpreter/eval-expression 0575C450h 0575C460h 052B069Ch false false false
***   stack: red/interpreter/eval 052B069Ch true
***   stack: red/natives/catch* true 1
***   stack: ctx||612~try-do 049EFBA4h
***   stack: ctx||612~do-command 049EFBA4h
***   stack: ctx||612~eval-command 049EFBA4h
***   stack: ctx||612~run 049EFBA4h
***   stack: ctx||612~launch 049EFBA4h
***   stack: ctx||631~launch 049EF5B0h
```
Same for `sign? to percent! 1.#nan`

**Expected behavior**

A runtime error?

**Platform version**
```
Red 0.6.4 for Windows built 30-Jun-2023/16:48:30+03:00  commit #a3c4e0a
```


Comments:
--------------------------------------------------------------------------------

On 2023-07-16T18:51:15Z, greggirwin, commented:
<https://github.com/red/red/issues/5347#issuecomment-1637162238>

    https://stackoverflow.com/questions/21349847/positive-vs-negative-nans#:~:text=There%20is%20no%20notion%20of,is%20interpreted%20as%20a%20value. just for reference.
    
    The key design question is whether we want special numbers (and other things in the future) to be allowed as intermediate values. Do we just fail, or allow use in symbolic domains?

--------------------------------------------------------------------------------

On 2023-08-15T15:32:12Z, dockimbel, commented:
<https://github.com/red/red/issues/5347#issuecomment-1679136124>

    Returns zero now.

