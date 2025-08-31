
#3088: Integers containing group seps lex as floats
================================================================================
Issue is closed, was reported by greggirwin and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3088>

Looks like a recent change altered lexing of numbers with group seps. Including a group sep now loads as a float, rather than an int. Build from 15-Oct didn't do this.

Just happened to run a script here that failed, because I used a group sep and repeat choked on the resulting float.

### Expected behavior
```
>> n: 100000
== 100000
>> n: 100'000
== 100000
```

### Actual behavior
```
>> n: 100000
== 100000
>> n: 100'000
== 100000.0
```

### Steps to reproduce the problem
See above. Enter an integer value containing at least one group separator.

### Red version and build date, operating system with version.
>> print [system/version system/build/date]
0.6.3 24-Oct-2017/9:52:34-06:00

Windows 7


Comments:
--------------------------------------------------------------------------------

On 2017-10-27T04:59:56Z, dockimbel, commented:
<https://github.com/red/red/issues/3088#issuecomment-339872959>

    Unfortunate regression, caused by the new low-level tokenizer code.

