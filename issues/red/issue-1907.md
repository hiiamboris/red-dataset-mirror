
#1907: Redefining `set` crashes the console
================================================================================
Issue is closed, was reported by ghost and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1907>

```
red>> set: 1

*** Runtime Error 1: access violation
*** at: 00000000h
```



Comments:
--------------------------------------------------------------------------------

On 2016-05-16T08:01:28Z, meijeru, commented:
<https://github.com/red/red/issues/1907#issuecomment-219370501>

    Isn't there a general danger that redefining built-in words will lead to unpredictable results? See e.g. #360.

--------------------------------------------------------------------------------

On 2016-05-22T08:29:13Z, dockimbel, commented:
<https://github.com/red/red/issues/1907#issuecomment-220820532>

    @meijeru Difficult to say. The console does rely on some interpreted code, so changing core actions/natives will have unpredictable effects. I'm not even sure in that context if it's possible or not to circumvent all potential crashes, this needs a deeper study.

--------------------------------------------------------------------------------

On 2016-05-22T09:10:18Z, dockimbel, commented:
<https://github.com/red/red/issues/1907#issuecomment-220822003>

    Modules with isolated namespaces should provide a more robust solution to this class of issues.

