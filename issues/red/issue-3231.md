
#3231: exception with uncommented probe
================================================================================
Issue is closed, was reported by snotbubble and has 18 comment(s).
<https://github.com/red/red/issues/3231>

exception after compiling with uncommented probe
```
*** Runtime Error : access violation
*** at: h
```

1. download and compile this file with just -c :
 https://github.com/snotbubble/fulltardie/blob/master/badprobe.red

2. run it via cmd

Red 063 windows10 x64



Comments:
--------------------------------------------------------------------------------

On 2018-02-20T10:23:47Z, 9214, commented:
<https://github.com/red/red/issues/3231#issuecomment-366932882>

    https://github.com/snotbubble/fulltardie/blob/master/badprobe.red#L516
    If you could come up with much shorter example to reproduce the problem, that would be highly appreciated.

--------------------------------------------------------------------------------

On 2018-02-20T11:42:22Z, snotbubble, commented:
<https://github.com/red/red/issues/3231#issuecomment-366951981>

    yep try this, same exception :
    https://github.com/snotbubble/fulltardie/blob/master/busteddata.red

--------------------------------------------------------------------------------

On 2018-02-20T17:05:53Z, greggirwin, commented:
<https://github.com/red/red/issues/3231#issuecomment-367046552>

    Second example compiles and runs fine here on Win 7. Will try the first one.

--------------------------------------------------------------------------------

On 2018-02-20T17:08:14Z, greggirwin, commented:
<https://github.com/red/red/issues/3231#issuecomment-367047330>

    First example works fine too.

--------------------------------------------------------------------------------

On 2018-02-20T17:09:24Z, greggirwin, commented:
<https://github.com/red/red/issues/3231#issuecomment-367047661>

    `probe btab/1` is the only uncommented probe in the big example.

--------------------------------------------------------------------------------

On 2018-02-20T17:13:22Z, greggirwin, commented:
<https://github.com/red/red/issues/3231#issuecomment-367048952>

    I'm using a local build, so it's possible this is in the 063 download, if you're using that. There are a couple known regressions in there right now.

--------------------------------------------------------------------------------

On 2018-02-21T04:05:19Z, qtxie, commented:
<https://github.com/red/red/issues/3231#issuecomment-367207048>

    No crashes in the [latest version](http://static.red-lang.org/dl/auto/win/red-latest.exe).

--------------------------------------------------------------------------------

On 2018-03-13T10:14:29Z, dockimbel, commented:
<https://github.com/red/red/issues/3231#issuecomment-372614438>

    @snotbubble Can you confirm that there is no crash anymore, so we can close this ticket?

--------------------------------------------------------------------------------

On 2018-03-13T10:24:45Z, snotbubble, commented:
<https://github.com/red/red/issues/3231#issuecomment-372617363>

    yep no crash.

