
#5088: Set-many does not prevent all forms of `foreach` abuse
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.bug] [type.design]
<https://github.com/red/red/issues/5088>

**Describe the bug**

Suppose I like shooting my feet off:
```
>> foreach (blk: [a ()]) [1 2 3 4] [print blk]
*** Script Error: invalid argument: ()
*** Where: foreach
*** Near : [print blk]
*** Stack:

>> foreach (blk: [a b]) #(1 2 3 4) [print blk change blk [() ()]]   ;) even detects runtime changes
1 2
*** Script Error: invalid argument: ()
*** Where: foreach
*** Near : [() ()]
*** Stack:

>> foreach (blk: [a ()]) "abcd" [print blk]

*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/datatypes/context.reds
*** at line: 300
***
***   stack: red/_context/set 05528240h 048D8D2Ch
***   stack: red/natives/set-many-string 048D8D0Ch 048D8CFCh 2
***   stack: red/natives/foreach-next-block 2
***   stack: red/natives/foreach* false
***   stack: red/interpreter/eval-arguments 048D8CBCh 05528340h 05528340h 048D8C9Ch 00000000h 00000000h 04A10BD8h
***   stack: red/interpreter/eval-code 04A10BD8h 05528310h 05528340h 048D8C9Ch false 00000000h 00000000h 04A10BD8h
***   stack: red/interpreter/eval-expression 05528310h 05528340h 048D8C9Ch false false false
***   stack: red/interpreter/eval 048D8C9Ch true
***   stack: red/natives/catch* true 1
***   stack: ctx||502~try-do 049CA3B4h
***   stack: ctx||502~do-command 049CA3B4h
***   stack: ctx||502~eval-command 049CA3B4h
***   stack: ctx||502~run 049CA3B4h
***   stack: ctx||502~launch 049CA3B4h
***   stack: ctx||521~launch 049C9DC8h

>> foreach (blk: [a ()]) make image! 2x2 [print blk]

*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/datatypes/context.reds
*** at line: 300
***
***   stack: red/_context/set 05518DC0h 048E8D2Ch
***   stack: red/image/set-many 048E8D0Ch 048E8CFCh 2
***   stack: red/natives/foreach-next-block 2
***   stack: red/natives/foreach* false
***   stack: red/interpreter/eval-arguments 048E8CBCh 05518EB8h 05518EB8h 048E8C9Ch 00000000h 00000000h 04AA0BD8h
***   stack: red/interpreter/eval-code 04AA0BD8h 05518E68h 05518EB8h 048E8C9Ch false 00000000h 00000000h 04AA0BD8h
***   stack: red/interpreter/eval-expression 05518E68h 05518EB8h 048E8C9Ch false false false
***   stack: red/interpreter/eval 048E8C9Ch true
***   stack: red/natives/catch* true 1
***   stack: ctx||502~try-do 049CA3B4h
***   stack: ctx||502~do-command 049CA3B4h
***   stack: ctx||502~eval-command 049CA3B4h
***   stack: ctx||502~run 049CA3B4h
***   stack: ctx||502~launch 049CA3B4h
***   stack: ctx||521~launch 049C9DC8h
```

**Expected behavior**

Runtime error.
Note: I'm working on HOF-related foreach, so fixing this is not necessary.

**Platform version**
```
Red 0.6.4 for Windows built 23-Feb-2022/19:06:52
```



Comments:
--------------------------------------------------------------------------------

On 2022-02-26T18:35:44Z, greggirwin, commented:
<https://github.com/red/red/issues/5088#issuecomment-1052433437>

    > Suppose I like shooting my feet off:
    
    I don't know that you _like_ it, you're just very good at it. ;^)

--------------------------------------------------------------------------------

On 2022-02-27T02:16:47Z, dockimbel, commented:
<https://github.com/red/red/issues/5088#issuecomment-1052960583>

    > Note: I'm working on HOF-related foreach, so fixing this is not necessary.
    
    I don't see how it's related? This needs to be fixed, even if it's an edge case.

--------------------------------------------------------------------------------

On 2022-02-27T09:19:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/5088#issuecomment-1053411072>

    Because we'll be doing double work if you fix it too :)

