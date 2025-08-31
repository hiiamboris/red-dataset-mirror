
#1038: red-16feb15-d3a1ccb.exe crashed
================================================================================
Issue is closed, was reported by bitbegin and has 12 comment(s).
[status.resolved]
<https://github.com/red/red/issues/1038>

log:
*\* Script Error: Not enough memory
*\* Near: script: decapsulate
if none? script



Comments:
--------------------------------------------------------------------------------

On 2015-02-18T07:21:51Z, qtxie, commented:
<https://github.com/red/red/issues/1038#issuecomment-74823122>

    @bitbegin I can not reproduce it. It works well on my Win 7 64bit.

--------------------------------------------------------------------------------

On 2015-02-18T11:00:38Z, bitbegin, commented:
<https://github.com/red/red/issues/1038#issuecomment-74846651>

    My PC also is Win7 64bit. But there isn't more information.
    How can I do to help you with this issue?

--------------------------------------------------------------------------------

On 2015-02-18T11:19:30Z, qtxie, commented:
<https://github.com/red/red/issues/1038#issuecomment-74848774>

    @bitbegin You would delete the old console in here: `"C:\ProgramData\Red\console.exe"`, then try again with administrator permission.

--------------------------------------------------------------------------------

On 2015-02-25T02:39:54Z, dockimbel, commented:
<https://github.com/red/red/issues/1038#issuecomment-75895259>

    @bitbegin I cannot reproduce it either. The only reason I could see about such error is a corrupted binary, that could result from a download issue or an anti-virus silently modifying the binary.
    
    Can you reproduce that issue with newer binaries?

--------------------------------------------------------------------------------

On 2015-02-25T11:26:10Z, bitbegin, commented:
<https://github.com/red/red/issues/1038#issuecomment-75944925>

    @dockimbel  red-24feb15-3d15e1d.exe can be used normally. It was a download issue.

--------------------------------------------------------------------------------

On 2015-02-25T15:23:35Z, dockimbel, commented:
<https://github.com/red/red/issues/1038#issuecomment-75979060>

    Thank your for the reply. Closing this ticket now.

