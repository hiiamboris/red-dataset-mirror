
#5405: `break` deep call inside `do/trace` crashes
================================================================================
Issue is closed, was reported by dockimbel and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5405>

Following code crashes both interpreted and compiled
```
Red []

;do [
    while [true][
        do/trace [parse "ab" [skip (break)]] func [e c o v r f][]
    ]
;]
```

When run from the GUI console, it produces an abnormal error:
```
while [true][do/trace [parse "ab" [skip (break)]] func [e c o v r f][]]
```
```
*** Script Error: either does not allow unset! for its cond argument
*** Where: either
*** Near : exit
*** Stack:
```
All platforms.


Comments:
--------------------------------------------------------------------------------

On 2023-10-16T16:18:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/5405#issuecomment-1764833469>

    same error message seen in https://github.com/red/red/issues/5401 https://github.com/red/red/issues/2979#issuecomment-1742049292 https://github.com/red/red/issues/5403#issuecomment-1763126453

--------------------------------------------------------------------------------

On 2023-10-16T20:32:31Z, dockimbel, commented:
<https://github.com/red/red/issues/5405#issuecomment-1765227038>

    #2979 seems unrelated, such error messages denote a stack frame corruption that can have many different causes.

