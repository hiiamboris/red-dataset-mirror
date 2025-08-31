
#537: Internal Red context leaks into user contexts
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/537>

```
Red []

#system-global [
    series!: alias struct! [i [integer!]]
    s!: alias struct! [s [series!]]
]
```

-=== Red Compiler 0.3.3 ===- 

Compiling to native code...
**\* Compilation Error: invalid struct syntax: [s [series-buffer!]] 
**\* at line: 1 
**\* near: [alias struct! [s [series-buffer!]] 
    red/init 
    with red [
        exec: context [comment "Symbols" 
            ~datatype!: word/load "datatype!"
...

My series! definition is ignored and the internal Red runtime definition is used instead. This happens since merging the encap branch. It must have something to do with context priority. Wrapping my own code in a context doesn't help.



