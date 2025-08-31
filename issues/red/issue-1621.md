
#1621: Passing function! in object! cannot be compiled
================================================================================
Issue is closed, was reported by rebolek and has 12 comment(s).
[status.resolved]
<https://github.com/red/red/issues/1621>

Consider this code:

```
o: object [f: func [v] [v + 1]]
f: :o/f
print f 1
```

When run from interpreter, it prints `2` as expected. However, when you try to compile it, you get `*** Red Compiler Internal Error: Script Error : copy expected value argument of type: series port bitset`.



Comments:
--------------------------------------------------------------------------------

On 2016-02-13T13:48:43Z, meijeru, commented:
<https://github.com/red/red/issues/1621#issuecomment-183667994>

    It compiles OK here with Red version of 31-Jan-2016 under W10. So maybe a regression?

--------------------------------------------------------------------------------

On 2016-02-14T08:51:27Z, ghost, commented:
<https://github.com/red/red/issues/1621#issuecomment-183853907>

    Compiles and works OK for me on latest master binaries...

--------------------------------------------------------------------------------

On 2016-02-14T11:29:43Z, PeterWAWood, commented:
<https://github.com/red/red/issues/1621#issuecomment-183875771>

    Compiles and runs as expected for me using the latest master source under both OS/X and Windows 7.

--------------------------------------------------------------------------------

On 2016-02-14T15:25:51Z, WiseGenius, commented:
<https://github.com/red/red/issues/1621#issuecomment-183905264>

    Compiles and runs here in both Windows XP and Windows 7 using both Rebol/View and Rebol/Core with the latest Red master sources since February 14.

--------------------------------------------------------------------------------

On 2016-02-15T15:08:59Z, rebolek, commented:
<https://github.com/red/red/issues/1621#issuecomment-184247144>

    Hm, thanks for report, I’ll try again with latest version.

--------------------------------------------------------------------------------

On 2016-05-09T05:01:01Z, dockimbel, commented:
<https://github.com/red/red/issues/1621#issuecomment-217776325>

    Compiles and runs fine on latest version.

