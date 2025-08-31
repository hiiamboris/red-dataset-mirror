
#4189: Escape key on CLI console doesn't clear input buffer
================================================================================
Issue is closed, was reported by endo64 and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4189>

**Describe the bug**
Pressing Escape key on CLI console during writing a refinement doesn't clear the buffer correctly.

**To reproduce**
1. Open CLI console
2. Type a function name and part of a refinement of it
3. Press TAB key to complete
4. Press Escape key

Input buffer is cleared just after the position where the tab key pressed.

**Expected behavior**
Console input buffer should be cleared completely.

**Screenshots**
![red-console](https://user-images.githubusercontent.com/840604/70948453-8c435080-206c-11ea-9075-ddd101d008e6.gif)


**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 17-Dec-2019/0:33:50+03:00 commit #847ede2
```



Comments:
--------------------------------------------------------------------------------

On 2019-12-16T22:39:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/4189#issuecomment-566279490>

    Works for me on `Red 0.6.4 for Windows built 12-Dec-2019/11:14:17+03:00 commit #61d4d36`

--------------------------------------------------------------------------------

On 2019-12-17T10:26:30Z, loziniak, commented:
<https://github.com/red/red/issues/4189#issuecomment-566480391>

    Confirmed in Arch Linux, branch GTK commit #d89f33b100c051ed. ~~, although without `*** Script error`, just constantly repeating `view/opti` with cursor positioned  at start of the line~~ (just realized, that error comes from hitting `Enter`, not `Escape`. So, this is exactly the same in Linux)

--------------------------------------------------------------------------------

On 2019-12-18T20:34:07Z, endo64, commented:
<https://github.com/red/red/issues/4189#issuecomment-567201778>

    I'm on Win10, @hiiamboris you tested on W7 right? @greggirwin also confirmed the issue, he is also on Win10 I assume.
    @loziniak Yes, error happens because I pressed enter key not related to the issue (just to be sure that it is not just a visual artifact)

--------------------------------------------------------------------------------

On 2019-12-18T20:42:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/4189#issuecomment-567204719>

    Right

--------------------------------------------------------------------------------

On 2020-01-18T15:03:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/4189#issuecomment-575906503>

    Duh! I only now noticed it's **CLI** console where this bug appears. Confirmed on W7 then ;)

