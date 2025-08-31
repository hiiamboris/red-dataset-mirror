
#3670: [Compiler] Does not detect the script header properly
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/3670>

**Describe the bug**
A headerless script should trigger a compilation error.
What really happens:
```
*** Red Compiler Internal Error: Script Error : copy expected value argument of type: series port bitset
*** Where: rejoin
*** Near:  [mold copy/part pos 40]
```

**To reproduce**
Try to compile any script without `Red []` or `Red/System []` prefix

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 7-Dec-2018/8:41:53+03:00 commit #1bdbdc2
```



Comments:
--------------------------------------------------------------------------------

On 2018-12-20T09:16:35Z, dockimbel, commented:
<https://github.com/red/red/issues/3670#issuecomment-448927905>

    Relates to #3588.

