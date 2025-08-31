
#5280: Abnormal performances in Parse's TO command
================================================================================
Issue is closed, was reported by dockimbel and has 18 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5280>

The result of the following benchmarks should be about the same.
```
nonzero: complement zero: charset "^@"
s: append/dup make string! 100'000 null 100'000

clock/times [parse s [to nonzero]] 100
; 5.44 ms  

append s #"a"
clock/times [parse s [to nonzero]] 100
; 190 μs 
```
The second test is ~27 times faster than the first one!

**Platform version**
All.


Comments:
--------------------------------------------------------------------------------

On 2023-02-11T20:28:45Z, dockimbel, commented:
<https://github.com/red/red/issues/5280#issuecomment-1426870370>

    The fast path for `TO <value>` is taken in both cases, but when the outcome is a no-match, instead of exiting the rule, the slow path is taken also.

--------------------------------------------------------------------------------

On 2023-02-11T21:35:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/5280#issuecomment-1426881238>

    While you're at it, maybe you could also address this one (or it's the same issue):
    ```
    >> clock/times [parse s [some zero]] 1000
    544 μs	[parse s [some zero]]
    >> clock/times [parse/case s [some #"^@"]] 1000
    2.40 ms	[parse/case s [some #"^@"]]
    >> clock/times [parse s [some #"^@"]] 1000
    4.75 ms	[parse s [some #"^@"]]
    ```

--------------------------------------------------------------------------------

On 2023-02-13T15:58:29Z, dockimbel, commented:
<https://github.com/red/red/issues/5280#issuecomment-1428190779>

    > While you're at it, maybe you could also address this one (or it's the same issue):
    
    No issue there. Just a much more optimized code for the bitset fast-path compared to the char fast-path (which still uses generic runtime code). I will see if that code can be optimized with more specialized code.

--------------------------------------------------------------------------------

On 2023-02-13T19:54:59Z, dockimbel, commented:
<https://github.com/red/red/issues/5280#issuecomment-1428567616>

    > parse/case s [some #"^@"]
    
    This case has been heavily optimized, so should run much faster now (about 7 times faster)
    
    > parse s [some #"^@"]
    
    This case is just about twice faster now, as the case-insensitive comparison required is still expensive. There's some space for optimizing that comparison also, will give it a quick try.

--------------------------------------------------------------------------------

On 2023-02-14T20:41:50Z, dockimbel, commented:
<https://github.com/red/red/issues/5280#issuecomment-1430347470>

    Pushed [new optimizations](https://github.com/red/red/commit/88a15e408c0571e1a4bff04aa5eeac3b6de577d0) for looping over a char! value in Parse.
    
    @hiiamboris Happy with the benchmark results now? ;-)

--------------------------------------------------------------------------------

On 2023-02-14T21:31:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/5280#issuecomment-1430405143>

    Woohoo! Beats R3 by quite a margin:
    ```
    Red:
    694 μs  [parse s [some zero]]
    460 μs  [parse s [to nonzero]]
    361 μs  [parse s [some #"^@"]]
    230 μs  [parse/case s [some #"^@"]]
    
    R3:
    1.0x (1ms)         | 5      | 0      | 0      | 0           | [parse s [some zero]]
    1.0x (720μs)       | 4      | 0      | 0      | 0           | [parse s [to nonzero]]
    1.0x (841μs)       | 5      | 0      | 0      | 0           | [parse s [some #"^@"]]
    1.0x (815μs)       | 5      | 0      | 0      | 0           | [parse/case s [some #"^@"]]
    ```
    R/S for the win! :)

--------------------------------------------------------------------------------

On 2023-02-14T21:39:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/5280#issuecomment-1430412706>

    R3 however still wins with 100x performance in [this test](https://gist.github.com/hiiamboris/c29f1d4f315a760a103b4bb46b48c183) in `using-parse-collect` :)

--------------------------------------------------------------------------------

On 2023-02-17T18:52:06Z, dockimbel, commented:
<https://github.com/red/red/issues/5280#issuecomment-1435096556>

    > R3 however still wins with 100x performance in [this test](https://gist.github.com/hiiamboris/c29f1d4f315a760a103b4bb46b48c183) in using-parse-collect :)
    
    Several causes for that:
    
    1. `to end` has a fast-path in Rebol, but was not implemented in Red as there are no ways to consistently support it among many simple variations (e.g. `to [end]` is orders of magnitude slower). Though, the `to end` form is often used to skip the input to the end, so maybe worth extra code to speed it up. That [was added](https://github.com/red/red/commit/1ea076c4177b31897663433490c45049f1e93045) in Red recently, producing a significant speed-up in the above code case.
    2. That code case implies injecting higher codepoints into an empty string, which defaults to UCS-1 internal encoding. Due to Red's different internal string encodings, allocating on each run two strings of roughly 100KB that would then need to be internally re-allocated and their content re-encoded, is not a good practice in Red if performance is the goal. Modifying the test code to account for that, like inserting `take/last append st1000 #"¿"` before the profiling starts and reserving a bigger output buffer like `out: make string! 3 * length? str`, makes a significant difference in the benchmark results. We should have a way to create pre-allocated strings with a given encoding, like `make string! [100'000 UCS-2]` and a way to directly check/modify a string encoding.
    3. The GC triggers a lot in this code case, accounting for most of the time spent. Try running that code with `recycle/off` and see the huge difference. One big contributor is the point 2. However, even with the above code adjustments, the time spent in the GC still dominates the benchmark. AFAIK, Rebol has an efficient handling of short-lived series, Red does not have anything similar yet, so it shows in some edge cases like that one.

--------------------------------------------------------------------------------

On 2023-02-17T19:26:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/5280#issuecomment-1435134084>

    Thanks for investigating this @dockimbel :)

