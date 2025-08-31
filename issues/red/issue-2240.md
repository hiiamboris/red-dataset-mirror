
#2240: #export in CONTEXT causes Internal compiler error
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2240>

Both examples in #473 cause internal error:

First example:

```
Red/System []

c: context [
    e: does []
    #export [e]
]
```

Output:

```
*** Red/System Compiler Internal Error: Script Error : Cannot use path on none! value
*** Where: process-export
*** Near:  [spec/3: any [cc 'cdecl]
unless spec/5
```

Second example:

```
Red/System []

c: context [
    e: does []
]
 #export [c/e]

```

Output:

```
*** Red/System Compiler Internal Error: Script Error : length? expected series argument of type: series
 port tuple bitset struct
*** Where: section-addr?
*** Near:  [length? section/2]
```



Comments:
--------------------------------------------------------------------------------

On 2017-02-18T11:03:53Z, dockimbel, commented:
<https://github.com/red/red/issues/2240#issuecomment-280838489>

    They compile fine when targeting a library instead of an executable. Now the error if the target is an executable, will be:
    ```
    *** Compilation Error: #export directive requires a library compilation mode
    ```

