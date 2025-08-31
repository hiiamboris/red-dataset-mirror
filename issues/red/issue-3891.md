
#3891: [Compiler] Crash on error output
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
<https://github.com/red/red/issues/3891>

**Describe the bug**

There's a curious crash that surfaced after PR #3889 . I'm unsure what to make of it.
Compile `Red [] probe load "a<=>"` with `-r -d` or `-r -e -d` and run:
```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/datatypes/object.reds
*** at line: 98
***
***   stack: red/object/rs-select 0293D324h 0374E160h
***   stack: red/error/reduce 0293D344h 0293D324h
***   stack: red/error/form 0293D324h 0293D334h 0293D314h -18
***   stack: red/actions/form 0293D324h 0293D334h 0293D314h 0
***   stack: red/actions/form* -1
***   stack: red/natives/do-print false true
***   stack: red/natives/print* false
***   stack: red/stack/throw-error 0293DCF4h
***   stack: red/natives/do* true -1 -1 -1
***   stack: ctx265~transcode 002EE3B8h
***   stack: load
***   stack: red/_function/call 0293D344h 002F3884h
***   stack: red/interpreter/eval-code 0293D344h 02AEBAD8h 02AEBAD8h true 00000000h 00000000h 02A41814h
***   stack: red/interpreter/eval-expression 02AEBAC8h 02AEBAD8h false true false
***   stack: red/interpreter/eval-arguments 02A42E14h 02AEBAB8h 02AEBAD8h 00000000h 00000000h
***   stack: red/interpreter/eval-code 02A42E14h 02AEBAB8h 02AEBAD8h false 00000000h 00000000h 02A42E14h
***   stack: red/interpreter/eval-expression 02AEBAB8h 02AEBAD8h false false false
***   stack: red/interpreter/eval 0293D324h true
***   stack: red/natives/do* true -1 -1 -1
```
To my knowledge the crash is caused by TYPE_OF() macro accessing the red-word/header here: https://github.com/red/red/blob/467fcc8b433813220aab66b67c99deb6d1471755/runtime/datatypes/object.reds#L90
Word (4th item) is taken from the error description block (as in system/catalog/errors) so why it segfaults is beyond me for now.

**Expected behavior**

Should output the error.

**Platform version (please complete the following information)**

commit #467fcc8b



Comments:
--------------------------------------------------------------------------------

On 2019-05-22T22:26:35Z, 9214, commented:
<https://github.com/red/red/issues/3891#issuecomment-494997212>

    Looks like regression in disguise, see [here](https://github.com/red/red/issues/3876#issuecomment-492117879) for example.

--------------------------------------------------------------------------------

On 2019-05-22T22:36:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/3891#issuecomment-494999666>

    @9214 Yeah, same stack trace. Thanks for pointing that one out.

--------------------------------------------------------------------------------

On 2019-05-23T09:54:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/3891#issuecomment-495151043>

    Turns out there's more (I should make a habit of memorizing stack traces) - https://github.com/red/red/issues/3714 https://github.com/red/red/issues/2538
    All related to the epic https://github.com/red/red/pull/3781 .... I just got to dig the root of it.....

--------------------------------------------------------------------------------

On 2019-05-23T22:33:55Z, dockimbel, commented:
<https://github.com/red/red/issues/3891#issuecomment-495408795>

    I also noticed that strange stack trace pattern recently. Could anyone pinpoint which commit started triggering this behavior?

--------------------------------------------------------------------------------

On 2019-05-23T23:08:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/3891#issuecomment-495415834>

    There's PR for it just the line above ;)

