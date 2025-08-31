
#4814: DO does not require of Red header
================================================================================
Issue is closed, was reported by endo64 and has 4 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/4814>

**Describe the bug**
If a file doesn't have `Red []` header, `do %file` silently ignored.

**To reproduce**
```
write %file {print 3 * 5}
do %file
```

**Expected behavior**
Should report `Script is missing a Red header` error 

**Platform version**
```
Red 0.6.4 for Windows built 24-Jan-2021/10:45:46+03:00 commit #48fca9c
```



Comments:
--------------------------------------------------------------------------------

On 2021-01-29T22:25:26Z, endo64, commented:
<https://github.com/red/red/issues/4814#issuecomment-770082974>

    ```
    write %file {print "test"}
    do %file
    
    *** Syntax Error: (line 1) invalid string at "
    *** Where: transcode
    *** Stack: do-file load
    ```

--------------------------------------------------------------------------------

On 2022-08-24T15:07:14Z, dockimbel, commented:
<https://github.com/red/red/issues/4814#issuecomment-1225854064>

    Seems to have been implemented since this ticket was opened:
    ```
    >> write %file {print 3 * 5}
    >> do %file
    *** Syntax Error: script is missing a Red header: file
    *** Where: do
    *** Near : args
    *** Stack: do-file cause-error 
    ```

