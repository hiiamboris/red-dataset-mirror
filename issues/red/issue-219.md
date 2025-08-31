
#219: FPU emulation doesn't work on ARMv5TE processor.
================================================================================
Issue is closed, was reported by rebolek and has 12 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/219>

Running fibbonaci or mandelbrot tests on ARMv5E processor throws **Illegal instruction** error.



Comments:
--------------------------------------------------------------------------------

On 2012-07-15T14:59:44Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/219#issuecomment-6992209>

    Is that an ARM with the Thumb instruction set? Do non-float programs run?

--------------------------------------------------------------------------------

On 2012-07-15T17:10:14Z, rebolek, commented:
<https://github.com/red/red/issues/219#issuecomment-6993183>

    Yes, non-float have no problems, the problem happens only with float numbers. I'm not expert on ARM cores, but according to Wikipedia it should have Thumb instruction set.

--------------------------------------------------------------------------------

On 2012-07-15T21:16:19Z, dockimbel, commented:
<https://github.com/red/red/issues/219#issuecomment-6995096>

    What OS are you using on top of that CPU? I guess it's a Linux, so could we see the output of:
    - `uname -a`
    - `gcc -dumpmachine`
    - `cat /proc/cpuinfo`

--------------------------------------------------------------------------------

On 2012-07-16T07:29:46Z, rebolek, commented:
<https://github.com/red/red/issues/219#issuecomment-6999950>

    **uname -a**
    
    ```
    USBStation2> uname -a
    Linux USBStation2 2.6.32.12 #1968 Fri Apr 6 18:44:34 CST 2012 armv5tel GNU/Linux synology_88f6180_us2
    ```
    
    **gcc -dumpmachine**
    
    ```
    This machine doesn't have gcc installed. I will try to install it and update this information.
    ```
    
    **cat /proc/cpuinfo**
    
    ```
    USBStation2> cat /proc/cpuinfo
    Processor       : Feroceon 88FR131 rev 1 (v5l)
    BogoMIPS        : 794.62
    Features        : swp half thumb fastmult edsp
    CPU implementer : 0x56
    CPU architecture: 5TE
    CPU variant     : 0x2
    CPU part        : 0x131
    CPU revision    : 1
    
    Hardware        : Feroceon-KW
    Revision        : 0000
    Serial          : 0000000000000000
    ```

--------------------------------------------------------------------------------

On 2012-07-16T08:42:31Z, earl, commented:
<https://github.com/red/red/issues/219#issuecomment-7001030>

    We currently require/use ARM's VFP extension for implementing floating point support on ARM.
    
    Unfortunately, your CPU (Marvell "Kirkwood") does not have VFP support (would be listed as `vfp` under "Features" in cpuinfo), so Red/Sytem's floating point implementation won't work with that CPU.

--------------------------------------------------------------------------------

On 2012-07-16T09:01:01Z, rebolek, commented:
<https://github.com/red/red/issues/219#issuecomment-7001363>

    Ok, understood.

