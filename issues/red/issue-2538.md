
#2538: Compile using system/console/limit crashes GUI console on startup.
================================================================================
Issue is closed, was reported by greggirwin and has 8 comment(s).
<https://github.com/red/red/issues/2538>

`VAL_FORM_LIMIT: system/console/limit` compiles fine, but the GUI console crashes on startup. CLI console is fine.

`VAL_FORM_LIMIT: does [system/console/limit]` does not cause the problem, which makes sense.


Comments:
--------------------------------------------------------------------------------

On 2017-07-28T16:47:13Z, dockimbel, commented:
<https://github.com/red/red/issues/2538#issuecomment-318704584>

    Where exactly do you put `VAL_FORM_LIMIT: system/console/limit`? Does it still crash?
    
    BTW, `system/console/limit` is now `system/console/size`.

--------------------------------------------------------------------------------

On 2017-07-29T00:06:40Z, greggirwin, commented:
<https://github.com/red/red/issues/2538#issuecomment-318788104>

    The name change came after this ticket. Help code is up to date with that. 
    
    Change https://github.com/red/red/blob/master/environment/console/help.red#L95 by removing the `does` part, so it's just:
    ```
    VAL_FORM_LIMIT: max 0 system/console/size/x - HELP_TYPE_COL_SIZE - HELP_COL_1_SIZE - RT_MARGIN
    ```

--------------------------------------------------------------------------------

On 2017-07-29T00:07:39Z, greggirwin, commented:
<https://github.com/red/red/issues/2538#issuecomment-318788194>

    Just tested, and it still crashes.

--------------------------------------------------------------------------------

On 2019-05-23T09:49:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/2538#issuecomment-495149006>

    Looks like https://github.com/red/red/issues/3714 is the same issue

