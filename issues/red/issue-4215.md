
#4215: [R/S] `tuple/make-rgba` makes a reversed tuple
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[type.bug] [status.contribution]
<https://github.com/red/red/issues/4215>

**Describe the bug**

Compile(-r) & Run:
```
Red []

t: 0.0.0
r: routine [t [tuple!] return: [tuple!]] [
	tuple/make-rgba as cell! t 1 2 3 4
	t
]
probe r t
```
Output is: `4.3.2.1`, which is A B G R, while from the spec of `make-rgba` I expect R G B A:
```
make-rgba: func [       
    slot    [red-value!]
    r       [integer!]  
    g       [integer!]  
    b       [integer!]  
    a       [integer!]  
    return: [red-tuple!]
```

**Expected behavior**

`1.2.3.4`

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Dec-2019/1:01:27+03:00

```



Comments:
--------------------------------------------------------------------------------

On 2020-01-01T21:21:28Z, dockimbel, commented:
<https://github.com/red/red/issues/4215#issuecomment-570084476>

    Can't explain that one, either it was never used nor tested, or the use-case for that was expecting the reverse order so that this issue was not detected... 

