
#539: #include from #system-global broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/539>

Tries to #include from the compiler root instead of the script directory:

```
Red []

#system-global [
    #include %../extension.reds
]
```

-=== Red Compiler 0.3.3 ===- 

Compiling /home/kaj/Red/REBOL-3/examples/test.red ...
...compilation time:     262 ms

Compiling to native code...
**\* Loading Error: file access error: make object! [
    code: 500
    type: 'access
    id: 'cannot-open
    arg1: "/home/kaj/Red/Red/extension.reds"
    arg2: none
    arg3: none
    near: [read/binary input]
    where: 'process
] 
**\* in file: in-memory 
**\* at line: 1



