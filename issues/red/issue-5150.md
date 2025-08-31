
#5150: R/S MEMORY-STATS fails with unmet assertion
================================================================================
Issue is closed, was reported by gurzgri and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5150>

```Red
Red [] #system [memory-stats 3]
```

fails with unmet assertion:

```
====== Red Memory Stats ======

-- Node frames --
#1: used = 10000/10000 (100%), free = 0/10000 (0%)
#2: used = 424/10000 (4%), free = 9576/10000 (96%)

    2 frames

-- Series frames --
#1: used = 1048520/1048576 (99%), free = 56/1048576 (1%)
 - 05450014: size = 64000, offset pos = 0, tail pos = 25568    T
 - 0545FA28: size = 53491844, offset pos = -88472092, tail pos = 4

*** Runtime Error 98: assertion failed
*** in file: /C/Users/Christian Ensel/Development/red-master/runtime/debug-tools.reds
*** at line: 194
***
***   stack: red/list-series-buffers 05450004h
***   stack: red/memory-stats 3
```

**To reproduce**
Compile above script with `--debug` and run it.

**Expected behavior**
Assertion met, no runtime error to be thrown.

**Platform version**
Red 0.6.4 for Windows built 11-Jun-2022/15:58:04 @ commit 671dae6



Comments:
--------------------------------------------------------------------------------

On 2022-06-12T11:26:21Z, dockimbel, commented:
<https://github.com/red/red/issues/5150#issuecomment-1153133677>

    That series buffer dumping function was not updated after the introduction of the series padding bytes.

