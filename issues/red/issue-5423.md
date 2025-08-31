
#5423: `do` stops and CRASHES when underlying block is modifed
================================================================================
Issue is open, was reported by hiiamboris and has 10 comment(s).
[type.design]
<https://github.com/red/red/issues/5423>

**Describe the bug**

I need to evaluate code that plans more code.
At first I tried it the simple way, but nothing works as I expected:
```
>> do plan: [append plan [1 + 2]]
== [append plan [1 + 2] 1 + 2]
>> reduce plan: [append plan [1 + 2]]
== [[append plan [1 + 2] 1 + 2]]
```
So I had to create a `do/next` wrapper:
`dynamic-do: func [plan [block!]] [while [not tail? plan] [do/next plan 'plan]]`
But it crashes as soon as it reaches the original end of the block:
```
>> dynamic-do plan: [append plan [1 + 2]]

*** Runtime Error 98: assertion failed
*** in file: /d/devel/red/red-src/master/runtime/interpreter.reds
*** at line: 1371
***
***   stack: red/interpreter/eval-single 05886D28h
***   stack: red/natives/do* false -1 -1 1 -1
***   stack: red/interpreter/eval-arguments 053E1EECh 05886738h 05886738h 053E1EDCh 05886708h 05886750h 0 false
***   stack: red/interpreter/eval-code 054C0CE8h 05886718h 05886738h 053E1EDCh true 05886708h 05886750h 054C0CE8h 0 false
***   stack: red/interpreter/eval-path 05886708h 05886718h 05886738h 053E1EDCh false false false false
***   stack: red/interpreter/eval-expression 05886718h 05886738h 053E1EDCh false false false
***   stack: red/interpreter/eval 053E1EDCh true
***   stack: red/natives/while* false
***   stack: red/interpreter/eval-arguments 053E1EBCh 058866A8h 058866A8h 05886610h 00000000h 00000000h 0 false
***   stack: red/interpreter/eval-code 054BFE58h 05886688h 058866A8h 05886610h false 00000000h 00000000h 054BFE58h 0 false
***   stack: red/interpreter/eval-expression 05886688h 058866A8h 05886610h false false false
***   stack: red/interpreter/eval 05886610h true
***   stack: red/interpreter/eval-function 053E1E9Ch 05886610h 05886D40h
***   stack: red/interpreter/call 053E1E9Ch 01253884h 05886D40h 0
***   stack: red/interpreter/eval-code 054C9138h 05886D70h 05886D70h 053E1E7Ch false 00000000h 00000000h 054C9138h 0 false
***   stack: red/interpreter/eval-expression 05886D50h 05886D70h 053E1E7Ch false false false
***   stack: red/interpreter/eval 053E1E7Ch true
***   stack: red/natives/catch* true 1
***   stack: ctx||626~try-do 0126F78Ch
***   stack: ctx||626~do-command 0126F78Ch
***   stack: ctx||626~eval-command 0126F78Ch
***   stack: ctx||626~run 0126F78Ch
***   stack: ctx||626~launch 0126F78Ch
***   stack: ctx||645~launch 0126F178h
```
(if `plan` is preallocated to be bigger it doesn't crash)

Then turns out there's more:
```
>> do plan: [clear skip tail plan -3 1 + 2]
== 3
>> reduce plan: [clear skip tail plan -3 1 + 2]
== [[] 3]
```

**To reproduce**
```
do plan: [append plan [1 + 2]]
reduce plan: [append plan [1 + 2]]
dynamic-do: func [plan [block!]] [while [not tail? plan] [do/next plan 'plan]]
dynamic-do plan: [append plan [1 + 2]]
do plan: [clear skip tail plan -3 1 + 2]
reduce plan: [clear skip tail plan -3 1 + 2]
```

**Expected behavior**
```
>> do plan: [append plan [1 + 2]]
== 3
>> reduce plan: [append plan [1 + 2]]
== [[append plan [1 + 2] 1 + 2] 3]
>> dynamic-do plan: [append plan [1 + 2]]
== unset (since `while` return value is broken)
>> do plan: [clear skip tail plan -3 1 + 2]
== []
>> reduce plan: [clear skip tail plan -3 1 + 2]
== [[]]
```

**Platform version**
```
Red 0.6.4 for Windows built 30-Oct-2023/11:45:38+03:00  commit #377b5ed
```


Comments:
--------------------------------------------------------------------------------

On 2023-11-09T17:59:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/5423#issuecomment-1804302081>

    Not cases I care about but still interesting to consider:
    ```
    >> do plan: [(append plan 2 1) +]     ;) expected == 3
    *** Script Error: + is missing its value2 argument
    *** Where: +
    *** Near : (append plan 2 1) + 2
    *** Stack:  
    
    >> do plan: [(append plan [+ 3] 1) + 2]    ;) expected == 6
    == 3
    ```
    While expression-level length check should not affect the performance, I'm not sure about cases like these. But at least they shouldn't crash when do/next-ed.

--------------------------------------------------------------------------------

On 2023-11-09T18:12:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/5423#issuecomment-1804320422>

    Similar to `do`/`reduce` are:
    ```
    >> all plan: [append plan [1 + 2]]	;) expected == 3
    == [append plan [1 + 2] 1 + 2]
    >> any plan: [not append plan [1 + 2]]	;) expected == 3
    == none
    >> case/all plan: [true [append plan [true [1 + 2]]]]	;) expected == 3
    == [true [append plan [true [1 + 2]]] true [1 + 2]]
    >> parse [1] plan: [(append plan as paren! [probe 1 + 2])]	;) expected to print '3'
    == false
    >> compose plan: [(append plan [(1 + 2)])]	;) expected another '3' in result
    == [(append plan [(1 + 2)]) (1 + 2)]
    >> print plan: [append plan [1 + 2]]	;) expected another '3' printed
    append plan 1 + 2 1 + 2
    ```

--------------------------------------------------------------------------------

On 2023-11-09T18:29:11Z, hiiamboris, commented:
<https://github.com/red/red/issues/5423#issuecomment-1804342780>

    Reminds also a bit of first few messages in https://github.com/red/red/issues/3340, except there the output block is modified, not the code.

--------------------------------------------------------------------------------

On 2023-11-09T23:21:43Z, dockimbel, commented:
<https://github.com/red/red/issues/5423#issuecomment-1804834472>

    This is not a bug, it's a design decision left unanswered so far: should the currently evaluated block be locked against modification or should the implementation handle the eventual modifications happening during the evaluation?
    
    Locking is restrictive, but it's the simplest solution. Allowing modifications requires first defining explicitly all the possible cases, to ensure that no undefined behaviors are left, then ensure that the implementation is possible and not too costly.
    
    So, can we exhaustively list all the possible modification cases and define properly a good outcome, then we can check if it can be implemented. If we can't define or can't implement it, then locking remains the only option AFAICT.
    
    This question was left open until we would get to a final implementation of the runtime lib, so we can make a more informed decision. Maybe the time has come to form a decision.

--------------------------------------------------------------------------------

On 2023-11-10T08:43:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/5423#issuecomment-1805319053>

    I doubt we can get rid of undefined behavior unless we also cast in stone and document the interpreter's behavior (in what order exactly it fetches new tokens, what it caches what doesn't). E.g. in `a b c d e/(f)` expression any token may be a function or an op, redefining some other token(s) or modifying the block or inner series.
    
    Most cases are also esoteric. Even if we do define such behavior, humans won't be very good at applying it in their heads, so not very useful. 
    
    But it would be quite unfortunate if even `do/next` will not allow modification. So I'm against locking but for doing the next simplest thing.

