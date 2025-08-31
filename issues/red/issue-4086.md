
#4086: set operations on the same hash! buffer are broken
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [type.bug] [test.written]
<https://github.com/red/red/issues/4086>

**Describe the bug**

Hash set operations work incorrectly when given the same series buffer twice. See below.
The problem source is: `do-set-op` iterates over `a` then over `b`. But while it iterates over `a` it modifies the (shared) hash table, and subsequent iteration over `b` becomes invalid. Perhaps using `hashtable/refresh` will be a better solution for the same buffer case.

**To reproduce**

Run the snippet 
```
a: make hash! [5 6 7 8]
b: skip a 2
probe unique b           ;) expected [7 8]     got [7 8]
probe unique a           ;) expected [5 6 7 8] got [5 6 7 8]
probe union a b          ;) expected [5 6 7 8] got [5 6 7 8]
probe intersect a b      ;) expected [7 8]     got [5 6 7 8]     -- wrong!
probe intersect b a      ;) expected [7 8]     got [7 8]
probe difference a b     ;) expected [5 6]     got []            -- wrong!
probe difference b a     ;) expected [5 6]     got []            -- wrong!
probe exclude a b        ;) expected [5 6]     got []            -- wrong!
probe exclude b a        ;) expected []        got []
```

**Expected behavior**
see the snippet

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 1-Oct-2019/19:41:56+03:00 commit #2976655
```



Comments:
--------------------------------------------------------------------------------

On 2019-10-16T11:04:21Z, 9214, commented:
<https://github.com/red/red/issues/4086#issuecomment-542648193>

    https://github.com/red/red/issues/3195

