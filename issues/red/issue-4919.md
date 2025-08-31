
#4919: Parse does not restore collector's state on exceptions
================================================================================
Issue is closed, was reported by hiiamboris and has 14 comment(s).
[status.built] [status.tested] [type.bug] [type.GC]
<https://github.com/red/red/issues/4919>

**Describe the bug**
```
>> parse [1] [(boom)]
*** Script Error: boom has no value
*** Where: parse
*** Stack:  

>> loop 1000 [make block! 10000000]
*** Internal Error: not enough memory
*** Where: make
*** Stack:  
```

**Expected behavior**

GC should not be turned off like this

**Platform version**
```
Red 0.6.4 for Windows built 13-Jun-2021/10:10:47+03:00  commit #79ded2f
```



Comments:
--------------------------------------------------------------------------------

On 2021-07-03T12:23:20Z, dockimbel, commented:
<https://github.com/red/red/issues/4919#issuecomment-873399735>

    I get a crash on `run-all-comp2` (when compiled in dev mode) from a deep memory corruption after that fix. Though, it only happens on that big file (not when each unit test file is run separately) and on my W10 laptop only. It does not manifest on my main W10 PC desktop, nor in the CI runs.
    
    When I reverse that fix, the crash goes away. I will investigate this further.

--------------------------------------------------------------------------------

On 2021-07-03T13:47:28Z, dockimbel, commented:
<https://github.com/red/red/issues/4919#issuecomment-873410353>

    The crash seems to be triggered only when the Redbin payload is compressed (using a Rebol kernel with an active /Library module).

--------------------------------------------------------------------------------

On 2021-07-03T16:42:41Z, dockimbel, commented:
<https://github.com/red/red/issues/4919#issuecomment-873435219>

    I can reproduce the crash on my desktop PC now, it just needs to be compiled in dev mode. The crash happens in `collector/mark-values`, the values are corrupted. Though it is difficult to locate the origin of the corruption.  Disabling the GC or reverting the fix makes the crash disappear.
    
    @qtxie Can you have a look at it please?

--------------------------------------------------------------------------------

On 2021-08-24T17:45:20Z, dockimbel, commented:
<https://github.com/red/red/issues/4919#issuecomment-904847732>

    @qtxie The issue is fixed but I get a strange GC behavior on that loop eating the memory:
    ```
    >> loop 1000 [make block! 10000000]
    root: 3370/6176, runs: 0, mem: 1652672 => 1637316, mark: 0.0ms, sweep: 0.0ms
    root: 3370/6176, runs: 1, mem: 161637344 => 161637344, mark: 0.0ms, sweep: 0.0ms
    root: 3370/6176, runs: 2, mem: 321637372 => 161637344, mark: 0.0ms, sweep: 0.0ms
    root: 3370/6176, runs: 3, mem: 321637372 => 161637344, mark: 0.0ms, sweep: 0.0ms
    root: 3370/6176, runs: 4, mem: 321637372 => 161637344, mark: 0.0ms, sweep: 0.0ms
    root: 3370/6176, runs: 5, mem: 321637372 => 161637344, mark: 0.0ms, sweep: 0.0ms
    root: 3370/6176, runs: 6, mem: 321637372 => 161637344, mark: 15.6ms, sweep: 0.0ms
    root: 3370/6176, runs: 7, mem: 321637372 => 161637344, mark: 0.0ms, sweep: 0.0ms
    root: 3370/6176, runs: 8, mem: 321637372 => 161637344, mark: 0.0ms, sweep: 0.0ms
    ...
    root: 3370/6176, runs: 995, mem: 321637372 => 161637344, mark: 0.0ms, sweep: 0.0ms
    root: 3370/6176, runs: 996, mem: 321637372 => 161637344, mark: 0.0ms, sweep: 0.0ms
    root: 3370/6176, runs: 997, mem: 321637372 => 161637344, mark: 0.0ms, sweep: 0.0ms
    root: 3370/6176, runs: 998, mem: 321637372 => 161637344, mark: 0.0ms, sweep: 0.0ms
    root: 3370/6176, runs: 999, mem: 321637372 => 161637344, mark: 0.0ms, sweep: 0.0ms
    == []
    >> stats
    == 321638012
    >> recycle
    root: 3370/6176, runs: 1000, mem: 321638652 => 1637760, mark: 0.0ms, sweep: 0.0ms
    >> stats
    == 1638080
    ```
    
    It seems the GC is not capable of freeing up the memory while in the loop and does that only once exited, when calling `recycle` manually.
    
    On second thought, it might be related to intermediary blocks accumulating on the Red stack, so maybe `loop` is leaking stack slots while running... EDIT: checked, no stack slot leak happening there.
    

--------------------------------------------------------------------------------

On 2021-08-25T01:34:56Z, qtxie, commented:
<https://github.com/red/red/issues/4919#issuecomment-905099469>

    The block's node is on native stack which was marked by `mark-stack-nodes`. But if I add a print statement after [this line](https://github.com/red/red/blob/master/runtime/natives.reds#L211), it works as expected. 😓

--------------------------------------------------------------------------------

On 2021-08-26T13:04:13Z, dockimbel, commented:
<https://github.com/red/red/issues/4919#issuecomment-906394979>

    > But if I add a print statement after this line, it works as expected. 😓
    
    Did not work here. I also tried to set some local variables to `null` on the call stack, but no effects either.

--------------------------------------------------------------------------------

On 2021-08-27T13:05:10Z, dockimbel, commented:
<https://github.com/red/red/issues/4919#issuecomment-907187696>

    Fixed by commit 509729beb92dae0630532903d4fd3dde8b400df3

