
#2698: Does not install on Windows Insider builds
================================================================================
Issue is closed, was reported by zetrozky and has 12 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/2698>

It tells me that it isn't supported on my version of Windows, even though I'm on beta builds(, which are technically the newest versions of Windows). Why is that?


Comments:
--------------------------------------------------------------------------------

On 2017-05-20T10:18:49Z, dockimbel, commented:
<https://github.com/red/red/issues/2698#issuecomment-302864316>

    We don't have a Windows Insider build here, so can't test on it. Could you please describe which version of Red you launch, how you launch it and the exact error message with all the information (or better a screenshot)?

--------------------------------------------------------------------------------

On 2017-05-20T10:23:15Z, zetrozky, commented:
<https://github.com/red/red/issues/2698#issuecomment-302864529>

    ![screenshot 33](https://cloud.githubusercontent.com/assets/15012524/26274987/32083e4c-3d74-11e7-9612-9850c54c5568.png)
    
    Here. I'm on build 16199 if that's of any use, and I'm trying to assemble the environment for the first time ("install") on red 0.6.2 stable. I also tried using the latest auto assembled build (red-19may17-e4a75bc.exe), and got the same error.

--------------------------------------------------------------------------------

On 2017-05-20T10:24:17Z, zetrozky, commented:
<https://github.com/red/red/issues/2698#issuecomment-302864578>

    I tried deleting the folder and installing again, still got the same error on both stable and nightly.

--------------------------------------------------------------------------------

On 2017-05-20T10:34:49Z, dockimbel, commented:
<https://github.com/red/red/issues/2698#issuecomment-302865064>

    Thanks.

--------------------------------------------------------------------------------

On 2017-05-20T12:28:06Z, zetrozky, commented:
<https://github.com/red/red/issues/2698#issuecomment-302870148>

    
    [Logfile.zip](https://github.com/red/red/files/1016153/Logfile.zip)
    
    Here's the log. Took me an eternity cause of my 2007 grade laptop and internet.

--------------------------------------------------------------------------------

On 2017-07-29T09:02:28Z, dockimbel, commented:
<https://github.com/red/red/issues/2698#issuecomment-318815418>

    I could not reproduce the issue on latest Windows 10, and we don't have Windows Insider here. As Windows Insider is actually a beta version of Windows 10, it is possible that it does not ship with all the legacy 32-bit libraries of the release version.
    
    Thanks for providing all the extra information and logs. I will close this ticket now, as this issue does not appear in the official Windows 10 release.

