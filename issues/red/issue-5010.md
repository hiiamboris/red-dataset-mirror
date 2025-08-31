
#5010: CRASH manifests in recent builds
================================================================================
Issue is closed, was reported by hiiamboris and has 60 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5010>

**Describe the bug**

Recent builds experience GC-related crashes when `do/trace` is combined with `#include`.
For me all builds of commit #2b5d37a crash with this script.

**To reproduce**

- grab files from [here](https://gitlab.com/hiiamboris/red-junk/-/tree/master/gc-bug-2021-12-18)
- run `console.exe bug1.red` (with any *recent* console)

**Expected behavior**

Script should just silently finish.

**Platform version**
```
Red 0.6.4 for Windows built 17-Dec-2021/23:20:59+03:00  commit #2b5d37a
```



Comments:
--------------------------------------------------------------------------------

On 2021-12-18T15:07:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/5010#issuecomment-997215328>

    Now I have a feeling it's not GC related, because I uploaded another crash setting (bug4 to bug6.red), and tried as I might to turn off the GC and it still crashes with:
    ```
    *** Runtime Error 1: access violation
    *** in file: /D/devel/red/red-src/red/runtime/datatypes/string.reds
    *** at line: 654
    ***
    ***   stack: red/string/append-char 07A60014h 32
    ***   stack: red/string/insert 049DD484h 049DD494h 049DD474h false 049DD4A4h false
    ***   stack: red/actions/insert 049DD484h 049DD494h 049DD474h false 049DD4A4h false
    ***   stack: red/actions/insert* -1 -1 2
    ***   stack: pad
    ***   stack: red/_function/call 049DD424h 04AE3884h 056C5138h 0
    ***   stack: red/interpreter/eval-code 05313EA8h 056C5188h 056C5188h 056C50D0h false 00000000h 00000000h 05313EA8h
    ***   stack: red/interpreter/eval-expression 056C5148h 056C5188h 056C50D0h false false false
    ***   stack: red/interpreter/eval 056C50D0h true
    ***   stack: red/interpreter/eval-function 049CB8D4h 056C50D0h 049BFA74h
    ***   stack: red/_function/call 049CB8D4h 04AE3884h 049BFA74h 0
    ***   stack: red/interpreter/fire-event 512 049DD3D4h 055E7588h 0053D41Ch 05311D98h
    ***   stack: red/interpreter/eval-path 055E7560h 055E7570h 055E7570h 00000000h false false false false
    ***   stack: red/interpreter/eval-expression 055E7570h 055E7570h 00000000h false false false
    ***   stack: red/interpreter/eval-next 055E7560h 055E7570h false
    ***   stack: red/natives/all* false
    ***   stack: red/interpreter/eval-arguments 049DD384h 055E7508h 055E7528h 049DD364h 00000000h 00000000h 05310668h
    ***   stack: red/interpreter/eval-code 05310668h 055E74F8h 055E7528h 049DD364h true 00000000h 00000000h 05310668h
    ***   stack: red/interpreter/eval-expression 055E74F8h 055E7528h 049DD364h false true false
    ***   stack: red/interpreter/eval-arguments 049DD374h 055E74E8h 055E7528h 049DD364h 00000000h 00000000h 05310B28h
    ***   stack: red/interpreter/eval-code 05310B28h 055E74E8h 055E7528h 049DD364h false 00000000h 00000000h 05310B28h
    ***   stack: red/interpreter/eval-expression 055E74E8h 055E7528h 049DD364h false false false
    ***   stack: red/interpreter/eval 049DD364h true
    ***   stack: red/natives/if* false
    ***   stack: red/interpreter/eval-arguments 049DD344h 055E74C0h 055E74C0h 055E6F38h 00000000h 00000000h 0530FEE8h
    ***   stack: red/interpreter/eval-code 0530FEE8h 055E74A0h 055E74C0h 055E6F38h false 00000000h 00000000h 0530FEE8h
    ***   stack: red/interpreter/eval-expression 055E74A0h 055E74C0h 055E6F38h false false false
    ***   stack: red/interpreter/eval 055E6F38h false
    ***   stack: red/parser/eval 055E6F38h true false
    ***   stack: red/parser/process 049DD314h 049DD324h 0 0 049DD304h
    ***   stack: red/natives/parse* true -1 0 -1
    ***   stack: ctx||386~expand 04ADC2A4h
    ***   stack: expand-directives 04ADC2A4h
    ***   stack: do-file
    ***   stack: red/natives/do* false -1 -1 -1 -1
    ***   stack: red/interpreter/eval-arguments 049DD0C4h 056871B0h 056871B0h 049DD0A4h 00000000h 00000000h 05310C88h
    ***   stack: red/interpreter/eval-code 05310C88h 056871A0h 056871B0h 049DD0A4h false 00000000h 00000000h 05310C88h
    ***   stack: red/interpreter/eval-expression 056871A0h 056871B0h 049DD0A4h false false false
    ***   stack: red/interpreter/eval 049DD0A4h true
    ***   stack: red/natives/do* false -1 -1 -1 1
    ```
    To reproduce this one, run the console with `bug4.red` as argument

--------------------------------------------------------------------------------

On 2021-12-18T15:22:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/5010#issuecomment-997217206>

    If in the previous `bug4`-`bug6` scenario we change `bug6.red` contents to:
    ```
    Red []
    [
    	xxxxxxxxxxxx  [ppppp qqqqq rrrrr sssss ttttt uuuuu]
    	xxxxxxxxxxxxxxxxx []
    ]
    ```
    Then another stack trace appears:
    ```
    
    *** Runtime Error 101: no value matched in SWITCH
    *** in file: /D/devel/red/red-src/red/runtime/datatypes/string.reds
    *** at line: 1164
    ***
    ***   stack: red/string/alter 00000065h 00441671h 52483156 1 false 0
    ***   stack: red/string/alter 0320D454h 04BF9968h 80937716 0 true 0
    ***   stack: red/string/concatenate 0320D454h 04BF9968h 80937716 0 true false
    ***   stack: red/string/form 04BF9968h 0320D454h 0320D454h -48731
    ***   stack: red/word/form 04C29738h 0320D454h 0320D454h -48731
    ***   stack: red/word/mold 04C29738h 0320D454h false false true 0320D454h -48731 2
    ***   stack: red/object/serialize 04CCC100h 0320D454h false false true 0320D454h -48731 false 2 true
    ***   stack: red/object/mold 04CCC100h 0320D454h false false true 0320D454h -894 1
    ***   stack: red/actions/mold 04CCC100h 0320D454h false false true 0320D454h -894 1
    ***   stack: red/object/serialize 0320D444h 0320D454h false false true 0320D454h -894 false 1 true
    ***   stack: red/object/mold 0320D444h 0320D454h false false true 0320D454h 20 0
    ***   stack: red/actions/mold 0320D444h 0320D454h false false true 0320D454h 20 0
    ***   stack: red/actions/mold* -1 -1 2 1
    ***   stack: red/interpreter/eval-arguments 0320D434h 057219C8h 057219D8h 05721920h 05721998h 057219F0h 04C00658h
    ***   stack: red/interpreter/eval-code 04C00658h 057219A8h 057219D8h 05721920h true 05721998h 057219F0h 04C00658h
    ***   stack: red/interpreter/eval-path 05721998h 057219A8h 057219D8h 05721920h false false true false
    ***   stack: red/interpreter/eval-expression 057219A8h 057219D8h 05721920h false true false
    ***   stack: red/interpreter/eval-arguments 04C03EA8h 05721998h 057219D8h 05721920h 00000000h 00000000h 04C03EA8h
    ***   stack: red/interpreter/eval-code 04C03EA8h 05721998h 057219D8h 05721920h false 00000000h 00000000h 04C03EA8h
    ***   stack: red/interpreter/eval-expression 05721998h 057219D8h 05721920h false false false
    ***   stack: red/interpreter/eval 05721920h true
    ***   stack: red/interpreter/eval-function 031FB8D4h 05721920h 031EFA74h
    ***   stack: red/_function/call 031FB8D4h 04AE3884h 031EFA74h 0
    ***   stack: red/interpreter/fire-event 512 0320D3D4h 05677588h 0053D41Ch 04C01D98h
    ***   stack: red/interpreter/eval-path 05677560h 05677570h 05677570h 00000000h false false false false
    ***   stack: red/interpreter/eval-expression 05677570h 05677570h 00000000h false false false
    ***   stack: red/interpreter/eval-next 05677560h 05677570h false
    ***   stack: red/natives/all* false
    ***   stack: red/interpreter/eval-arguments 0320D384h 05677508h 05677528h 0320D364h 00000000h 00000000h 04C00668h
    ***   stack: red/interpreter/eval-code 04C00668h 056774F8h 05677528h 0320D364h true 00000000h 00000000h 04C00668h
    ***   stack: red/interpreter/eval-expression 056774F8h 05677528h 0320D364h false true false
    ***   stack: red/interpreter/eval-arguments 0320D374h 056774E8h 05677528h 0320D364h 00000000h 00000000h 04C00B28h
    ***   stack: red/interpreter/eval-code 04C00B28h 056774E8h 05677528h 0320D364h false 00000000h 00000000h 04C00B28h
    ***   stack: red/interpreter/eval-expression 056774E8h 05677528h 0320D364h false false false
    ***   stack: red/interpreter/eval 0320D364h true
    ***   stack: red/natives/if* false
    ***   stack: red/interpreter/eval-arguments 0320D344h 056774C0h 056774C0h 05676F38h 00000000h 00000000h 04BFFEE8h
    ***   stack: red/interpreter/eval-code 04BFFEE8h 056774A0h 056774C0h 05676F38h false 00000000h 00000000h 04BFFEE8h
    ***   stack: red/interpreter/eval-expression 056774A0h 056774C0h 05676F38h false false false
    ***   stack: red/interpreter/eval 05676F38h false
    ```
    However, minor changes to the code may easily turn it back into the `red/string/append-char` stack trace in the post above.

--------------------------------------------------------------------------------

On 2021-12-18T16:48:01Z, dockimbel, commented:
<https://github.com/red/red/issues/5010#issuecomment-997229063>

    My attempts at reproducing it:
    
    - with CLI console (in debug mode): no issue at all, all of the provided scripts run to the end without any trouble.
    - with GUI console (in debug mode): `bug1` and `bug4` are crashing.

--------------------------------------------------------------------------------

On 2021-12-18T16:52:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/5010#issuecomment-997229629>

    Well for me both GUI console (debug) and CLI console (debug and release) - all are crashing. I'm glad you could reproduce it :) What may help for CLI console is increase of the number of `#include`s.

--------------------------------------------------------------------------------

On 2021-12-19T02:11:20Z, qtxie, commented:
<https://github.com/red/red/issues/5010#issuecomment-997316870>

    It's crashing only if I open the console, then `do %bug4.red`. Maybe a bug in the console or `interpreter event` code corrupts the memory. Considering it starts crashing in recent builds and both CLI console and GUI console are crashing, more like a bug in the `interpreter event` code.

--------------------------------------------------------------------------------

On 2021-12-19T02:28:50Z, qtxie, commented:
<https://github.com/red/red/issues/5010#issuecomment-997318389>

    The crashes was introduced in this commit: 68596974340e67d8e669f5f08003672931881ade

--------------------------------------------------------------------------------

On 2021-12-19T12:34:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/5010#issuecomment-997384821>

    > The crashes was introduced in this commit: [6859697](https://github.com/red/red/commit/68596974340e67d8e669f5f08003672931881ade)
    
    I confirm that none of the provided tests crash previous commit #bfc99612
    However I can crash it with [`bug7.red`](https://gitlab.com/hiiamboris/red-junk/-/blob/master/gc-bug-2021-12-18/bug7.red) (both GUI and CLI consoles):
    ```
    *** Runtime Error 98: assertion failed
    *** in file: /D/devel/red/red-src/red/system/runtime/libc.reds
    *** at line: 166
    ***
    ***   stack: copy-memory 058027D8h 058027E8h 256
    ***   stack: red/_series/change 04A904E4h 04A904F4h 04A90504h false 04A904D4h
    ***   stack: red/actions/change 04A904E4h 04A904F4h 04A90504h false 04A904D4h
    ***   stack: red/actions/change* 2 -1 -1
    ***   stack: red/interpreter/eval-arguments 04A904D4h 05801B68h 05801B68h 05801C40h 05801B18h 0572CD68h 0540FFF8h
    ***   stack: red/interpreter/eval-code 0540FFF8h 05801B28h 05801B68h 05801C40h true 05801B18h 0572CD68h 0540FFF8h
    ***   stack: red/interpreter/eval-path 05801B18h 05801B28h 05801B68h 05801C40h false false true false
    ***   stack: red/interpreter/eval-expression 05801B28h 05801B68h 05801C40h false true false
    ***   stack: red/interpreter/eval-expression 05801B18h 05801B68h 05801C40h false false false
    ***   stack: red/interpreter/eval 05801C40h false
    ***   stack: red/parser/eval 05801C40h true false
    ***   stack: red/parser/process 04A90494h 04A904A4h 0 0 04A90484h
    ***   stack: red/natives/parse* true -1 0 -1
    ***   stack: ctx||383~expand 0342C1B8h
    ***   stack: expand-directives 0342C1B8h
    ***   stack: ctx||571~launch 04B71280h
    ***   stack: ctx||606~launch 04B7094Ch
    ```
    Not sure if it's a symptom of the same bug, but clearly it's doing an overlapped memory copy.

--------------------------------------------------------------------------------

On 2021-12-19T12:40:47Z, qtxie, commented:
<https://github.com/red/red/issues/5010#issuecomment-997385578>

    > I confirm that none of the provided tests crash previous commit #bfc99612
    
    Would you please post the link of this commit? I cannot find it. 😓 

--------------------------------------------------------------------------------

On 2021-12-19T12:47:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/5010#issuecomment-997386419>

    Sorry I meant this one https://github.com/red/red/commit/62cece44422588bc804d67c89333e6e6b7f96e56, probably copied something else from `git log` output :)

--------------------------------------------------------------------------------

On 2021-12-19T12:56:21Z, qtxie, commented:
<https://github.com/red/red/issues/5010#issuecomment-997387476>

    > However I can crash it with bug7.red (both GUI and CLI consoles):
    > ```
    > *** Runtime Error 98: assertion failed
    > *** in file: /D/devel/red/red-src/red/system/runtime/libc.reds
    > *** at line: 166
    > ***
    > ***   stack: copy-memory 058027D8h 058027E8h 256
    > ***   stack: red/_series/change 04A904E4h 04A904F4h 04A90504h false 04A904D4h
    > ***   stack: red/actions/change 04A904E4h 04A904F4h 04A90504h false 04A904D4h
    > ***   stack: red/actions/change* 2 -1 -1
    > ```
    We should fix it first. Looks like an old bug in `change`.

--------------------------------------------------------------------------------

On 2021-12-19T12:59:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/5010#issuecomment-997387806>

    > We should fix it first. Looks like an old bug in change.
    
    I [tried](https://github.com/red/red/pull/4097) :)

--------------------------------------------------------------------------------

On 2021-12-19T13:42:32Z, dockimbel, commented:
<https://github.com/red/red/issues/5010#issuecomment-997394465>

    I'm wondering if it's not related to [this global state](https://github.com/red/red/blob/master/runtime/interpreter.reds#L921) I haven't removed yet.
    
    After logging the recursion level involving that state, it's not going deeper than 1, so that should not be the cause.

--------------------------------------------------------------------------------

On 2021-12-19T14:08:42Z, dockimbel, commented:
<https://github.com/red/red/issues/5010#issuecomment-997398505>

    Commenting [this line](https://github.com/red/red/blob/master/runtime/interpreter.reds#L922) makes the crash disappear, though I still don't know why.
    
    Alternatively, if I change in `%bug4.red` the event handler body from:
    `func [e c o v r f] [pad mold/part/flat :v 20 20]`
    to
    `func [e c o v r f] [pad mold :v 20 20]`
    the crash is gone too.

--------------------------------------------------------------------------------

On 2021-12-20T04:12:40Z, qtxie, commented:
<https://github.com/red/red/issues/5010#issuecomment-997578851>

    The calculation of the `part` in mold is wrong which causes the crash in bug4.red

--------------------------------------------------------------------------------

On 2021-12-20T12:27:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/5010#issuecomment-997880908>

    Looks like only `bug7` remains alive!

--------------------------------------------------------------------------------

On 2021-12-20T13:39:47Z, dockimbel, commented:
<https://github.com/red/red/issues/5010#issuecomment-997933565>

    @qtxie Correct, I came to the same conclusion and I am finishing a fix for that now. However, the real issue is that `string/truncate-from-tail` is not preventing the series from getting corrupted on out-of-bound "limit" values for `mold/part` and `form/part`.
    
    EDIT: I just saw now that @qtxie pushed a fix already... I'll keep yours and cancel mine then. Though, there is still some more work I need to do on that case, to change the way this `/part` limit is handled.

--------------------------------------------------------------------------------

On 2021-12-20T13:43:29Z, dockimbel, commented:
<https://github.com/red/red/issues/5010#issuecomment-997936194>

    > Looks like only bug7 remains alive!
    
    Yes, but that seems to be related to the `change` bug.

--------------------------------------------------------------------------------

On 2021-12-20T14:04:21Z, dockimbel, commented:
<https://github.com/red/red/issues/5010#issuecomment-997952124>

    @hiiamboris It would be nice if you could integrate the `bug4.red` script in the test suite. For `bug7`, you should add it to the relevant `change bug` ticket.

--------------------------------------------------------------------------------

On 2021-12-20T15:48:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/5010#issuecomment-998044389>

    > @hiiamboris It would be nice if you could integrate the `bug4.red` script in the test suite. 
    
    I'm not sure how to achieve that :(
    Test suite is run with `-c -e` flags. We need `-d` to reproduce it. But when I'm trying `red.r -r -e -d bug4.red`, I'm only getting this:
    ![](https://i.gyazo.com/6be89c248a2bae3d84daca04e70f6276.png)
    

--------------------------------------------------------------------------------

On 2021-12-20T20:21:18Z, dockimbel, commented:
<https://github.com/red/red/issues/5010#issuecomment-998242468>

    > Test suite is run with -c -e flags
    
    `-e` was never meant to work in development mode (with `-c`), so if that works, it's accidental.

--------------------------------------------------------------------------------

On 2021-12-20T20:26:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/5010#issuecomment-998245432>

    Hmm then maybe it just wraps everything in `do []` scope. I mean `run-all-interp.red`.
    
    Doesn't matter. Point is, we need `-d` to trigger the crashes.

--------------------------------------------------------------------------------

On 2021-12-20T22:43:57Z, qtxie, commented:
<https://github.com/red/red/issues/5010#issuecomment-998325252>

    @hiiamboris You can pass --debug when running the test suite.

--------------------------------------------------------------------------------

On 2021-12-21T08:25:44Z, hiiamboris, commented:
<https://github.com/red/red/issues/5010#issuecomment-998569935>

    Sure but how that will affect regression test running at GH actions?

--------------------------------------------------------------------------------

On 2021-12-21T10:55:28Z, hiiamboris, commented:
<https://github.com/red/red/issues/5010#issuecomment-998679422>

    Note that mold system regressed after recent commits:
    ```
    >> mold/flat/part system 100
    == {make object! [version: 0.6.4 build: make object! [date: 21-Dec-2021/10:51:00 git: none config: make }
    >> mold/flat/part system 100
    == "make object! [...]"
    ```

--------------------------------------------------------------------------------

On 2021-12-21T12:58:38Z, qtxie, commented:
<https://github.com/red/red/issues/5010#issuecomment-998758059>

    > Sure but how that will affect regression test running at GH actions?
    
    I'll add it in GH actions if you can add a debug switch in run-regression-tests.r

--------------------------------------------------------------------------------

On 2021-12-21T13:12:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/5010#issuecomment-998767631>

    This should be controlled on test-by-test basis, because debug mode prints GC dumps and a lot of tests do expect that.

--------------------------------------------------------------------------------

On 2021-12-21T13:19:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/5010#issuecomment-998773024>

    I think this test is not worth the time spent adding it, in the current state of the testing system.
    
    Anyway, `bug4` obviously highlights a bug in compiler, because during `red.r -r -e -d bug4.red` R2's memory grows to 1900MB after which compilation terminates with an error. Normal compilation process (e.g. of `bug1.red`) usually stays under 40MB. @dockimbel 

--------------------------------------------------------------------------------

On 2021-12-21T13:23:45Z, qtxie, commented:
<https://github.com/red/red/issues/5010#issuecomment-998776378>

    > This should be controlled on test-by-test basis, because debug mode prints GC dumps and a lot of tests do expect that.
    
    Why does the GC dumps affect the tests? But still we should direct the GC dumps to stderr instead of to stdout.

--------------------------------------------------------------------------------

On 2021-12-21T14:11:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/5010#issuecomment-998810702>

    > Why does the GC dumps affect the tests?
    
    Because many regression tests check the output of compiled script, sometimes literally.
    I agree that stderr should be the way to go here.

--------------------------------------------------------------------------------

On 2021-12-22T17:09:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/5010#issuecomment-999734501>

    LOL. R2 out of memory error was due to `#do [recycle-off]`, because during compilation it's R2 who preprocessed it.

