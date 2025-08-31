
#2402: [vid] Image bug on Wine
================================================================================
Issue is closed, was reported by maximvl and has 8 comment(s).
[type.bug] [status.reviewed] [GUI]
<https://github.com/red/red/issues/2402>

This code produces result on screenshot:
```
Red []
view layout [ image ]
```
![screenshot_2017-01-05_20-54-18](https://cloud.githubusercontent.com/assets/949890/21691343/3ee32712-d389-11e6-942b-f84a2be658fe.png)

The same image drawn twice, second time in top left corner.


Comments:
--------------------------------------------------------------------------------

On 2017-01-05T19:34:20Z, meijeru, commented:
<https://github.com/red/red/issues/2402#issuecomment-270735845>

    BTW, this can be simplified to `view [ image ]`

--------------------------------------------------------------------------------

On 2017-03-04T03:05:20Z, qtxie, commented:
<https://github.com/red/red/issues/2402#issuecomment-284122450>

    I test it on wine1.8, works fine.

--------------------------------------------------------------------------------

On 2020-07-17T11:28:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/2402#issuecomment-660055815>

    Is is this relevant still? Anyone reproduced it?

--------------------------------------------------------------------------------

On 2022-09-30T08:06:35Z, qtxie, commented:
<https://github.com/red/red/issues/2402#issuecomment-1263249952>

    Close it as we don't officially support Wine backend and GTK backend is included in Red now.

