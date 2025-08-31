
#2156: The latest Auto-build version of Red treats files as directories when I try to DO the file in console.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 8 comment(s).
[type.bug] [status.reviewed] [type.review]
<https://github.com/red/red/issues/2156>

``` Red
red>> do %McEn.red
*** Access Error: cannot open: %/C/Users/JenniferLee/Desktop/McEn.red/
*** Where: do
```

The file %McEn.red does exits though.



Comments:
--------------------------------------------------------------------------------

On 2016-08-05T06:33:09Z, qtxie, commented:
<https://github.com/red/red/issues/2156#issuecomment-237767706>

    I cann't reproduce it on win 7 and win 10.

--------------------------------------------------------------------------------

On 2016-08-05T06:53:08Z, dockimbel, commented:
<https://github.com/red/red/issues/2156#issuecomment-237770600>

    I cannot reproduce it either.

--------------------------------------------------------------------------------

On 2016-12-12T14:10:53Z, JenniferLee520, commented:
<https://github.com/red/red/issues/2156#issuecomment-266440007>

    This happened from time to time. even in the latest version. Both on Windows and Mac. It is not easy to reproduce this bug. When it happens, I have to load the source file then do the block, instead. After a few hours or days, it might came back to normal. This issue is tricky.

--------------------------------------------------------------------------------

On 2017-02-13T02:33:33Z, qtxie, commented:
<https://github.com/red/red/issues/2156#issuecomment-279280623>

    As we cannot reproduce it for now, I close this issue.

