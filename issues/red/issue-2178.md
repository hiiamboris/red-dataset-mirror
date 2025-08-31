
#2178: Can't run Red tests using rebol/core.
================================================================================
Issue is closed, was reported by ifgem and has 2 comment(s).
<https://github.com/red/red/issues/2178>

`do %system/tests/run-all.r`

```
Script: "Builds and Runs the Red Tests" (none)
** Script Error: Feature not available in this REBOL
** Where: context
** Near: SECURITY_ATTRIBUTES: make struct! [
    nLength [integer!]
    lpSecurityDescriptor [integer!]
    bInheritHandle [int...
```

And if run it again, it'll return:

```
** Access Error: Cannot open /C/Users/*****/Desktop/red-master/utils/tests/run-all.r
** Near: do %tests/run-all.r
```



Comments:
--------------------------------------------------------------------------------

On 2016-08-24T00:37:32Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2178#issuecomment-241925048>

    The tests can only be run in Rebol/View on Wndows. They can be run with Rebol/Core on Linux and macOS.

