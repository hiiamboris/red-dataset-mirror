
#2076: GUI console won't quit through File menu
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
<https://github.com/red/red/issues/2076>

See the attached screenshot. The `console-cfg.red` file is present, but the console says it cannot access it. The `quit` command at the command prompt works normally. The error may be related to the directory that the console is started in...
![quit-problem](https://cloud.githubusercontent.com/assets/743227/16411451/5e21f142-3d27-11e6-84ba-7ae934103959.JPG)



Comments:
--------------------------------------------------------------------------------

On 2016-06-28T10:09:49Z, qtxie, commented:
<https://github.com/red/red/issues/2076#issuecomment-229008016>

    @meijeru Looks like the `console-cfg.red` is locked by other programs. Did you open it with an editor when close the gui-console?

--------------------------------------------------------------------------------

On 2016-06-28T10:34:38Z, meijeru, commented:
<https://github.com/red/red/issues/2076#issuecomment-229013015>

    No, this occurs after a fresh restart of Windows 10.

--------------------------------------------------------------------------------

On 2016-06-28T11:18:03Z, dockimbel, commented:
<https://github.com/red/red/issues/2076#issuecomment-229021047>

    @meijeru Can you manually write into that file from the console?

--------------------------------------------------------------------------------

On 2016-06-28T16:37:40Z, meijeru, commented:
<https://github.com/red/red/issues/2076#issuecomment-229106728>

    No I can't and I get exactly the same error. Please also notice the cursor position in the middle of the word `Where`!

--------------------------------------------------------------------------------

On 2016-06-28T17:57:25Z, meijeru, commented:
<https://github.com/red/red/issues/2076#issuecomment-229129983>

    NOTE: meanwhile I have deleted `%console-cfg.red` and had it re-created by the console. I cannot anymore reproduce the issue now. Probably was a glitch.

