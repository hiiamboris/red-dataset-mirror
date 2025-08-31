
#101: Another curious error
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/101>

I was trying to find out if a function's address could be used in addition

```
f: func [ ][ ] printf 1 + :f
*** Compiler Internal Error: Script Error : emit-math-op expected b argument of type: word
*** Where: emit-operation
*** Near:  [forall args [
cast: preprocess-argument/no-last args
```



Comments:
--------------------------------------------------------------------------------

On 2011-06-23T20:52:21Z, meijeru, commented:
<https://github.com/red/red/issues/101#issuecomment-1428309>

    Similarly, it does not help to assign the function's address first
    
    ```
    f: func [ ][ ] s: :f printf 1 + s
    *** Compiler Internal Error: User Error : store-global unexpected type!
    ```

--------------------------------------------------------------------------------

On 2011-06-23T21:25:56Z, dockimbel, commented:
<https://github.com/red/red/issues/101#issuecomment-1428556>

    The first one is caused by a regression after this commit: [39aa2267](https://github.com/dockimbel/Red/commit/39aa2267bab233518e6a22c62cc3201bca18918b). 
    The second one is a missing check in the assignment processing code.

--------------------------------------------------------------------------------

On 2011-06-26T13:29:14Z, dockimbel, commented:
<https://github.com/red/red/issues/101#issuecomment-1440884>

    Both cases now raise adequate compilation error.
    
    Tested OK.

