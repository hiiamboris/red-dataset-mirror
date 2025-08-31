
#5220: Big series in reactors are never freed
================================================================================
Issue is closed, was reported by dockimbel and has 30 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5220>

**Describe the bug**
Big series referenced in reactors are never freed, even after cutting off all references to the reactor.

**To reproduce**
```
r: make reactor! [a: append/dup [] 'x 10'000'000] 
probe recycle
modify r/a 'owned none
r: none
probe recycle
```
outputs:
```
270471416
270471416
```

**Expected behavior**
Proper recycling of unreferenced reactors.

**Platform version**
All.



Comments:
--------------------------------------------------------------------------------

On 2022-10-02T11:28:12Z, dockimbel, commented:
<https://github.com/red/red/issues/5220#issuecomment-1264619902>

    @qtxie It seems `refresh-buffer` in hashtable is holding a copy of the ownership table and keeps all reactors alive even when they are not referenced anymore. The call to `modify r/a 'owned none` should have removed the big series from the ownership hashtable, but the collector is still marking the reactor as alive (it's reachable from the root block directly, so seems related to `refresh-buffer`...).

--------------------------------------------------------------------------------

On 2022-10-02T11:48:04Z, dockimbel, commented:
<https://github.com/red/red/issues/5220#issuecomment-1264624032>

    Actually, it's not even related to reactors:
    ```
    r: make object! [a: append/dup [] 'x 10'000'000] 
    probe recycle
    r/a: none
    recycle
    r: none
    probe recycle
    ```
    gives
    ```
    270470320
    270470320
    ```

--------------------------------------------------------------------------------

On 2022-10-02T12:50:34Z, qtxie, commented:
<https://github.com/red/red/issues/5220#issuecomment-1264636236>

    > Actually, it's not even related to reactors:
    > 
    > ```
    > r: make object! [a: append/dup [] 'x 10'000'000] 
    > probe recycle
    > r/a: none
    > recycle
    > r: none
    > probe recycle
    > ```
    > 
    > gives
    > 
    > ```
    > 270470320
    > 270470320
    > ```
    
    I got this with `red-02oct22-881df719b.exe`.
    
    ```
    270245808
    1810076
    ```

--------------------------------------------------------------------------------

On 2022-10-02T12:56:55Z, dockimbel, commented:
<https://github.com/red/red/issues/5220#issuecomment-1264637435>

    Try wrapping it in `do [...]` and compiling it.
    I can't reproduce it from the console.
    
    Can you reproduce the reactor issue?
    
    

--------------------------------------------------------------------------------

On 2022-10-02T13:09:14Z, dockimbel, commented:
<https://github.com/red/red/issues/5220#issuecomment-1264639939>

    Forget the object version compiled with `do`, the unreleased series is related to the literal block `[]` that gets referenced by the Redbin decoded payload. So it's just a side-effect of compiling it. If the literal block is replaced by `make block! 1`, the memory gets released as expected.

--------------------------------------------------------------------------------

On 2022-10-02T13:20:40Z, qtxie, commented:
<https://github.com/red/red/issues/5220#issuecomment-1264642825>

    > Try wrapping it in `do [...]` and compiling it. I can't reproduce it from the console.
    > 
    > Can you reproduce the reactor issue?
    
    Yes. I can. The object `r` is referenced somewhere. The `refresh-buffer` is cleared immediately after use, it should not hold any values.
    
    ```
    r: make reactor! [a: append/dup [] 'x 10'000'000] 
    probe recycle
    modify r/a 'owned none
    r/a: none
    probe recycle
    ```
    Outputs:
    ```
     270249944
     1839680
     ```
     
    So the series `a` was removed from both reactors and the hashtable. The issue is object `r` is referenced somewhere.

--------------------------------------------------------------------------------

On 2022-10-02T13:34:04Z, dockimbel, commented:
<https://github.com/red/red/issues/5220#issuecomment-1264645532>

    How do you run that code? From the same code copy/pasted in the GUI console, I get:
    ```
    271213756
    271214364
    ```

--------------------------------------------------------------------------------

On 2022-10-02T13:37:57Z, dockimbel, commented:
<https://github.com/red/red/issues/5220#issuecomment-1264646318>

    From the prebuilt CLI or GUI consoles downloaded from the red website, I get same results as you...
    
    I've pushed the extra commit I had on my local branch (https://github.com/red/red/commit/e7ac913e755c06acdac27b6465de8a2cf2712589) and will try again with the new prebuilt consoles.

--------------------------------------------------------------------------------

On 2022-10-02T13:38:51Z, qtxie, commented:
<https://github.com/red/red/issues/5220#issuecomment-1264646500>

    I used the prebuilt CLI console downloaded from the red website.

--------------------------------------------------------------------------------

On 2022-10-02T13:43:19Z, qtxie, commented:
<https://github.com/red/red/issues/5220#issuecomment-1264647546>

    ```
    r: make reactor! [a: append/dup [] 'x 10'000'000] 
    probe recycle
    modify r/a 'owned none
    r/a: none
    probe recycle
    ```
    Outputs:
    
    ```
    270249944
    1839680
    ```
    
    I don't know why it works. I don't see code that remove the series `a` from the hashtable.

--------------------------------------------------------------------------------

On 2022-10-02T19:01:44Z, dockimbel, commented:
<https://github.com/red/red/issues/5220#issuecomment-1264710952>

    I can't reproduce with locally compiled CLI or GUI console. Also, by replacing `append/dup []` by `append/dup make block! 1`, the memory gets released as it should, showing that the retention of reference to this literal block is a side-effect of the compilation or the loading process. E.g.:
    
    ```
    >> print read %5220.red
    Red [] r: make reactor! [a: append/dup [] 'x 10'000'000] 
    probe recycle
    modify r/a 'owned none
    r/a: none
    probe recycle
    >> do %5220.red
    271219416
    271219460
    == 271219460
    >> recycle
    == 2784556
    ```
    While the file is run the loaded source code is held on the stack, preventing the literal block from being freed. After the file execution, calling `recycle` successfully releases the used memory, as the literal block is not referenced anymore from anywhere.

--------------------------------------------------------------------------------

On 2022-10-02T19:26:40Z, dockimbel, commented:
<https://github.com/red/red/issues/5220#issuecomment-1264715268>

    @qtxie There's still something strange going on as the following version does not release the memory:
    
    ```
    r: reactor [a: append/dup [] 'x 10'000'000] 
    modify r/a 'owned none
    r: none
    recycle
    ```
    ```
    == 271217868
    ```
    It should work even without `r/a: none`...
    
    Moreover, if I set `collector/verbose: 2` and compile the GUI console in debug mode, running the above code will produce in `%live-values-1.log` file:
    ```
    root: 5885/8574, runs: 1, mem: 3177980
    marking...
    
            5: len: 0
            5: len: 0
            5: len: 2632
                    13: 
    *** Runtime Error 1: access violation
    *** in file: /c/dev/Red/runtime/collector.reds
    *** at line: 88
    ***
    ***   stack: red/collector/keep 0130F2FCh
    ***   stack: red/collector/mark-values 054C0028h 054CA4A8h
    ***   stack: red/collector/mark-block 04B1E17Ch
    ***   stack: red/collector/mark-values 04B1E17Ch 04B3512Ch
    ***   stack: red/collector/mark-block 0056C5E4h
    ***   stack: red/collector/do-mark-sweep
    ***   stack: red/collector/do-cycle
    ***   stack: red/alloc-series-buffer 32768 16 0
    ***   stack: red/expand-series 059006FCh 524288
    ***   stack: red/alloc-tail 059006FCh
    ***   stack: red/alloc-at-tail 04B3FBBCh
    ***   stack: red/block/insert 04B3FBBCh 04B3FBCCh 04B3FBACh false 04B3FBDCh true
    ***   stack: red/actions/insert 04B3FBBCh 04B3FBCCh 04B3FBACh false 04B3FBDCh true
    ***   stack: red/actions/append* -1 -1 2
    ***   stack: red/interpreter/eval-arguments 04B3FBACh 058DFD70h 058DFD70h 04B3FB6Ch 058DFD30h 058DFCE8h 054D0048h
    ***   stack: red/interpreter/eval-code 054D0048h 058DFD40h 058DFD70h 04B3FB6Ch true 058DFD30h 058DFCE8h 054D0048h
    ***   stack: red/interpreter/eval-path 058DFD30h 058DFD40h 058DFD70h 04B3FB6Ch false false true false
    ***   stack: red/interpreter/eval-expression 058DFD40h 058DFD70h 04B3FB6Ch false true false
    ***   stack: red/interpreter/eval-expression 058DFD30h 058DFD70h 04B3FB6Ch false false false
    ***   stack: red/interpreter/eval 04B3FB6Ch false
    ***   stack: red/object/make 04B3FB5Ch 04B3FB6Ch 32
    ***   stack: red/actions/make 04B3FB5Ch 04B3FB6Ch
    ***   stack: red/actions/make*
    ***   stack: reactor
    ***   stack: red/_function/call 04B3FB3Ch 012D3884h 058DFD98h 0
    ***   stack: red/interpreter/eval-code 054D3448h 058DFDB8h 058DFDB8h 04B3FB0Ch true 00000000h 00000000h 054D3448h
    ***   stack: red/interpreter/eval-expression 058DFDA8h 058DFDB8h 04B3FB0Ch false true false
    ***   stack: red/interpreter/eval-expression 058DFD98h 058DFDB8h 04B3FB0Ch false false false
    ***   stack: red/interpreter/eval 04B3FB0Ch true
    ***   stack: red/natives/catch* true 1
    ***   stack: ctx||592~try-do 012F0AC4h
    ***   stack: ctx||592~do-command 012F0AC4h
    ***   stack: ctx||592~eval-command 012F0AC4h
    ***   stack: ctx||592~run 012F0AC4h
    ***   stack: ctx||592~launch 012F0AC4h
    ***   stack: ctx||627~launch 012F0194h
    ```

--------------------------------------------------------------------------------

On 2022-10-04T12:45:28Z, dockimbel, commented:
<https://github.com/red/red/issues/5220#issuecomment-1266939822>

    The issue was caused by the `on-change*` function context node still pointing to the old 2-cell intermediary block when cloning the function during `object/copy` process, resulting in bindings inside `object/rebind` passing the old context node reference to the binding process, which results in `self` word in `reactor!/on-change*` getting bound to the new object, therefore holding a reference to the big series even after `r` has been GCed. 🤕 
    
    Note that putting the above testing code inside a file and evaluating that file using `do` will not show a reduction in memory after the GC pass. That is caused by the loaded file being held on the stack and having the `r` word inside it bound to global context thus referencing the big series indirectly. Once the file evaluating is done, invoking a new GC pass will then free the big series as expected:
    ```
    >> do %5220.red
    270256244
    == 270256244
    >> recycle
    == 1818812
    ```
    
    Solves memory leak in [REP#129](https://github.com/red/REP/issues/129).

--------------------------------------------------------------------------------

On 2022-10-04T13:41:41Z, dockimbel, commented:
<https://github.com/red/red/issues/5220#issuecomment-1267021175>

    Additional note: when running the test code from a file, the memory might seem to be leaking even after a new GC pass. This is caused by the internal `object/path-parent` and  `object/field-parent` global references. Overwriting them is achieved by evaluating an object path from an object with at least one event handler defined:
    
    ```
    >> do %5220red
    == 270256432
    >> recycle
    == 270255432
    >> a: object [b: 1 on-change*: func [w o n][]]
    >> a/b
    >> recycle
    == 1819348
    ```
    
    Trying to remove those internal global states in the past proved to be challenging. I will give it another try.

--------------------------------------------------------------------------------

On 2022-10-05T17:43:35Z, dockimbel, commented:
<https://github.com/red/red/issues/5220#issuecomment-1268741116>

    > Trying to remove those internal global states in the past proved to be challenging. I will give it another try.
    
    Actually it was easier than expected: https://github.com/red/red/commit/cbe19354196e97a830b34899ef8ae525833c7ced
    
    I just need to add a regression test and I'll close this ticket.

