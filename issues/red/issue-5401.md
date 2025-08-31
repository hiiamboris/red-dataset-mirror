
#5401: Some control flow artifacts and crashes during tracing
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5401>

**Describe the bug**

#### Case 1:
```
Red []

f: does [
	do/trace [parse "ab" [skip (return 1)]] does []
	2
]
probe f
```
Produces:
```
*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/master/runtime/interpreter.reds
*** at line: 342
***
***   stack: red/interpreter/call 053D1DECh 03283884h 057D2F18h 0
***   stack: red/interpreter/eval-code 054B6438h 057D2F38h 057D2F38h 053D1DCCh false 00000000h 00000000h 054B6438h 0 false
***   stack: red/interpreter/eval-expression 057D2F28h 057D2F38h 053D1DCCh false false false
***   stack: red/interpreter/eval 053D1DCCh true
***   stack: red/natives/catch* true 1
***   stack: ctx||626~try-do 0329F790h
***   stack: ctx||626~launch 0329F790h
***   stack: ctx||645~launch 0329F17Ch
```

#### Case 2 (no `probe`):
```
Red []

f: does [
	do/trace [parse "ab" [skip (return 1)]] does []
	2
]
f
```
Produces (reminds me of https://github.com/red/red/issues/2979#issuecomment-658662434):
```
*** Script Error: either does not allow integer! for its cond argument
*** Where: either
*** Near : unset
*** Stack:
```

#### Case 3:
```
Red []

f: does [
	trace/raw [parse "ab" [skip (return 1)]]
	2
]
probe f
```
Produces (`return` intercepted - see #4416):
```
INIT -1 none none 29x31
ENTER 0 none none 31x31
FETCH 0 none parse 31x31
OPEN 1 none parse 31x31
FETCH 1 none "ab" 32x32
PUSH 1 none "ab" 32x33
FETCH 2 none [skip (return 1)] 32x33
PUSH 2 none [skip (return 1)] 32x34
CALL 3 parse make native! [["Process a ...] 32x34
ENTER 0 none none 35x35
FETCH 0 none return 35x35
OPEN 1 none return 35x35
FETCH 1 none 1 36x36
PUSH 1 none 1 36x37
CALL 2 return make native! [["Returns a ...] 36x37
END -1 none none 29x29
2
```
Compare to output without `trace/raw`:
```
1
```

**To reproduce**

Run the provided above scripts.

**Expected behavior**

1. `1` printed
2. nothing printed
3. `1` printed after the trace log


**Platform version**
```
Red 0.6.4 for Windows built 7-Oct-2023/15:51:08+03:00  commit #0c72515
```


Comments:
--------------------------------------------------------------------------------

On 2023-10-10T16:38:13Z, dockimbel, commented:
<https://github.com/red/red/issues/5401#issuecomment-1755812453>

    > Run the provided above scripts.
    
    All run from the console?

--------------------------------------------------------------------------------

On 2023-10-10T16:40:46Z, hiiamboris, commented:
<https://github.com/red/red/issues/5401#issuecomment-1755819638>

    I provide headers for standalone scripts only. But in console it also works.

--------------------------------------------------------------------------------

On 2023-10-15T13:48:06Z, dockimbel, commented:
<https://github.com/red/red/issues/5401#issuecomment-1763395037>

    > `1` printed after the trace log
    
    That is not a legit expectation with the current `return` semantics, as the exception gets captured by `trace/raw` and not `f`, which is correct.  We could retrofit the `throw` and `catch` function attributes from R2 and make `trace` a pass-thru for those exceptions (ad-hoc solution, but maybe enough?), or try to make such kind of exception lexically scoped (if that would be compatible with the rest of the language semantics or just a desirable feature for end-users).

--------------------------------------------------------------------------------

On 2023-10-15T15:50:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/5401#issuecomment-1763430403>

    `throw` and `catch` may be enough if there was also a way to rethrow the original exception, so one could do some cleanup as exception pops up.

