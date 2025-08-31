
#4552: crash on probing context of SELF
================================================================================
Issue is closed, was reported by 9214 and has 6 comment(s).
[status.built] [status.tested] [test.written] [type.design]
<https://github.com/red/red/issues/4552>

**Describe the bug**
`self` is considered a keyword that objects use to refer to themselves. In some cases, the context to which these words are bound is malformed.

**To reproduce**
Minimal example (paste in console):
```red
context? object [return quote self]
```

To follow along, compile the script below with specified flags and execute it:
```red
Red [Note: "-r -e -d flags"]

dissect: routine [word [word!]][dump4 word/ctx/value]
recycle ; trigger series frame compaction
probe context? dissect object [return quote self]
```

Symbolic values hold a reference to a context to which they are bound. At implementation level such binding is realized as an indirect pointer to a series buffer with two slots:
1. `context!` itself;
1. So-called back-reference, which is an exact copy of an `object!` or `function!` that provides a context to a symbolic value.

Diagrammatically:

<img src="https://user-images.githubusercontent.com/15716466/85756592-3f24f300-b70f-11ea-8318-77460c3a1ccd.png" width="500">

When `context?` is called, it simply follows the binding and fetches the second slot.

```
root: 2755/5464, runs: 0, mem: 1381652 => 1376056, mark: 4.9ms, sweep: 1.0ms

Hex dump from: 02E16784h

02E16784: A0000010 00E63834  00000010 02E16798  ?..?48?.?...?g??
02E16794: 02E167A8 00000020  00E6381C 00000000  ?g?? ...?8?.....
02E167A4: 00000000 BADCAFE0  A0000004 00E63838  ....?????..?88?.
02E167B4: 00000030 02E167C0  02E167C0 BADCAFE0  0...?g???g??????
02E167C4: BADCAFE0 BADCAFE0  BADCAFE0 BADCAFE0  ????????????????
02E167D4: BADCAFE0 BADCAFE0  BADCAFE0 BADCAFE0  ????????????????
02E167E4: BADCAFE0 BADCAFE0  BADCAFE0 BADCAFE0  ????????????????
02E167F4: A0000010 00E6383C  00000080 02E16808  ?..?<8?.?...?h??

*** Runtime Error 1: access violation
*** in file: .../red/runtime/datatypes/string.reds
*** at line: 1079
***
***   stack: red/string/concatenate-literal-part 02663344h 00000000h 0
***   stack: red/datatype/form 02E16950h 02663344h 00000000h 0
***   stack: red/actions/form 02E16950h 02663344h 00000000h 0
***   stack: red/error/reduce 02663324h 02663304h
***   stack: red/error/form 02663304h 02663314h 026632F4h -18
***   stack: red/actions/form 02663304h 02663314h 026632F4h 0
***   stack: red/actions/form* -1
***   stack: red/natives/do-print false true
***   stack: red/natives/print* false
***   stack: red/stack/throw-error 02663354h
***   stack: red/fire 1 0019FDB4h
***   stack: red/type-check 0264E884h 0 02663324h
***   stack: probe
***   stack: red/_function/call 02663314h 00E33884h
***   stack: red/interpreter/eval-code 02663314h 02DD5198h 02DD5198h false 00000000h 00000000h 02B339E8h
***   stack: red/interpreter/eval-expression 02DD5148h 02DD5198h false false false
***   stack: red/interpreter/eval 02663304h true
***   stack: red/natives/do* true -1 -1 -1
```

What we are looking at in the hex dump is the content of the series buffer. First 5 machine words is a [metainfo](https://github.com/red/red/blob/22a523f2367328c5bf06a52f689c88076e238eec/runtime/allocator.reds#L64), after that follows `object!` slot (note the `20h` datatype ID tag): it is evident that layout does not match the expected one.

After `object!` slot follows a `BADCAFE0` machine word (allocator leaves such breadcrumbs in compacted memory regions), and then another series buffer (it's easy to spot by distinguished `A0000004` header).

https://github.com/red/red/blob/22a523f2367328c5bf06a52f689c88076e238eec/runtime/allocator.reds#L815

This layout turns out to be a special case for `self`, which can probably explain https://github.com/red/red/issues/4501, https://github.com/red/red/issues/3797, https://github.com/red/red/issues/3634:
https://github.com/red/red/blob/22a523f2367328c5bf06a52f689c88076e238eec/runtime/datatypes/context.reds#L292

https://github.com/red/red/blob/22a523f2367328c5bf06a52f689c88076e238eec/runtime/datatypes/context.reds#L489

https://github.com/red/red/blob/22a523f2367328c5bf06a52f689c88076e238eec/runtime/datatypes/object.reds#L242

**Expected behavior**
I expect `context?` to return an object to which `self` is supposed to be bound. And unless there are strong reasons for keeping it as-is, I'd prefer context layout to follow the same format as described above (that would spare me from turning bald while writing Redbin codec).

**Platform version**
22a523f



Comments:
--------------------------------------------------------------------------------

On 2020-06-25T17:12:06Z, 9214, commented:
<https://github.com/red/red/issues/4552#issuecomment-649709378>

    Bonus content: why it works e.g. with `context? object [return 'self]`?
    
    Because of `bind`'s logic. It takes hold of `[return 'self]` block and starts traversing it. On encountering `word!` that looks like `self` it will amend it's binding to the above-mentioned context, and that will eventually lead to a crash.
    
    The thing is that `bind` does that only for `word!` values, not for any value from `any-word!` typeset:
    https://github.com/red/red/blob/22a523f2367328c5bf06a52f689c88076e238eec/runtime/datatypes/context.reds#L491
    
    Originally this investigation started with `on-change*` that has 4 such instances of `self` in its body.

--------------------------------------------------------------------------------

On 2020-06-25T17:45:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/4552#issuecomment-649726222>

    Great investigation!

--------------------------------------------------------------------------------

On 2022-05-20T00:33:21Z, ALANVF, commented:
<https://github.com/red/red/issues/4552#issuecomment-1132326066>

    Just to note, this code also crashes for a similar reason:
    ```red
    o: make object! [ f: does [self] ]
    context? first body-of :o/f
    ```

