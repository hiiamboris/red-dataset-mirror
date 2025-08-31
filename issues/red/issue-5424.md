
#5424: Undefined behavior of `continue` within `do/next`
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.design]
<https://github.com/red/red/issues/5424>

**Describe the bug**
```
;; just warmup
>> code: [?? i ?? i 'noop ?? i ?? i] repeat i 5 [do/next code 'code]
i: 1
i: 2
i: 4
i: 5

;; break works as expected
>> code: [?? i ?? i break/return 100 ?? i ?? i] repeat i 5 [do/next code 'code]
i: 1
i: 2
== 100

;; why `continue` interrupts the loop?
>> code: [?? i ?? i continue ?? i ?? i] repeat i 5 [do/next code 'code]
i: 1
i: 2
(result is unset)
```
`loop` and `foreach` are also interrupted, `while`, `forever` and `until` deadlock. `forall` see in comment below. Compiled behavior works the same.

**To reproduce**

```
code: [?? i ?? i continue ?? i ?? i]
;; uncomment the loop you want to test
repeat i 5 [do/next code 'code]		;) interrupted
; foreach i [1 2 3 4 5] [do/next code 'code]		;) interrupted
; i: 0 loop 5 [i: i + 1 do/next code 'code]		;) interrupted
; i: 0 while [not tail? code] [i: i + 1 do/next code 'code]	;) deadlocks
; i: 0 forever [if tail? code [break] i: i + 1 do/next code 'code]	;) deadlocks
; i: 0 until [if tail? code [break] i: i + 1 do/next code 'code false]	;) deadlocks
```

**Expected behavior**

That's the tricky part:
- for my use case (evaluating expressions one by one in a loop) it would be more useful to set `'code`  after the whole top-level expression that includes the `continue` call, so the loop would resume since next expression
- I can imagine a use case where one `do/next`s another loop's body, then `continue` might reset this body to the head
- leaving `code` as is can be simplest to explain

`foreach`, `loop` and `repeat` should not be interrupted

**Platform version**
```
Red 0.6.4 for Windows built 30-Oct-2023/11:45:38+03:00  commit #377b5ed
```


Comments:
--------------------------------------------------------------------------------

On 2023-11-10T18:33:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/5424#issuecomment-1806233395>

    `forall` works unexplainable too, even though it magically succeeds:
    ```
    >> code: [?? i ?? i continue ?? i ?? i] i: 0 forall code [print [i: i + 1 mold back code] do/next back code 'code]
    1 [?? i ?? i continue ?? i ?? i]
    i: 1
    2 [?? i continue ?? i ?? i]
    i: 2
    3 [continue ?? i ?? i]     ;) as if worked?
    4 [?? i ?? i]
    i: 4
    5 [?? i]
    i: 5
    
    >> code: [?? i ?? i probe continue ?? i ?? i] i: 0 forall code [print [i: i + 1 mold back code] do/next back code 'code]
    1 [?? i ?? i probe continue ?? i ?? i]
    i: 1
    2 [?? i probe continue ?? i ?? i]
    i: 2
    3 [probe continue ?? i ?? i]    ;) points 'code to 'continue
    4 [continue ?? i ?? i]      ;) skips it again
    5 [?? i ?? i]
    i: 5
    6 [?? i]
    i: 6
    
    >> code: [?? i ?? i also continue ?? i ?? i] i: 0 forall code [print [i: i + 1 mold back code] do/next back code 'code]
    1 [?? i ?? i also continue ?? i ?? i]
    i: 1
    2 [?? i also continue ?? i ?? i]
    i: 2
    3 [also continue ?? i ?? i]
    4 [continue ?? i ?? i]
    5 [?? i ?? i]
    i: 5
    6 [?? i]
    i: 6
    
    >> code: [?? i ?? i 1 = continue ?? i ?? i] i: 0 forall code [print [i: i + 1 mold back code] do/next back code 'code]
    1 [?? i ?? i 1 = continue ?? i ?? i]
    i: 1
    2 [?? i 1 = continue ?? i ?? i]
    i: 2
    3 [1 = continue ?? i ?? i]
    4 [= continue ?? i ?? i]    ;) now only '1' was skipped
    *** Script Error: = operator is missing an argument
    *** Where: do
    *** Near : do/next back code 'code
    *** Stack:  
    ```
    Also `forall` is the only loop that differs when compiled:
    ```
    ; code: [?? i ?? i continue ?? i ?? i] i: 0 forall code [print [i: i + 1 mold back code] do/next back code 'code]
    1 [?? i ?? i continue ?? i ?? i]
    i: 1
    2 [?? i continue ?? i ?? i]
    i: 2
    3 [continue ?? i ?? i]
    4 [continue ?? i ?? i]
    5 [continue ?? i ?? i]
    6 [continue ?? i ?? i]
    7 [continue ?? i ?? i]
    8 [continue ?? i ?? i]
    9 [continue ?? i ?? i]
    ```
    kind of deadlocks but due to #5422 manages to stop

