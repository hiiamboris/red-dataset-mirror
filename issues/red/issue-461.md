
#461: Passing op as a lit-word param crashes the console
================================================================================
Issue is closed, was reported by greggirwin and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/461>

`
fn: func ['word] [print mold :word]
fn :+   ; works
fn '+   ; works
fn +   ; crashes
`



Comments:
--------------------------------------------------------------------------------

On 2013-04-07T11:43:19Z, PeterWAWood, commented:
<https://github.com/red/red/issues/461#issuecomment-16013679>

    I've included Gregg's tests in function-test.red. The compiler gives an error for the first two cases and a runtime error for the third. The tests appear to pass with the interpreter.

