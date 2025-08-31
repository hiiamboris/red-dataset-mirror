
#4197: [Parse] COLLECT trashes series buffer
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4197>

Related: https://github.com/red/red/issues/565, https://github.com/red/red/issues/596

**Describe the bug**

By default, `collect` allocates a new block to `keep` values into. Top-level `collect` creates a fresh block which will be returned by `parse`; nested `collect` allocates block inside its parent's block.

`collect into` is an optimized version that uses an existing buffer rather than allocating a new one. 

There are two non-obvious upshots here:

1. `collect into` allows _any_ series buffer to be used;
1.  In `collect into ... [collect ...]` 2nd `collect` will allocate _inside_ the buffer used by the 1st `collect`.

**(1)** is fine as long as Parse's input and `collect`'s buffer have compatible datatypes. **(2)** is a Pandora box waiting to be opened.

Now brace yourselves, here be dragons.

**To reproduce**

This one is OK, since Red knows how to insert words into strings:

```red
>> stash: make string! 4
== ""
>> parse [a b c d][collect into stash [some keep skip]]
== true
>> stash
== "abcd"
```

But does it know how to insert them into vectors..?
```red
>> stash: make vector! [1 2 3]
== make vector! [1 2 3]
>> parse [a b c d][collect into stash [some keep skip]]
== true
>> stash
== make vector! [15 8796292 492 439 15 8796292 482 428 15 8796292 493 440 15 8796292 494 441 1 2 3]
```

So, 4 `word!` cells were inserted as 16 integers (one for each struct field). Cool. What about images?

```red
>> stash: make image! 0x0
== make image! [0x0 #{}]
>> parse [a b c d][collect into stash [some keep skip]]
```
```
*** Runtime Error 1: access violation
*** in file: .../red/runtime/datatypes/block.reds
*** at line: 1419
***
***   stack: red/block/insert 02D28510h 0311A430h 00000000h true 00000000h false
***   stack: red/parser/process 02D41A08h 02BD2CF4h 0 0 02BD2CD4h
***   stack: red/natives/parse* false -1 0 -1
***   stack: red/interpreter/eval-arguments 02D20670h 0311A3A8h 0311A3A8h 00000000h 00000000h
***   stack: red/interpreter/eval-code 02D20670h 0311A388h 0311A3A8h false 00000000h 00000000h 02D20670h
***   stack: red/interpreter/eval-expression 0311A388h 0311A3A8h false false false
***   stack: red/interpreter/eval 02BD2CB4h true
***   stack: red/natives/catch* true 1
***   stack: ctx||504~try-do 026B0508h
***   stack: ctx||504~do-command 026B0508h
***   stack: ctx||504~eval-command 026B0508h
***   stack: ctx||504~run 026B0508h
***   stack: ctx||504~launch 026B0508h
***   stack: ctx||536~launch 026AF7C4h
```

And what happens with `collect into ... [collect ...]`? Well, _obviously_, `block!` cell is allocated inside a buffer.

```red
>> stash: make binary! 4
== #{}
>> parse [a b c d][collect into stash [collect some keep skip]]
== true
>> stash
== #{0500000000000000C8FB850000000000}
```

Indeed, series now contains 16 bytes, `05` is a datatype ID tag in cell's header, while `C8FB8500` is a node pointer. Now try to call `recycle` after that.

```
root: 4431/5466, runs: 0, mem: 3288112
*** Runtime Error 1: access violation
*** in file: .../red/runtime/allocator.reds
*** at line: 458
***
***   stack: red/update-series 031316B4h 120144 856
***   stack: red/cross-compact-frame 02FD0004h 00F14E88h
***   stack: red/collect-frames 1
***   stack: red/collector/do-mark-sweep
***   stack: red/collector/do-cycle
***   stack: red/alloc-series-buffer 2 16 0
***   stack: red/alloc-series 2 16 0
***   stack: red/alloc-cells 2
***   stack: red/block/make-at 02842DE4h 2
***   stack: red/block/push-only* 2
***   stack: ctx||389~on-change* 00EBF58Ch
***   stack: red/_function/call 0302A3A8h 00EBF58Ch
***   stack: red/object/fire-on-set 03029C60h 0283B6A4h 02842CE4h 02842CD4h
***   stack: red/object/eval-path 03029C60h 0283B6A4h 02842CD4h 00000000h false
***   stack: red/actions/eval-path 03029C60h 0283B6A4h 02842CD4h 00000000h false
***   stack: red/set-path* 03029C60h 0283B6A4h
***   stack: ctx||564~calc-last-line 00EBF598h
***   stack: ctx||564~calc-top 00EBF598h
***   stack: ctx||564~add-line 00EBF598h
***   stack: ask
***   stack: ctx||504~run 00EC0508h
***   stack: ctx||504~launch 00EC0508h
***   stack: ctx||536~launch 00EBF7C4h
```

Not only `block!` cell was allocated, but the garbage collector became aware of it. And since it's not referenced from anywhere, GC attempted to dispose of it.

**Expected behavior**

`collect` semantics is ill-defined and does not cover such edge cases, but I'd expect at least some form of poka-yoke type checking for `collect into` and complete absence of `collect into ... [collect ...]` shenanigans.

Other than that, the writing is on the wall: Parse `collect` warrants a thorough design review.

**Platform version**

The latest build, all platforms.


