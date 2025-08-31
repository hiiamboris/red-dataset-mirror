
#5267: Some names for `throw` are magical?
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[status.waiting] [type.bug] [type.design]
<https://github.com/red/red/issues/5267>

**Describe the bug**

This script:
```
Red []

write %1.red {Red [] throw/name 1 'console}
write %2.red {Red [] throw/name 2 'right-name-missed}

probe catch/name [do %1.red] 'wrong-name-caught
probe catch/name [do %2.red] 'right-name-missed
```
Outputs:
```
1
*** Throw Error: no catch for throw: 2
*** Where: catch
*** Near : Red [] throw/name 2 'right-name-missed
*** Stack: probe do-file
```

**Expected behavior**

First throw should not be caught and should produce an error. Second throw should either probe `2` or also produce an error (if `do` isolates throws by design) (`halt` relies on throws passing thru multiple levels of `do` so we should perhaps not isolate throws in `do` at all).

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4623 date: 29-Dec-2022/20:00:14 commit: #6af0b708408aeab6ca70dcdf7522d03278b7586e ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-01-14T17:29:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/5267#issuecomment-1382864889>

    Reason for this discrepancy seems to be a kludge in `do-file` made specifically to make `halt` work:
    https://github.com/red/red/blob/c7ceccff1e0022b22e35f25abdbac40940264c9c/environment/functions.red#L896-L900
    
    Initial intent of `do-file` according to https://github.com/red/red/commit/7564b902a561b75c56c53da9d42c1ea81c65c4c1 was to restore changed state and rethrow the error or thrown value.
    
    However as of today Red still lacks any by-design way to do so: https://github.com/red/red/issues/4416 which is the root issue and should be addressed first.

