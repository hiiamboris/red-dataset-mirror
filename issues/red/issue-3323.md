
#3323: MOVE gives wrong result on vectors
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[type.alien]
<https://github.com/red/red/issues/3323>


```
a: make vector! [integer! 16 [456 789]]
b: make vector! [integer! 16 [0 0]]
move a b
```

### Expected behavior
```
 b
== make vector! [integer! 16 [456 789 0 0]]
```
### Actual behavior
```
 b
== make vector! [integer! 16 [456 0 0]]
```
### Red and platform version
```
Red 0.6.3 for Windows built 10-Apr-2018/13:13:52+08:00
```


Comments:
--------------------------------------------------------------------------------

On 2018-04-11T16:32:11Z, greggirwin, commented:
<https://github.com/red/red/issues/3323#issuecomment-380515441>

    I saw a comment from @Toomasv on this and agree that this looks like the behavior was originally correct.

