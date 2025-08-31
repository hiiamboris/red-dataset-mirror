
#4867: [Compiler] `alert` fails unwittingly under console subsystem
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.review] [type.compiler]
<https://github.com/red/red/issues/4867>

**Describe the bug**

The call to `alert` says:
```
*** Script Error: path none is not valid for unset! type
*** Where: eval-path
*** Stack: alert
```

**To reproduce**

1. Create a script `1.red`: `Red [] alert "is a game"`
2. Compile it: `red -r -t MSDOS 1.red`
3. Run, see the error output

**Expected behavior**

Compiler must warn that GUI subsystem is not being included.

**Platform version**
```
Red 0.6.4 for Windows built 18-Mar-2021/22:28:01+03:00  commit #73d9bd2
```



Comments:
--------------------------------------------------------------------------------

On 2022-08-30T17:11:35Z, dockimbel, commented:
<https://github.com/red/red/issues/4867#issuecomment-1231941234>

    > Compiler must warn that GUI subsystem is not being included.
    
    The compiler cannot know that. `view` and `alert`  are words like any other from the compiler's perspective.

--------------------------------------------------------------------------------

On 2022-08-30T17:57:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/4867#issuecomment-1231986515>

    Perhaps `alert` should simply be undefined then.

