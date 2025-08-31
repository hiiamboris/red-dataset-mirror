
#5129: [Compiler] `all []` / `any []` mess up stack
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.review] [type.compiler]
<https://github.com/red/red/issues/5129>

**Describe the bug**

`all []` and `any []` produce two new stack values: unset and none, resetting stack in the middle, losing both unset and the previously pushed argument(s):
![](https://i.gyazo.com/4ea628675086af4bc786bccde35ee10a.png)

**To reproduce**
```
Red []
h: reduce [none 1 2]
probe find h any [] 
probe find h all []
```
Compile this & run (in any mode): it outputs `none` twice, because `none/find` gets triggered instead of `block/find`

**Expected behavior**
```
[none 1 2]
[none 1 2]
```

**Platform version**
```
Red 0.6.4 for Windows built 15-Apr-2022/11:42:52+03:00  commit #502097e
```



Comments:
--------------------------------------------------------------------------------

On 2022-05-27T16:27:31Z, dockimbel, commented:
<https://github.com/red/red/issues/5129#issuecomment-1139775066>

    The return value in edge cases (or even regular cases) for control flow natives has not been precisely defined yet. The current implementation is just reflecting that. The interpreter is returning `none` in both those cases, but there's another ticket (or a REP) about `all []` proposing rather to return `true`, like in Rebol.

--------------------------------------------------------------------------------

On 2024-03-29T18:01:57Z, 9214, commented:
<https://github.com/red/red/issues/5129#issuecomment-2027555378>

    > there's another ticket (or a REP) about all [] proposing rather to return true, like in Rebol.
    
    https://github.com/red/red/pull/4484, https://github.com/red/REP/issues/85.

