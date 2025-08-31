
#704: Console: "ReadConsole failed!"
================================================================================
Issue is closed, was reported by qtxie and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/704>

Run the new Unicode Red console from the transcode branch.

```
-=== Red Console alpha version ===-
Type HELP for starting information.

red>> ReadConsole failed!
```

OS: Windows 8 x64



Comments:
--------------------------------------------------------------------------------

On 2014-03-03T01:43:53Z, qtxie, commented:
<https://github.com/red/red/issues/704#issuecomment-36475632>

    From the comments of the `ReadConsole` page (http://msdn.microsoft.com/en-us/library/windows/desktop/ms684958%28v=vs.85%29.aspx)
    1. If ENABLE_LINE_INPUT is not set, the buffer size should be nNumberOfCharsToRead \* sizeof(TCHAR) + 1 
    2. on Windows 7 (x64), I've found that the limitation of the size of lpBuffer is less than 31,367 bytes, not 64K mentioned as this document.

--------------------------------------------------------------------------------

On 2014-03-03T07:58:08Z, dockimbel, commented:
<https://github.com/red/red/issues/704#issuecomment-36488194>

    Fixed by commit [283b8581](https://github.com/red/red/commit/283b8581c83d1200cf22273b3b48af5914beb327)

