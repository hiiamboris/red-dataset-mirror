
#3628: cryptic runtime errors and crashes caused by usage of UNIQUE
================================================================================
Issue is closed, was reported by 9214 and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3628>

**Describe the bug**
`unique` used on a local "cache" in a function leads to various runtime errors and crashes (see below).

**To Reproduce**

```red
k: 327 + random 1'000

add: func [x y][
    unique cache: [] ; <-- UNIQUE is the culprit
    last append cache x + y
]

do collect [
    repeat i k [keep reduce ['add random i]]
    keep 0
]
```

With random values of `k` greater than `327` it results in a mix of:
```
*** Error: stack pointers buffer overflow!
```
```
*** Runtime Error
```
```
runtime error R6016
- not enough space for thread data
```
```
*** Runtime Error 1: access violation
*** at: 0042FE70h
```

**Expected behavior**
I expect this whole enchillada to return the sum of random integers, and I expect all results of addition to be cached in a block.

**Platform version (please complete the following information):**
```
Red 0.6.4 for Windows built 28-Nov-2018/6:34:42+05:00 commit #d463f89
```


Comments:
--------------------------------------------------------------------------------

On 2018-12-03T02:12:07Z, greggirwin, commented:
<https://github.com/red/red/issues/3628#issuecomment-443567860>

    Confirmed, the set operation uses hash functions internally for blocks. `Recycle/off` didn't fix it here.

--------------------------------------------------------------------------------

On 2018-12-05T12:39:06Z, qtxie, commented:
<https://github.com/red/red/issues/3628#issuecomment-444471077>

    There is a very deep recursive call somewhere in the code, which cause the error.

