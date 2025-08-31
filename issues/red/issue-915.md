
#915: Compiled object! can't execute function inside
================================================================================
Issue is closed, was reported by WayneCui and has 6 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/915>

For _objects_ branch compiler:

```
Red []

person: make object! [
    name: "X"
    new: func [ n ][
        make self [
            name: n
        ]
    ]
    f: func [][ print 1]
    g: func [][2]
]

probe person/name                    ;"X".This is the right behavior.
probe type? Bob: person/new "Bob"    ;output function!   should be object!
person/f                             ;do nothing, should print 1
probe person/g                       ;output func[][2], should be 2
```



Comments:
--------------------------------------------------------------------------------

On 2014-09-08T03:17:50Z, dockimbel, commented:
<https://github.com/red/red/issues/915#issuecomment-54773138>

    This is the output I get in objects branch when running your code (testing on Windows 7):
    
    ```
    "X"
    object!
    1
    2
    ```

--------------------------------------------------------------------------------

On 2014-09-08T07:25:18Z, WayneCui, commented:
<https://github.com/red/red/issues/915#issuecomment-54784327>

    You are right! I retested the code above and got the same output as yours. There must be something wrong with my working. Maybe it was too late last night! :-/ Anyway, you can close this issue. 

--------------------------------------------------------------------------------

On 2014-09-08T09:44:00Z, dockimbel, commented:
<https://github.com/red/red/issues/915#issuecomment-54796443>

    Ok, thanks.

