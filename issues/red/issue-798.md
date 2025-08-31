
#798: Red 0.4.2 does not pre-compile console on W8.1
================================================================================
Issue is closed, was reported by meijeru and has 12 comment(s).
<https://github.com/red/red/issues/798>

I donwloaded the 30 April build, and ran it under Windows 8.1 from the folder "Program Files (x86)". The error message received was:

Pre-compiling Red console...
**\* Driver Internal Error: Access Error : Cannot open /C/ProgramData/Red/console.exe
**\* Where: build
**\* Near:  [write/binary/direct file job/buffer
if fun:
] 



Comments:
--------------------------------------------------------------------------------

On 2014-04-30T11:59:01Z, meijeru, commented:
<https://github.com/red/red/issues/798#issuecomment-41788131>

    I should have run red.exe in the folder where the sources are! There it works.

--------------------------------------------------------------------------------

On 2014-04-30T12:52:36Z, dockimbel, commented:
<https://github.com/red/red/issues/798#issuecomment-41792476>

    Hmm, `red.exe` should work from anywhere, this looks like a valid bug report.

--------------------------------------------------------------------------------

On 2014-04-30T14:51:38Z, dockimbel, commented:
<https://github.com/red/red/issues/798#issuecomment-41805774>

    We tried to reproduce the issue on Windows 8.1, but couldn't get the error. Could you give us a step by step description to try to reproduce it?

--------------------------------------------------------------------------------

On 2014-04-30T14:51:45Z, kealist, commented:
<https://github.com/red/red/issues/798#issuecomment-41805794>

    It might not be the case here, but the only time I have seen a similar error to that is when it's trying to write the console.exe file to that folder when console.exe is already open (i.e. can't overwrite an already running program).  I've only seen it happen when updating to a new version, and when I tried to duplicate it later, I had inconsistent results

--------------------------------------------------------------------------------

On 2014-05-01T08:32:32Z, meijeru, commented:
<https://github.com/red/red/issues/798#issuecomment-41890714>

    As I said, I downloaded %red.exe into "C:\Program Files (x86)" and executed it there. That is all there is to it. The file %console.exe was where it should be.

--------------------------------------------------------------------------------

On 2014-05-01T10:55:54Z, dockimbel, commented:
<https://github.com/red/red/issues/798#issuecomment-41899673>

    We can't reproduce the error, so we'll leave this ticket closed for now.

