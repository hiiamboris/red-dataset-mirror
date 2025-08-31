
#3184: Access violation when executing a function in a context
================================================================================
Issue is closed, was reported by ghost and has 10 comment(s).
<https://github.com/red/red/issues/3184>

### Expected behavior
No crash

### Actual behavior
Access violation

### Steps to reproduce the problem
red --cli main.red
*** Runtime Error 1: access violation
*** at: 004341DEh

### Red version and build date, operating system with version.
OS: Windows 10 Pro X64 version 1709
Red for Windows version 0.6.3 built 3-Jan-2018/15:50:36+01:00 / red-03jan18-47d2a03.exe



[scripts.zip](https://github.com/red/red/files/1600736/scripts.zip)



Comments:
--------------------------------------------------------------------------------

On 2018-01-03T18:24:05Z, greggirwin, commented:
<https://github.com/red/red/issues/3184#issuecomment-355087132>

    I haven't pulled your scripts Arie, but is it the same issue as https://github.com/red/red/issues/3156 ?

--------------------------------------------------------------------------------

On 2018-01-03T18:33:41Z, ghost, commented:
<https://github.com/red/red/issues/3184#issuecomment-355089563>

    Hi Gregg,
    
    maybe it is the same issue. Although it is also possible that it is related
    to a load stmt in the function where it goes awry ...
    
    Best regards,
       Arie
    
    Op 3 jan. 2018 7:24 p.m. schreef "Gregg Irwin" <notifications@github.com>:
    
    > I haven't pulled your scripts Arie, but is it the same issue as #3156
    > <https://github.com/red/red/issues/3156> ?
    >
    > —
    > You are receiving this because you authored the thread.
    > Reply to this email directly, view it on GitHub
    > <https://github.com/red/red/issues/3184#issuecomment-355087132>, or mute
    > the thread
    > <https://github.com/notifications/unsubscribe-auth/AB1t-oK-P2wZeZFF9SNComf42Ac8K9f1ks5tG8XQgaJpZM4RR2Wg>
    > .
    >

--------------------------------------------------------------------------------

On 2018-01-03T18:38:04Z, greggirwin, commented:
<https://github.com/red/red/issues/3184#issuecomment-355090717>

    Could you try to confirm, so we can close this ticket if it's a dupe? Thanks.

--------------------------------------------------------------------------------

On 2018-01-04T07:02:01Z, rebolek, commented:
<https://github.com/red/red/issues/3184#issuecomment-355212376>

    I can confirm it's the same bug, if you move everything into one file, it's basically same code as #3156.

--------------------------------------------------------------------------------

On 2018-01-04T18:41:44Z, greggirwin, commented:
<https://github.com/red/red/issues/3184#issuecomment-355363664>

    Thanks Bolek. Closing this ticket.

