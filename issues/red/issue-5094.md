
#5094: [R/S] `throw` is unpredictable?
================================================================================
Issue is open, was reported by hiiamboris and has 14 comment(s).
[Red/System] [type.compiler]
<https://github.com/red/red/issues/5094>

**Describe the bug**

---
```
Red/System []
catch 1 [throw 1]
probe system/thrown
```
Compiles & runs fine, output is `1`

---
```
Red/System []
catch 1 [throw 2]
probe system/thrown
```
Crashes:
```
*** Runtime Error 1: access violation
*** at: 00401066h
```
Should there be not a proper error message, like no cat for throw?

---

But this one is the cause for this issue report:
```
Red []
#system [
	catch RED_THROWN_ERROR [fire [TO_ERROR(math overflow)]]
	probe system/thrown
]
```
Output when run:
```
*** Math Error: math or number overflow
*** Where: ???
*** Near : at-arg2
```
Why is it not caught by 7FFF'FFFFh??

**Expected behavior**

1. `RED_THROWN_ERROR` is supposed to catch everything
2. Some better error message than access violation in uncaught exception case

**Platform version**
```
Red 0.6.4 for Windows built 22-Feb-2022/5:26:32+03:00  commit #8126da7
```



Comments:
--------------------------------------------------------------------------------

On 2022-03-05T16:58:48Z, dockimbel, commented:
<https://github.com/red/red/issues/5094#issuecomment-1059796587>

    It seems related to `catch` behavior in global context.

--------------------------------------------------------------------------------

On 2022-03-07T16:24:23Z, hiiamboris, commented:
<https://github.com/red/red/issues/5094#issuecomment-1060876007>

    This doesn't allow me to work on HOFs, as I can't imagine a workaround :(

--------------------------------------------------------------------------------

On 2022-03-11T23:57:34Z, dockimbel, commented:
<https://github.com/red/red/issues/5094#issuecomment-1065673549>

    Actually, the reported issues above in the global context and in `#system` are not related.

--------------------------------------------------------------------------------

On 2022-03-12T00:23:57Z, dockimbel, commented:
<https://github.com/red/red/issues/5094#issuecomment-1065716069>

    > This doesn't allow me to work on HOFs, as I can't imagine a workaround :(
    
    Why would your work need a `catch` in global context instead of having it inside a function?

--------------------------------------------------------------------------------

On 2022-03-12T09:23:26Z, hiiamboris, commented:
<https://github.com/red/red/issues/5094#issuecomment-1065849351>

    I'm using it inside a function, it doesn't matter, it's still not getting caught. Global context is just a result of reduction.

--------------------------------------------------------------------------------

On 2022-03-12T12:33:10Z, dockimbel, commented:
<https://github.com/red/red/issues/5094#issuecomment-1065875600>

    I'm working on fixing the global context case.
    
    For the other one, it works as it should. You assume wrongly that `fire` is equivalent to `throw`. `fire` is meant to be used by Red actions/natives/routines, it does not always trigger a `throw`. If `fire` does not detect a wrapping `try` call, it will fallback to displaying the `error!` value and quiting (see https://github.com/red/red/blob/master/runtime/stack.reds#L466). In such case, no R/S-level exception is thrown. Without such fallback handler, it could result in a `Runtime Error 95: no CATCH for THROW`, as the Red stack management code cannot know if the user provided at R/S level a wrapping `catch` or not.

--------------------------------------------------------------------------------

On 2022-03-12T14:24:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/5094#issuecomment-1065892190>

    Aha! Thanks, that explains it.
    This catches the error:
    ```
    Red []
    
    rou: routine [] [
        catch RED_THROWN_ERROR [fire [TO_ERROR(math overflow)]]
        probe system/thrown
        system/thrown: 0
        stack/set-last as cell! unset/push
    ]
    
    probe try [rou]
    ```
    However crashes:
    ```
    2147483647
    
    *** Runtime Error 1: access violation
    *** at: 00427C96h
    ```
    Supposedly in the same way as 2nd snippet above.

