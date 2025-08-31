
#3649: reset-matrix on MacOS flips the image
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3649>

**Describe the bug**
`reset-matrix` flips the image upside down.

Should be:
`? (draw 40x40 [fill-pen red box 0x0 40x10 translate 10x10 fill-pen brown box 0x0 40x10])`
![](https://i.gyazo.com/dfc08ae44f9de98db8d50f6a7d8a1c10.png)

Now with the matrix resetted everything is drawn from the lower left corner:
`? (draw 40x40 [reset-matrix fill-pen red box 0x0 40x10 translate 10x10 fill-pen brown box 0x0 40x10])`
![](https://i.gyazo.com/ea7e9c5b723563bff2c8befd156e2242.png)

**Platform version(please complete the following information):**
```
Red 0.6.4 for macOS built 11-Dec-2018/18:29:30+03:00 commit #21ef0b8
```


Comments:
--------------------------------------------------------------------------------

On 2018-12-19T05:13:31Z, dockimbel, commented:
<https://github.com/red/red/issues/3649#issuecomment-448471912>

    @hiiamboris Please confirm if this fix is working for you.

--------------------------------------------------------------------------------

On 2018-12-19T11:48:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/3649#issuecomment-448567213>

    @dockimbel Yes it works!
    Before closing this ticket please remove lines 42-44, 46-47, 49-51, 54-55 of https://github.com/red/red/blob/821c3af3db74d7c0099cb0b01e1273396d0cf86d/tests/source/units/draw-test.red

--------------------------------------------------------------------------------

On 2020-05-20T07:51:50Z, qtxie, commented:
<https://github.com/red/red/issues/3649#issuecomment-631303270>

    Was it fixed? I don't see any issue on my macOS VM.

--------------------------------------------------------------------------------

On 2020-05-20T08:44:40Z, hiiamboris, commented:
<https://github.com/red/red/issues/3649#issuecomment-631332936>

    @qtxie https://github.com/red/red/pull/4054

--------------------------------------------------------------------------------

On 2020-10-23T17:01:59Z, dockimbel, commented:
<https://github.com/red/red/issues/3649#issuecomment-715462000>

    @qtxie @hiiamboris It is unclear from this ticket history if it is fixed or not... could you please confirm what is the status of this ticket?
    
    I'm assuming that it is fixed by default. Feel free to reopen if it's not the case.

--------------------------------------------------------------------------------

On 2020-10-23T20:33:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/3649#issuecomment-715576329>

    @dockimbel fixed for Windows, MacOS VM, but not Travis' flavor of MacOS.

