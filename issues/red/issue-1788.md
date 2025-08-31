
#1788: Console(GUI & CLI both) allows to type in-between some unicode characters
================================================================================
Issue is closed, was reported by ghost and has 10 comment(s).
[status.built] [status.tested] [status.reviewed] [GUI]
<https://github.com/red/red/issues/1788>

**Both CLI and GUI consoles** display this behaviour.
Note: Happens only for some characters (not all)
![a](https://cloud.githubusercontent.com/assets/16458742/14251424/949d8c46-faa0-11e5-9cd3-0c5fb3193f18.gif)



Comments:
--------------------------------------------------------------------------------

On 2016-04-05T03:48:57Z, dockimbel, commented:
<https://github.com/red/red/issues/1788#issuecomment-205629364>

    Good catch!

--------------------------------------------------------------------------------

On 2016-05-12T12:52:39Z, qtxie, commented:
<https://github.com/red/red/issues/1788#issuecomment-218747724>

    @nc-x Please give a try the latest version.

--------------------------------------------------------------------------------

On 2016-05-12T15:01:53Z, ghost, commented:
<https://github.com/red/red/issues/1788#issuecomment-218785115>

    Okay, I will check and report back.

--------------------------------------------------------------------------------

On 2016-05-12T16:14:59Z, ghost, commented:
<https://github.com/red/red/issues/1788#issuecomment-218807739>

    @qtxie 
    On **GUI-Console**, this issue is fixed.
    
    But I don't know why in **CLI console** , this is happening (I have `Active code page: 65001` ) -
    ![untitled](https://cloud.githubusercontent.com/assets/16458742/15221786/7d948592-188a-11e6-95e8-41de20340b9c.png)
    When I paste `👀` in console, it comes as a question mark but the error message displays it correctly.

--------------------------------------------------------------------------------

On 2016-05-13T00:26:05Z, qtxie, commented:
<https://github.com/red/red/issues/1788#issuecomment-218922573>

    Should be fixed now. ;-)

