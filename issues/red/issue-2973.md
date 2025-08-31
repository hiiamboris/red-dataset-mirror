
#2973: switch/default is missing its case argument
================================================================================
Issue is closed, was reported by webcpu and has 6 comment(s).
<https://github.com/red/red/issues/2973>

**Environment:**
Red: 0.6.3
OS: macOS

**Test Procedure:**
```
schedule: [
    8:30 [ftp://ftp.rebol.org/wakeup.r]
    10:30 [http://www.rebol.com/break.r]
    18:45 [ftp://ftp.rebol.org/sleep.r]
][
    http://www.google.com
]
print switch/default 08:31 schedule

```
**Expected Result:**
http://www.google.com

**Actual Result:**
*** Script Error: switch/default is missing its case argument
*** Where: switch
*** Stack:


Comments:
--------------------------------------------------------------------------------

On 2017-08-14T14:33:40Z, xqlab, commented:
<https://github.com/red/red/issues/2973#issuecomment-322206794>

    schedule is just one, the first block, not two.
    You can use
    ```
     >> schedule:[[
    [        8:30 [ftp://ftp.rebol.org/wakeup.r]
    [        10:30 [http://www.rebol.com/break.r]
    [        18:45 [ftp://ftp.rebol.org/sleep.r]
    [    ][
    [        http://www.google.com
    [    ]]
    == [[8:30:00 [ftp://ftp.rebol.org/wakeup.r] 10:30:00 [http://www.
    >> print switch/default 08:31 schedule/1 schedule/2
    http://www.google.com
    >> 

--------------------------------------------------------------------------------

On 2017-08-14T16:13:23Z, greggirwin, commented:
<https://github.com/red/red/issues/2973#issuecomment-322234777>

    @xqlab is correct. Chat on gitter at https://gitter.im/red/red/welcome or https://gitter.im/red/red if you have more questions.

--------------------------------------------------------------------------------

On 2017-08-14T16:29:15Z, webcpu, commented:
<https://github.com/red/red/issues/2973#issuecomment-322238850>

    @xqlab @greggirwin Thanks. It's a surprise. It works!

