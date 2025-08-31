
#3094: Access violation when creating errors improperly
================================================================================
Issue is closed, was reported by wasamasa and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3094>

### Expected behavior

Even if I don't get the block argument of `make error!` right, the console stays open.

### Actual behavior

The console crashes with "Runtime Error 1: access violation"

### Steps to reproduce the problem

```
red
--== Red 0.6.3 ==-- 
Type HELP for starting information. 

>> make error! [user "Test"]

*** Runtime Error 1: access violation
*** at: 08073FBAh
```

### Red version and build date, operating system with version.

Snapshot downloaded today from http://static.red-lang.org/dl/auto/linux/red-latest running on Arch Linux.


Comments:
--------------------------------------------------------------------------------

On 2017-11-02T01:37:25Z, qtxie, commented:
<https://github.com/red/red/issues/3094#issuecomment-341292628>

    No crashes on Windows.

--------------------------------------------------------------------------------

On 2017-11-02T02:30:58Z, qtxie, commented:
<https://github.com/red/red/issues/3094#issuecomment-341300053>

    No crashes on Windows.

