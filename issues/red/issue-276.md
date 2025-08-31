
#276: Characters can't be inlined
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/276>

```
Red []

#system-global [
    c: #" "
]
```

**\* Compilation Error: compiler directives are not allowed in code blocks 
**\* in file: %/users/administrator/Red/C-library/examples/test.red 
**\* at line: 1 
**\* near: [#'00000020 
    #script %../red/runtime/red.reds 
    red: context [
        #script %../red/runtime/macros.reds 
        #enum datatypes! [
            TYPE_DATATYPE 



