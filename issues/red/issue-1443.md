
#1443: Error in draw dialect leads to Access violation
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.tested] [type.bug] [status.resolved]
<https://github.com/red/red/issues/1443>

I put "normal" VID code in a draw block. This gave a Script error first, but that was followed by a Runtime error. See below.

```
result of test.red
*** Script error: invalid Draw dialect input at: at 240x10 button 50x20 Exit a quit
*** Where: show-window
*** Stack: view show if show-window

*** Runtime Error 1: access violation
*** at: E0CB93B5h
```



Comments:
--------------------------------------------------------------------------------

On 2015-11-17T15:17:15Z, qtxie, commented:
<https://github.com/red/red/issues/1443#issuecomment-157400267>

    Related issue #1435 

--------------------------------------------------------------------------------

On 2016-02-26T04:34:27Z, dockimbel, commented:
<https://github.com/red/red/issues/1443#issuecomment-189110072>

    It seems to be working fine now, can't reproduce it anymore.

