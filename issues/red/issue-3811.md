
#3811: Red Console crashes after using it for a while
================================================================================
Issue is closed, was reported by alex65536 and has 12 comment(s).
[status.resolved]
<https://github.com/red/red/issues/3811>

**Describe the bug**
After using the console for some time and entering some commands, the interpreter crashes with:
```
Runtime Error 1: access violation
                                          *** at: 0806A5CBh
```
and the shell then becomes unusable (e. g. doesn't echo the characters typed).

The crash always happens during auto-completion (after pressing &lt;Tab&gt;). Didn't notice the correlation between the crash and the word being autocompleted.

**Platform version (please complete the following information)**
Red 0.6.4 for Linux built 22-Nov-2018/3:40:38+03:00 commit #755eb94

I am using Debian GNU/Linux 10 and Konsole as a terminal emulator.



Comments:
--------------------------------------------------------------------------------

On 2019-03-10T15:08:04Z, 9214, commented:
<https://github.com/red/red/issues/3811#issuecomment-471314383>

    @alex65536 can you reproduce this crash with the [nightly build](https://static.red-lang.org/dl/auto/linux/red-latest)?

--------------------------------------------------------------------------------

On 2019-03-10T15:27:15Z, alex65536, commented:
<https://github.com/red/red/issues/3811#issuecomment-471316004>

    @9214, I'll try

--------------------------------------------------------------------------------

On 2019-03-15T06:00:47Z, endo64, commented:
<https://github.com/red/red/issues/3811#issuecomment-473168959>

    @alex65336 did you test with nightly build? How long do you keep the console open? Could it be related to Konsole?

--------------------------------------------------------------------------------

On 2019-03-15T20:37:09Z, alex65536, commented:
<https://github.com/red/red/issues/3811#issuecomment-473432923>

    > How long do you keep the console open?
    
    I was playing with Red for maybe half an hour, entering some commands.
    
    For now, I cannot reproduce it by some reason (on Red 0.6.4, the same where the bug happens), but I'll try more.

--------------------------------------------------------------------------------

On 2019-03-15T22:04:39Z, endo64, commented:
<https://github.com/red/red/issues/3811#issuecomment-473455618>

    @alex65536 Lets keep this issue open for a while, if no one else faces this issue or you can find some causes then it probably something with your system, hence we close the issue. Thanks for digging!

--------------------------------------------------------------------------------

On 2019-05-15T14:34:49Z, dockimbel, commented:
<https://github.com/red/red/issues/3811#issuecomment-492681429>

    I guess it's time to close it now. Feel free to ask for re-opening if you notice such crash again.

