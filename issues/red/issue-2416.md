
#2416: [macOS] System Crash
================================================================================
Issue is closed, was reported by JenniferLee520 and has 4 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/2416>

Running the "Weima" code, that I sent to the FullStack Technologies company earlier, twice in the same console will crush the system (as shown below)

```Red
red>> do %weima.red 
red>> do %weima.red
Jan 16 13:28:53  console[2540] <Warning>: void CGSUpdateManager::log() const: conn 0x1bd0f: spurious update.

*** Runtime Error 1: access violation
*** at: 943052AEh
```


Comments:
--------------------------------------------------------------------------------

On 2017-04-15T17:19:54Z, JerryTsai, commented:
<https://github.com/red/red/issues/2416#issuecomment-294306550>

    This issue is gone in the latest auto-build version.

--------------------------------------------------------------------------------

On 2017-04-16T01:15:44Z, qtxie, commented:
<https://github.com/red/red/issues/2416#issuecomment-294327264>

    Good to know. :-)

