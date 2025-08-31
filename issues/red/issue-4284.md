
#4284: Windows clipboard failure when accessed by other programs
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4284>

discovered by @dockimbel [February 3, 2020 9:31 PM](https://gitter.im/red/bugs?at=5e386718594a0517c2651f82)

**Describe the bug**

`write-clipboard` has a strange failure pattern

**To reproduce**

1. Run this code in GUI console: `loop 10 [wait 1 prin either write-clipboard "1" [#"."][#"F"]]`
2. During these 10 seconds - copy something to clipboard from any other program
3. The (other) program will hang for 5 seconds, the output string will contain 4-5 `F` (failure) chars (e.g. `..FFFFF...`). I.e. for 5 seconds in a row `write-clipboard` continues to fail (in OpenClipboard).

So far I have observed the following:
1. Failure happens *only in GUI console*, and only if it was compiled *with `-t Windows`* flag. Same GUI console compiled with `-t MSDOS`, even after `flip-exe-flag` will be OK. I wasn't able to reproduce it without console in a standalone compiled script.
2. `wait` period should be set to less than 5 seconds. It's the second write during 5 second interval that causes the failure.
3. Inserting `do-events/no-wait` into the loop stops it from failing (not yet sure what particular call during event processing does that..)

**Expected behavior**

A single clipboard write may be allowed to fail (when it's locked by the other program), but no more than that. We should investigate this closer or try to find an easy workaround.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 31-Jan-2020/17:12:41+03:00 commit #414cdb3
```



