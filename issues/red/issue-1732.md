
#1732: Compiled TRY can corrupt the stack on caught errors
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1732>

```
run: function [/no-banner][
        unless no-banner [
            print [
                "--== Red" system/version "==--" lf
                "Type HELP for starting information." lf
            ]
        ]
        forever [
            eval-command ask any [
                cue
                all [string? set/any 'p try/all [do [prompt]] :p]
                form :p
            ]
        ]
    ]
```

The stack is not properly restored on TRY epilog, corrupting the `'p` slot.



