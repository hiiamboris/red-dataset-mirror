
#267: hello.red crashes terminal on ARM
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 12 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/267>

Compiled for Linux-ARM and run on BodhiLinux on Raspberry Pi, hello.red crashes and even takes the terminal program with it. Sometimes it's shortly visible that it says runtime error 0, address misalignment at 0.



Comments:
--------------------------------------------------------------------------------

On 2012-10-08T20:44:31Z, dockimbel, commented:
<https://github.com/red/red/issues/267#issuecomment-9239582>

    I'm adding this useful ARM [ABI comparison page](http://wiki.debian.org/ArmHardFloatPort/VfpComparison), as it's most probably related to that.
    
    I need to install the same distro on QEMU to be able to debug it, this might take a few days.

--------------------------------------------------------------------------------

On 2012-10-14T10:11:04Z, dockimbel, commented:
<https://github.com/red/red/issues/267#issuecomment-9418029>

    Can you try again with the latest revision? I can run hello.red without any issues on Raspbian which is also ARMHF.

--------------------------------------------------------------------------------

On 2012-10-14T21:09:33Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/267#issuecomment-9427783>

    It almost works now on BodhiLinux, which is not surprising because it is built on Raspbian. However, the third Greek character and the four Chinese characters come out as unknown box characters.
    
    Bodhi has a different, new terminal program, so I'm not sure who to blame.

--------------------------------------------------------------------------------

On 2012-10-14T21:45:15Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/267#issuecomment-9428190>

    I installed LXTerminal and there it works, so there's something wrong with Terminology.

--------------------------------------------------------------------------------

On 2012-10-14T22:00:18Z, dockimbel, commented:
<https://github.com/red/red/issues/267#issuecomment-9428344>

    So, should we consider this issue fixed and close the ticket?

--------------------------------------------------------------------------------

On 2012-10-15T00:16:44Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/267#issuecomment-9429726>

    Most probably.

