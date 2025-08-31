
#4515: Compiled/interpreted `reduce/into` differences
================================================================================
Issue is open, was reported by hiiamboris and has 10 comment(s).
[type.compiler]
<https://github.com/red/red/issues/4515>

**Describe the bug**

Compiled works as `insert`, interpreted as `append`.

**To reproduce**

Use this script:
```
Red []
b: reduce/into [1 + 2 3 4] clear []
probe b
probe head b
```
Interpreted:
```
[3 3 4]
[3 3 4]
```
Compiled:
```
[]     
[3 3 4]
```

**Expected behavior**

Both work the same way (as `append`?).

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



Comments:
--------------------------------------------------------------------------------

On 2020-08-19T17:24:19Z, 9214, commented:
<https://github.com/red/red/issues/4515#issuecomment-676557944>

    On a quick glance, at least GUI console relies on `reduce/into` insertion. Some of the tests also assume insertion. On the other hand, things like `collect/into` ~~and `transcode/into`~~ https://github.com/red/red/issues/4630 always append.
    
    ---
    
    It's not a compiler/interpreter issue, but `reduce` native quirk:
    
    https://github.com/red/red/blob/b0e52d4b83ebd5a3ff42e43cbf0cfd26fcbfb838/runtime/natives.reds#L915-L919
    
    https://github.com/red/red/blob/b0e52d4b83ebd5a3ff42e43cbf0cfd26fcbfb838/runtime/natives.reds#L943
    
    So it appends if block is empty (or rather at the tail), and inserts otherwise.
    ```red
    Red []
    b: reduce/into [1 + 2 3 4] [|]
    probe b
    probe head b
    ```
    Both compiled and interpreted:
    ```red
    [|]
    [3 3 4 |]
    ```

--------------------------------------------------------------------------------

On 2020-08-19T18:53:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/4515#issuecomment-676600655>

    I did a full review [here](https://github.com/red/red/issues/4109). TL;DR: GUI console's case will only get faster with appending /into, and as usual I'm advocating for appending behavior.

--------------------------------------------------------------------------------

On 2020-08-19T19:13:18Z, 9214, commented:
<https://github.com/red/red/issues/4515#issuecomment-676609895>

    @hiiamboris thanks, totally forgot about this list.
    
    Something makes me think that evaluating/loading primitives like `reduce` and `transcode` might benefit from more fine-grained `insert` behavior, unless `insert reduce ...` is cheaper (+ it has more versatile refinements). For data collecting, `append/only` behavior makes more sense in the general case, I agree.
    

--------------------------------------------------------------------------------

On 2020-08-19T19:27:11Z, hiiamboris, commented:
<https://github.com/red/red/issues/4515#issuecomment-676616363>

    `insert reduce` is cheaper with longer inserted series because it's O(1). *Currently* it is hindered a bit in performance because of our *temporary* GC. But once we have solid optimized GC, I see no reason why it should not come out as a clear winner in both code readability (achieved by removing `tail` from 99% use cases) *and* performance (achieved by O(1) complexity).
    
    > append/only
    
    Why `/only` though? I never even considered it I think.

--------------------------------------------------------------------------------

On 2020-08-19T20:05:35Z, 9214, commented:
<https://github.com/red/red/issues/4515#issuecomment-676634359>

    @hiiamboris I meant that `/into` behaves like `append/only`.
    ```red
    >> reduce/into [quote (a b)] block: []
    == [(a b)] ; not [a b]
    ```

