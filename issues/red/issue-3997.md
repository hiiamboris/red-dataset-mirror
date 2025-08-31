
#3997: Using `#include %file.red` in context will not be compiled successfully
================================================================================
Issue is closed, was reported by bitbegin and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3997>

**Describe the bug**




**To reproduce**


`test2.red`: 

```
Red []

aa: context [
    #include %test3.red

    launch: does [
		apply-cfg
    ]

]

aa/launch

```

`test3.red`:

```
Red []

apply-cfg: function [][]

```

to compile test2.red using `do/args %red.r "-r test2.red` will be failed

**Expected behavior**
build successful


**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 11-Aug-2019/1:38:23+08:00 commit #76af538
```



Comments:
--------------------------------------------------------------------------------

On 2019-08-20T16:25:00Z, 9214, commented:
<https://github.com/red/red/issues/3997#issuecomment-523090573>

    https://github.com/red/red/issues/3921

