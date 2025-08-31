
#4331: crash on WRITE-CLIPBOARD with BLOCK! argument
================================================================================
Issue is open, was reported by 9214 and has 12 comment(s).
[type.bug]
<https://github.com/red/red/issues/4331>

**Describe the bug**

`write-clipboard` accepts a `string!`, an `image!`, a `none!` or, judging by the spec, a `block!` of `file!`s. Passing a `block!` of something over than files leads to unexpected results or a crash.

**To reproduce**

* `string!` gets converted to `file!` on reading from clipboard:
```red
>> write-clipboard ["string" %file] read-clipboard
== [%string %file]
```

* anything over than `string!` or `file!` leads to a crash:
```red
>> write-clipboard [boom] read-clipboard
```
```red
*** Runtime Error 98: assertion failed
*** in file: .../red/runtime/clipboard.reds
*** at line: 400
***
***   stack: red/clipboard/write 00000062h
***   stack: red/clipboard/write 02C323E4h
***   stack: write-clipboard 02C323E4h
***   stack: red/interpreter/exec-routine 02DC5718h
***   stack: red/interpreter/eval-code 02DC5718h 031B8508h 031B8518h false 00000000h 00000000h 02DC5718h
***   stack: red/interpreter/eval-expression 031B84F8h 031B8518h false false false
***   stack: red/interpreter/eval 02C323B4h true
***   stack: red/natives/catch* true 1
***   stack: ctx||520~try-do 00BF2504h
***   stack: ctx||520~do-command 00BF2504h
***   stack: ctx||520~eval-command 00BF2504h
***   stack: ctx||520~run 00BF2504h
***   stack: ctx||520~launch 00BF2504h
***   stack: ctx||553~launch 00BF1C58h
```


**Expected behavior**

Perhaps anything over than `string!` or `block!` of `file!`s should be `mold`ed.

**Platform version**

Latest, W10.


Comments:
--------------------------------------------------------------------------------

On 2020-03-11T19:02:10Z, greggirwin, commented:
<https://github.com/red/red/issues/4331#issuecomment-597812598>

    What is the use case for block of files I wonder. With ports coming, unless there's a need for that feature, I would narrow the spec to `[any-string! image! none!]`.

--------------------------------------------------------------------------------

On 2020-03-11T19:15:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/4331#issuecomment-597818935>

    Selecting files in the shell and pasting or drag & dropping them into Red.
    
    Maybe we should throw an error when anything but string/file is found in the block? As chances that your files are named following Red values are pretty slim and it's likely you're doing something you don't want to.

--------------------------------------------------------------------------------

On 2021-10-17T23:35:26Z, endo64, commented:
<https://github.com/red/red/issues/4331#issuecomment-945217485>

    A useful behavior `write-clipboard` with a block would be writing items in the block separated with newlines.
    Something like `write/lines clipboard:// [1 2 3] ; == "1^/2^/3"`

--------------------------------------------------------------------------------

On 2021-11-17T07:58:26Z, qtxie, commented:
<https://github.com/red/red/issues/4331#issuecomment-971326202>

    I would like to use block! to write multiple items into the clipboard. For example, a text and an image at the same time.

--------------------------------------------------------------------------------

On 2021-11-17T18:53:34Z, greggirwin, commented:
<https://github.com/red/red/issues/4331#issuecomment-971874794>

    The tricky thing about custom clipboard formats is that other apps won't understand them. If it was standard in all Red apps, that means we don't need a custom clipboard daemon and system. I don't see a pure binary format for Windows, so not sure how we'd do it. The way multiple formats work, IIUC, is that it's the same data, just in different formats.
    
    Hooking hot-keys globally would let us have our own system that works in parallel to the OS clipboard, allowing full control over data, history, multiple clipboards, sharing, etc. If another app writes to the clipboard, it won't know about our system, so we can't extend the OS clipboard with features, outside of data munging trickery. That could still be pretty cool. If you could attach listeners, say something like DiaGrammar or TruTiles, copying a dialected command they understand could tell them to render both the original text _and_ an image to the clipboard, which other apps could see.

--------------------------------------------------------------------------------

On 2022-01-25T23:06:34Z, greggirwin, commented:
<https://github.com/red/red/issues/4331#issuecomment-1021691964>

    https://gitter.im/red/help?at=61ef58a6f5a3947800207565

