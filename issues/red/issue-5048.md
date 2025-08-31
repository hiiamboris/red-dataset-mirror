
#5048: Console -> Help -> About: VID error
================================================================================
Issue is closed, was reported by kpeters58 and has 10 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/5048>

>> about/cc
Red 0.6.4 for Windows built 21-Jan-2022/9:33:03-08:00  commit #89896f9
>> 
*** Script Error: VID - invalid syntax at: [fstk-logo at 0x160]
*** Where: do
*** Near : args
*** Stack: ask ask do-events do-actor do-safe layout cause-error 


Comments:
--------------------------------------------------------------------------------

On 2022-01-21T23:07:12Z, greggirwin, commented:
<https://github.com/red/red/issues/5048#issuecomment-1018929060>

    Looks like a regression. Works in my 11-Jan build here.

--------------------------------------------------------------------------------

On 2022-01-21T23:09:18Z, greggirwin, commented:
<https://github.com/red/red/issues/5048#issuecomment-1018930216>

    Just synced and did a fresh build here, and still works.

--------------------------------------------------------------------------------

On 2022-01-21T23:18:45Z, hiiamboris, commented:
<https://github.com/red/red/issues/5048#issuecomment-1018936606>

    Can't reproduce either.

--------------------------------------------------------------------------------

On 2022-01-22T01:50:43Z, dockimbel, commented:
<https://github.com/red/red/issues/5048#issuecomment-1019012336>

    Cannot reproduce using the lastest commit on master.

--------------------------------------------------------------------------------

On 2022-01-22T14:41:05Z, dockimbel, commented:
<https://github.com/red/red/issues/5048#issuecomment-1019283298>

    I'll close this ticket. Feel free to reopen or ask for reopening if it can be reproduced.

