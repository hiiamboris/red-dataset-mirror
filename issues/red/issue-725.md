
#725: MOLD & PRINT seem broken for Latin 1
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/725>

red>> s: "Español"
== "Espa^(F1)ol"
red>> print s
Espa�ol

The string is entered in the console as UTF-8. It seems to me that F1 is a UCS-1 encoding. Is that proper for MOLD, instead of a UTF-8 encoding?

In any case, the code is not being emitted correctly by PRINT, neither on Linux nor Windows. It seems to be printed as Latin-1/UCS-1 instead of the operating system's encoding (UTF-8 for modern Linux).



Comments:
--------------------------------------------------------------------------------

On 2014-03-10T11:27:15Z, dockimbel, commented:
<https://github.com/red/red/issues/725#issuecomment-37172850>

    On Windows 7, it works fine:
    
    ```
    red>> s: "Español"
    == "Espa^(F1)ol"
    red>> print s
    Español
    ```
    
    On Linux, there is a bug when printing indeed:
    
    ```
    red>> s: "Español"
    == "Espa^(F1)ol"
    red>> print s
    Espa�ol
    ```

