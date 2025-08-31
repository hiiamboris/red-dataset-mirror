
#224: Assigning result of bitwise NOT cannot be compiled
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/224>

This code:

```
n: 1
n: not n
```

will throw this error when compiling:

```
*** Compilation Error: attempt to change type of variable: n
*** from: [integer!]
***   to: [logic!]
```

However, workaround can be used for now:

```
n: 1
n: 0 or not n
```



Comments:
--------------------------------------------------------------------------------

On 2012-07-28T04:29:11Z, PeterWAWood, commented:
<https://github.com/red/red/issues/224#issuecomment-7330463>

    It appears the compiler is determining whether to perform a logical or bitwise not depending on the order of the statement:
    
    ``` rebol
    not 1 or 2   ;; logical not
    2 or not 1   ;; bitwise not
    ```
    
    Just to note that in REBOL 'not is always a logical not and 'complement is a bitwise not (actually 1s complement).
    
    By the way, another workaround is 
    
    ``` rebol
    n: 1 
    n: as integer! not n
    ```

