
#2267: system/view/screens/1/size reports wrong size
================================================================================
Issue is closed, was reported by meijeru and has 14 comment(s).
<https://github.com/red/red/issues/2267>

My screen size as reported by Windows 10 is 1920*1080, but Red says

```
red>> system/view/screens/1/size
== 1536x864
```

It is perhaps significant that Red's values are 20 % off.



Comments:
--------------------------------------------------------------------------------

On 2016-10-10T20:05:26Z, iArnold, commented:
<https://github.com/red/red/issues/2267#issuecomment-252731907>

    For what it is worth. My Macbook has 1280x800 and Red says it is:
    red>> system/view/screens/1/size
    == 1280x778
    (Maybe compensates for the menu bar?)

--------------------------------------------------------------------------------

On 2016-10-11T08:38:05Z, DideC, commented:
<https://github.com/red/red/issues/2267#issuecomment-252848080>

    @meijeru If you set the font zoom to 100% (usually at 120% or 150% in this kind of resolution), does it change the screen size value in Red ?

--------------------------------------------------------------------------------

On 2016-10-11T18:49:20Z, geekyi, commented:
<https://github.com/red/red/issues/2267#issuecomment-253008867>

    Also on  Windows 10 (laptop connected to external monitor):
    
    ```
    red>> system/view/screens/1/size
    == 1920x1080
    ```

--------------------------------------------------------------------------------

On 2016-10-11T18:59:59Z, iArnold, commented:
<https://github.com/red/red/issues/2267#issuecomment-253012008>

    Win7 reports 1920x1080, so okay, but where is my second screen?

--------------------------------------------------------------------------------

On 2016-10-12T19:36:00Z, geekyi, commented:
<https://github.com/red/red/issues/2267#issuecomment-253315413>

    Okay, after doing what @DideC suggested (Right-click desktop -> display settings, "change size of text , apps ..") to 125% (Recommended) I get after reopening the gui console:
    
    ```
    red>> system/view/screens/1/size
    == 1536x864
    ```
    
    This seems to exactly match what @meijeru is seeing, so we can probably close this?

--------------------------------------------------------------------------------

On 2016-10-13T07:46:56Z, meijeru, commented:
<https://github.com/red/red/issues/2267#issuecomment-253439627>

    Thanks everyone. For me the case is indeed closed.

--------------------------------------------------------------------------------

On 2016-10-13T17:20:31Z, greggirwin, commented:
<https://github.com/red/red/issues/2267#issuecomment-253579127>

    As with Arnold, no info on extra monitors here.

