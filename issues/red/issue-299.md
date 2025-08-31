
#299: Assignment type compatibiity test does not take synonyms into account
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.resolved] [Red/System]
<https://github.com/red/red/issues/299>

```
f: func [arg [integer!] /local i [int32!]][i: arg]

-= Red/System Compiler =-
Compiling tests/mytest.reds ...
*** Compilation Error: attempt to change type of variable: i
*** from: [int32!]
***   to: [integer!]
*** in file: %tests/mytest.reds
*** in function: f
*** at line: 2
*** near: [i: arg]
```

The curious thing is, that `integer!` and any enumeration type name are found to be compatible.



Comments:
--------------------------------------------------------------------------------

On 2012-11-08T12:07:15Z, dockimbel, commented:
<https://github.com/red/red/issues/299#issuecomment-10185571>

    `int32!` and `uint8!` are not part of the official Red/System specification anymore, see #283.

--------------------------------------------------------------------------------

On 2012-11-08T12:57:24Z, meijeru, commented:
<https://github.com/red/red/issues/299#issuecomment-10186973>

    OK, I stand corrected, but it is still allowed to write `int32!` in places where a type is allowed. Shouldn't that be disallowed also?

--------------------------------------------------------------------------------

On 2012-11-08T15:49:49Z, dockimbel, commented:
<https://github.com/red/red/issues/299#issuecomment-10192698>

    `int32!` and `uint8!` removed, `int16!` is still allowed in function spec as I need it for (unreleased) AVR8 backend.

