
#3255: Red (automated builds) is blocked by Windows Defender
================================================================================
Issue is closed, was reported by anta40 and has 6 comment(s).
[type.AV]
<https://github.com/red/red/issues/3255>

1. Grab the latest automated build, e.g red-13mar18-3b520bea.exe.
2. Run it.
3. After the usual "Compiling compression library..." and "Compiling Red GUI Console...", Windows Defender (I'm on Windows 10) will block it:
![dorv](https://user-images.githubusercontent.com/16976/37357798-e80ed8c2-271b-11e8-8f6e-3362ad94296b.jpg)




Comments:
--------------------------------------------------------------------------------

On 2018-03-13T17:24:46Z, greggirwin, commented:
<https://github.com/red/red/issues/3255#issuecomment-372748670>

    Thanks for the report. We have an AV initiative in the works to deal with these false positives.

--------------------------------------------------------------------------------

On 2018-03-13T17:26:11Z, greggirwin, commented:
<https://github.com/red/red/issues/3255#issuecomment-372749175>

    I've linked this ticket for that work, and so will close this ticket as we can't address the AV issues here.

--------------------------------------------------------------------------------

On 2018-03-14T09:18:09Z, dockimbel, commented:
<https://github.com/red/red/issues/3255#issuecomment-372953880>

    @anta40 Could you provide your Windows Defender definitions version? We need it in order to report a false positive to Microsoft.
    
    I have scanned the same file using Windows Defender (definition v1.263.492.0) on Win7 64-bit, and no threat was detected. I also run it and after launching the console, Defender still didn't notify any threat.

