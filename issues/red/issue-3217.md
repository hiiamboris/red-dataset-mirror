
#3217: Crash on some invalid parse rules
================================================================================
Issue is closed, was reported by endo64 and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3217>

### Expected behavior

No crash, meaningful error message.

### Actual behavior

Console crashes:

*** Runtime Error 1: access violation
*** at: 00427815h

### Steps to reproduce the problem

Try one of these:

```
parse "abc" [to fail]
parse "abc" [some fail]
parse "abc" [thru fail]
parse "abc" [any fail]
```

### Red version and build date, operating system with version.

0.6.3 date: 29-Jan-2018/11:00:51+03:00
Win10 x64


Comments:
--------------------------------------------------------------------------------

On 2018-02-02T15:16:29Z, dockimbel, commented:
<https://github.com/red/red/issues/3217#issuecomment-362614137>

    Good catch!

