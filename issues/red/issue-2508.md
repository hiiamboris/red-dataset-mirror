
#2508: Crash on Windows XP with some view scripts
================================================================================
Issue is closed, was reported by StephaneVeneri and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2508>

Crash on Windows XP with red-062.exe or red-27mar17-140a684.exe:
```
C:\Red>red-27mar17-140a684.exe --cli
Compiling compression library...
Compiling Red console...
--== Red 0.6.2 ==--
Type HELP for starting information.

>> do %spiral.red

*** Runtime Error 1: access violation
*** at: 7C920717h
```

Exactly the same error with tiger.red.



Comments:
--------------------------------------------------------------------------------

On 2017-04-04T22:07:08Z, StephaneVeneri, commented:
<https://github.com/red/red/issues/2508#issuecomment-291646330>

    I don't know if it can help but you can reproduce the problem with the two small scripts from [Reactive Programming](http://www.red-lang.org/2016/06/061-reactive-programming.html) page.
    It's more "difficult" to crash the non-reactive version : you must clic quickly on a slider.

--------------------------------------------------------------------------------

On 2017-04-05T01:58:12Z, qtxie, commented:
<https://github.com/red/red/issues/2508#issuecomment-291712674>

    Thanks for your analysis.

