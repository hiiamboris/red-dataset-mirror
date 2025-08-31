
#5500: MSDOS support, really?   (Feature Request/Fix, or should rename the --target)
================================================================================
Issue is open, was reported by JBThiel and has 12 comment(s).
<https://github.com/red/red/issues/5500>

Do the PE32 "MSDOS" executables compiled by Red with -t --target
  "MSDOS        : Windows, x86, console (+ GUI) applications"

actually run under some version of real MSDOS, DRDOS, FreeDOS, ...?
Or some emulator like DosBox or DosEmu on Linux?
Or can be made to run using some extender/adapter?

If this feature is intended, it's not currently working.
A minimal helloWorld compiled on Linux via
`  red -c --no-view -t MSDOS hello.red`
and tested in DosBox reports:  "This program cannot be run in MS-DOS mode."
Tested Red 0.6.4, and red-toolchain-12apr24-36adc615a

If this feature is not currently available, but is intended, or possible, I strongly encourage adding,
it would be an extraordinarily great feature.
DOS is still a distinct useful platform, with even new software being written for it.
A self-contained development tool like Red would be a major asset, enabling developers to easily tack-on support for such legacy systems.

But even more significantly,  the presentation of Red as spanning development from 64-bit modern systems back to even 16-bit DOS indicates an extremely comprehensive design and capability, unique and notable.  It's a super marketing point!  By contrast, there is a disappointing weasel sense when you find out the advertised "MSDOS" support doesn't actually work in real DOS.

So if real DOS support is not intended, planned, or possible, then the target should absolutely be renamed.
Because otherwise the name "MSDOS" is very deceptive, almost insidiously so.
Call it "PE32Console", "WxConsole", "WxDOS", "WxCON", something like that.




Comments:
--------------------------------------------------------------------------------

On 2024-04-21T01:29:19Z, greggirwin, commented:
<https://github.com/red/red/issues/5500#issuecomment-2067835691>

    Support for actual DOS OSs is not planned. A name change for the CLI switch is possible, deprecating the current one. 

--------------------------------------------------------------------------------

On 2024-04-21T02:27:08Z, JBThiel, commented:
<https://github.com/red/red/issues/5500#issuecomment-2067865600>

    Too bad not real MSDOS, but unsurprising -- too different, limited, and much work with tiny audience.
    It would be an amazing feature though, so impressive.
    
    Good you are open to changing the name for --target, it will really help with potential confusion in user expectations.
    Even if developers mostly know, casual users can see the usage screens and spread wrong information.
    
    Just as a quick estimate, does anyone know if Red supporting legacy DOS is in the realm of "technically impossible",
    or just way way down on the work-vs-benefits priorities?
    I seem to have heard Rebol once ran on DOS (or still?), although I haven't tested.

--------------------------------------------------------------------------------

On 2024-04-21T16:47:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/5500#issuecomment-2068131512>

    > does anyone know if Red supporting legacy DOS is in the realm of "technically impossible", or just way way down on the work-vs-benefits priorities?
    
    The latter ;)
    
    I agree the name is highly misleading.

--------------------------------------------------------------------------------

On 2024-04-21T20:44:45Z, greggirwin, commented:
<https://github.com/red/red/issues/5500#issuecomment-2068192811>

    Anything is technically possible in Red, even writing drivers and OSs. But the real killer is the design part of what you leave out in order to fit in a small memory space. A fun novelty? Sure. But start with PicoRed for RasPi and port from there.
    

--------------------------------------------------------------------------------

On 2024-04-22T02:16:36Z, JBThiel, commented:
<https://github.com/red/red/issues/5500#issuecomment-2068365196>

    I poked around with a couple DOS Extenders that can deal with Win32 PE32 exes somewhat.
    
    WDOSX097,  https://tippach.hier-im-netz.de/wdosx/
    Reported "This PE does not contain relocation info (fixed executable)."
      Manual says "Make sure  you do  not  create a  "fixed"  PE executable,  that  is, an
       executable that has the relocation info stripped off. MSVC++ allows you
       to create these kinds of executables. Don't."
    
    HX-DPMI,  https://www.japheth.de/HX.html
    Would also prefer having the relocation info, but infers a customary base address.
    It detects MSVCRT.DLL is needed.
    After providing an MSVCRT.DLL from a Windows 2000 installation,
    it proceeded to a new error:
    dpmild32: import not found: __iob_func
    dpmild32: file MSVCRT.DLL
    ... dkrnl32.dll: cannot resolve imports
    
    So that MSVCRT.DLL was too old, doesn't have __iob_func.
    I tried another from Windows 7.
    Then the hello.exe printed "cannot be run in DOS mode"
    and exited HX-DPMI with a register dump (Exception 0E).
    
    So, not much luck, but a bit of prospect.
    Inspecting the hello.exe from Red, I see it has these DLL refs:
    ADVAPI32.DLL
    GDIPLUS.DLL
    KERNEL32.DLL
    MSVCRT.DLL
    OLE32.DLL
    OLEAUT32.DLL
    SHELL32.DLL
    USER32.DLL
    
    HX-DPMI is one of the most advanced extenders and includes some Win32 functionality, even GUI.
    "Provides limited Win32 support to allow Windows console and some Win32 GUI applications to run under DOS."
    It has reduced versions of almost all those dlls (except MSVCRT.DLL).
    It recognizes the dll load and patches the call to its own versions:
    DADVAPI.DLL
    DGDI32.DLL
    DKRNL32.DLL
    OLE32.DLL
    OLEAUT32.DLL
    SHELL32.DLL
    DUSER32.DLL
    
    Another well-regarded extender is PMODE/W, http://www.sid6581.net/pmodew/
    from the Watcom compiler, recently Open-Sourced.
    Claimed improvement over Dos/4GW, but no Win32 dlls like HX-DPMI, I think.
    
    Others:
    https://www.thefreecountry.com/programming/dosextenders.shtml
    https://en.wikipedia.org/wiki/DOS_extender
    
    Maybe HX-DPMI, or some of these other Extenders could be a suitable "MSDOS" target for Red.
    Then Red wouldn't have to go all the way to plain DOS, 16-bit, 640K.
    It could just further constrain the PE32Console apps to
    use the bare minimum DLL functions that the extender provides.
    Several have pretty good documentation, flexible license, even source code.
    Plus you have the advantage of designing from "both ends",
    could add a few more critical functions in the Extender if necessary.
    
    I would say such extended DOS is a reasonable enough baseline, so Red can still access
    large memory, 32-bit protected code, etc.  An additional development motive/benefit is being able to write
    Red console apps on any system, with testing under the widely available DosBox, for confident deployment to Windows, instead of requiring a whole Windows VM for testing.
    Plus actually using the Red code productively in your DosBox or other DOS environment.
    
    Of course, it would be even more impressive if Red actually could run in 16-bit, 640K, plus a good proof of Red/System, but that's less immediately applicable.

--------------------------------------------------------------------------------

On 2024-04-22T19:13:15Z, greggirwin, commented:
<https://github.com/red/red/issues/5500#issuecomment-2070711036>

    Thanks for the research and detailed report!

