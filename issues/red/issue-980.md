
#980: Compiler crash on SETting global function from named context
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/980>

#971 has worsened into a compiler crash:

```
Red []

c: context [
    set 'f does []
]

f
```

```
Compiling to native code...
*** Compilation Error: return type missing in function: red/stack/unwind 
*** at line: 1 
*** near: []
```



