
#2248: Problem returning from parse
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/2248>

Code:

```
Red []

f: function [s [string!]][
    result: copy ""
    parse s [
        copy result "a"
        |
        copy result "b" (return result)     
    ]
    return result
]

print f "a"
print f "b"
x: f "a"
?? x
x: f "b"
print "Compiled doesn't get this far."
?? x
```

Result when interpreted (expected):

```
a
b
x: "a"
Compiled doesn't get this far.
x: "b"
```

Result when compiled and run:

```
a
b
x: "a"

*** Runtime Error 1: access violation
*** at: 004264FEh
```



Comments:
--------------------------------------------------------------------------------

On 2017-03-02T05:13:52Z, dockimbel, commented:
<https://github.com/red/red/issues/2248#issuecomment-283558491>

    It seems to work fine now:
    ```
    C:\Dev\Red>bug
    a
    b
    x: "a"
    Compiled doesn't get this far.
    x: "b"
    ```
    
    I remember fixing an issue with exception handling recently, so it might have fixed this one too in the process.

