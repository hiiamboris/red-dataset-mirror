
#42: variable that is given a value by a cast is not recognized
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/42>

The program

```
p: as [pointer! [integer!]] 0
p + 1
```

gives the error

```
*** Compilation Error: undefined symbol: p
```



Comments:
--------------------------------------------------------------------------------

On 2011-05-20T12:47:37Z, meijeru, commented:
<https://github.com/red/red/issues/42#issuecomment-1209728>

    I was too naive: p must first be declared.

