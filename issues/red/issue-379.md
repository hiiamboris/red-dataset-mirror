
#379: WITH misses #import
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/379>

Probably a regression from #348:

```
Red/System []

c: context [
    #import [LIBC-file cdecl [
        print-error: "perror" [  ; Print error to stderr.
            string      [c-string!]
        ]
    ]]
]
c/print-error "."
with c [
    print-error "!"
]
```

-= Red/System Compiler =- 
Compiling /home/kaj/Red/SQLite/examples/test.reds ...
**\* Compilation Error: undefined symbol: print-error 
**\* at line: 12 
**\* near: [
    print-error "!"
]



