
#463: UTF-8 truncated when passed to ROUTINE
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 8 comment(s).
[status.dismissed] [Red/System]
<https://github.com/red/red/issues/463>

```
Red []

r: routine [
    data    [string!]
][
    print-line length? as-c-string string/rs-head data
    print-line as-c-string string/rs-head data
]

r probe {EspañolРусскийSlovenščina}
```

"Espa^(F1)ol^(420)^(443)^(441)^(441)^(43A)^(438)^(439)Sloven^(161)^(10D)ina"
1
E



Comments:
--------------------------------------------------------------------------------

On 2013-04-09T05:21:01Z, PeterWAWood, commented:
<https://github.com/red/red/issues/463#issuecomment-16094746>

    I believe this is behaviour is to be expected.  Doesn't probe return its argument? The UTF-8 source string will have been loaded into the string! value as UCS-16 (based on the characters it contains). The string! content would start with 6900, the UCS-16 code (little-endian) for "E:. When cast to a c-string!, this would be treated as a string containing the single character "E" immediately followed by a null byte string terminator.  

--------------------------------------------------------------------------------

On 2013-04-09T05:33:17Z, PeterWAWood, commented:
<https://github.com/red/red/issues/463#issuecomment-16095037>

    If you use 'MOLD instead of "PROBE you get the following output:
    
    ```
    76
    "Espa^(F1)ol^(420)^(443)^(441)^(441)^(43A)^(438)^(439)Sloven^(161)^(10D)ina"
    ```

--------------------------------------------------------------------------------

On 2013-04-09T08:18:56Z, dockimbel, commented:
<https://github.com/red/red/issues/463#issuecomment-16099952>

    The Red internal API is not yet fully designed and implemented. Among other things, it should be possible to expose Red's PRIN/PRINT internals, so that you could use something like `red-prin` or `red-print` from inside a routine! on a red-string! pointer.

--------------------------------------------------------------------------------

On 2013-04-09T17:51:20Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/463#issuecomment-16128762>

    It was my understanding that string/rs-head returns a UTF-8 cache of a string. How can I get this value?
    
    It is not my goal to print the string; this was merely for the issue report. I just want to get the UTF-8 back that I fed in. The non-minimised problem I'm having is the following:
    
    write %syllable.org.html read "http://syllable.org"
    
    This writes out just one character instead of the expected file.

