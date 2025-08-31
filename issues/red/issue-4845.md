
#4845: problematic identity comparison of SCALAR! values
================================================================================
Issue is closed, was reported by 9214 and has 12 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4845>

**Describe the bug**
Some of the scalar values created from their literals always yield `false` when compared for identity with themselves. 

**To reproduce**
```red
>> 1.2.3 =? 1.2.3
== false
>> 1x2 =? 1x2
== false
>> 1:2 =? 1:2
== false
>> 1% =? 1%
== false

>> 1 =? 1
== true
>> 1.2 =? 1.2
== true
>> 1-2-3 =? 1-2-3
== true
>> $1 =? $1
== true
>> #"1" =? #"1"
== true
```

This happens because the lexer doesn't zero-out all the bytes in a freshly allocated slot's payload (see https://github.com/red/red/issues/4825#issuecomment-787536910). For the majority of datatypes, this type of "raw" equality implies byte-identical payloads.
https://github.com/red/red/blob/6de9b93c5c4a15a4fa14a029a845051bc4ad71b4/runtime/natives.reds#L819-L823

With `pair!` it's even worse:
```red
>> same? make pair! [1 2] make pair! [1 2]
== false
```

[`make-at`](https://github.com/red/red/blob/6de9b93c5c4a15a4fa14a029a845051bc4ad71b4/runtime/datatypes/pair.reds#L73) does not zero-out [`padding`](https://github.com/red/red/blob/master/runtime/datatypes/structures.reds#L223) in `pair!` slot. It can either do that, or there should be a separate `TYPE_PAIR` branch in [`same?`](https://github.com/red/red/blob/6de9b93c5c4a15a4fa14a029a845051bc4ad71b4/runtime/natives.reds#L776) native that compares only `x` and `y` fields.

**Expected behavior**
`=?` and `same?` should return `true` if scalar values on both sides of the comparison are the same, i.e. it should have the effect of `==` and `strict-equal?`. The way I see it, [`alloc-slot`](https://github.com/red/red/blob/6de9b93c5c4a15a4fa14a029a845051bc4ad71b4/runtime/lexer.reds#L517) should do an extra job by zeroing-out the payload, at the cost of a slight performance penalty.

**Platform version**
W10, 6de9b93.


Comments:
--------------------------------------------------------------------------------

On 2021-03-02T17:22:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/4845#issuecomment-789073502>

    > The way I see it, alloc-slot should do an extra job by zeroing-out the payload, at the cost of a slight performance penalty.
    
    :+1:
    Let me just add that creators of D lang, which like C mainly focuses on performance, still decided to zero-fill every array ever allocated, and only in the rare case when that is not desired one would call `malloc` manually and embrace all the dangers.

--------------------------------------------------------------------------------

On 2021-03-02T23:38:52Z, qtxie, commented:
<https://github.com/red/red/issues/4845#issuecomment-789302881>

    The main issue is in same?, it should not assume the unused part of two cells has the same bits.
    
    If we choose to zero-fill slot, we need to it in other places too, not just in the lexer. e.g. slot in block, slot on stack, etc.

--------------------------------------------------------------------------------

On 2021-03-03T09:15:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/4845#issuecomment-789563001>

    How will GC fare with garbage in the cells? Will it not take it for node pointers?

--------------------------------------------------------------------------------

On 2021-03-04T07:22:43Z, qtxie, commented:
<https://github.com/red/red/issues/4845#issuecomment-790384024>

    > How will GC fare with garbage in the cells? Will it not take it for node pointers?
    
    If the garbage on native stack, yes. Even valid value may looks like a pointer, e.g floating point.

--------------------------------------------------------------------------------

On 2021-03-04T09:08:44Z, hiiamboris, commented:
<https://github.com/red/red/issues/4845#issuecomment-790455502>

    So garbage will keep freed memory from being released.

--------------------------------------------------------------------------------

On 2021-04-24T12:09:03Z, dockimbel, commented:
<https://github.com/red/red/issues/4845#issuecomment-826083443>

    As @qtxie said, the issue lies in `same?` implementation, doing a cell-wide comparison, even for unused bytes.
    
    > So garbage will keep freed memory from being released.
    
    The accuracy of the stack pointer scanning during a GC is a separate issue. It does not relate only to garbage data possible present on the native stack, but more generally on possible misinterpretation of some values as node pointers. We do have a general solution for this class of issues, but it's not yet implemented (requires expanding the R/S linker with function's metadata).

