
#3099: Compiler does not support %"%"
================================================================================
Issue is closed, was reported by rebolek and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3099>

### Expected behavior

In the interpreter, it's possible to use filename `%"%"`

### Actual behavior

This is not possible when the same script is compiled, error is returned:

```
*** Syntax Error: Invalid string! value
*** in file: /Users/sony/Code/red/test.red
*** line: 2
*** at: {"%"}
```

### Steps to reproduce the problem

Compile following script:
```
Red[]
%"%"
```

### Red version and build date, operating system with version.

Latest Red on macOS.


Comments:
--------------------------------------------------------------------------------

On 2017-11-07T17:26:27Z, meijeru, commented:
<https://github.com/red/red/issues/3099#issuecomment-342558224>

    The complete equivalence of interpreter-lexer and compiler-lexer has obviously not yet been achieved. There are more issues of this nature still pending.
    On the substance: I think that this particular filename should be forbidden.

--------------------------------------------------------------------------------

On 2017-11-07T20:35:38Z, rebolek, commented:
<https://github.com/red/red/issues/3099#issuecomment-342613851>

    @meijeru why do you think so? If file system supports it, why it should be illegal?

--------------------------------------------------------------------------------

On 2017-11-08T08:13:05Z, meijeru, commented:
<https://github.com/red/red/issues/3099#issuecomment-342742099>

    In Red, `%` normally starts a two-hex digit code for a character. So it would be just to avoid confusion. Anyhow, in the interpreter, `%%` instead of `%"%"`  also gives an error. This reinforces my plea for more consistent lexing.

--------------------------------------------------------------------------------

On 2017-11-09T08:26:06Z, dockimbel, commented:
<https://github.com/red/red/issues/3099#issuecomment-343081395>

    The %"..." syntax is an escape mechanism allowing filesystem-specific characters to be provided unescaped. So `%"%"` should be accepted, as it is accepted by most filesystems.

