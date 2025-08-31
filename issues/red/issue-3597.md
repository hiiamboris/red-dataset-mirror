
#3597: Compiled and interpreted script behaves differently
================================================================================
Issue is open, was reported by endo64 and has 6 comment(s).
[type.compiler]
<https://github.com/red/red/issues/3597>

**Describe the bug**
Compiled and interpreted script behaves differently for the below case:

**To Reproduce**
Steps to reproduce the behavior:

1. Save this file:
```
Red []
outer: object [
    myfunc: does [print "Original"]
    inner: object [
        set 'myfunc does [print "Inner"]
    ]
]
outer/myfunc
probe get 'outer/myfunc
outer/myfunc
```

2. Execute the file inside REPL.
3. Compile the script and execute it.

Output of interpreted script:
```
Inner
func [][print "Inner"]
Inner
```

Output of compiled executable:
```
Original
func [][print "Inner"]
Original
```

**Expected behavior**

Output of both should be same, as REPL.


**Platform version(please complete the following information):**
```
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.3 ahead: 1096 date: 25-Oct-2018/0:28:46 commit: #12ad56be0fc474f7738c0ef891725e49f9738010 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-11-19T21:33:51Z, endo64, commented:
<https://github.com/red/red/issues/3597#issuecomment-440049273>

    This solves the issue:
    ```
    Red []
    
    outer: object [
        myfunc: does [print "Original"]
        inner: object [
            do [set 'myfunc does [print "Inner"]]
        ]
    ]
    do [outer/myfunc]
    probe get 'outer/myfunc
    do [outer/myfunc]
    ```
    
    It is a compiler limitation as described here https://github.com/red/red/issues/1977 and here https://github.com/red/red/issues/1748

--------------------------------------------------------------------------------

On 2018-11-20T05:48:26Z, 9214, commented:
<https://github.com/red/red/issues/3597#issuecomment-440150436>

    @endo64 as a rule of thumb (which we should probably document somewhere), use `-e` flag if you want to avoid compiler limitations, or wrap sensitive parts of your script in `do` block, which forces interpretation (by design).

--------------------------------------------------------------------------------

On 2018-11-20T20:39:20Z, meijeru, commented:
<https://github.com/red/red/issues/3597#issuecomment-440421522>

    I just discovered another compiler/interpreter discrepancy - see comment to #3285

