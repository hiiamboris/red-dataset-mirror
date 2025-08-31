
#2984: forever [print now/time wait 1] 
================================================================================
Issue is closed, was reported by Blocode and has 2 comment(s).
<https://github.com/red/red/issues/2984>

```Red
>> forever [print now/time wait 1] 
```
This code won't work in GUI Console on Windows. The console hangs.

No problem in CLI console, though.


Comments:
--------------------------------------------------------------------------------

On 2017-08-20T18:25:13Z, greggirwin, commented:
<https://github.com/red/red/issues/2984#issuecomment-323602515>

    Known issue. This will be addressed with the new GUI console, in one of the next releases.

