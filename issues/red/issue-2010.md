
#2010: Tests "funfun12" to ""funfun15" are failing.
================================================================================
Issue is open, was reported by dockimbel and has 0 comment(s).
[status.deferred] [type.review] [type.compiler]
<https://github.com/red/red/issues/2010>

Resulting error from quick-test.log:

```
Compiling to native code...
*** Compilation Error: attempt to redefine existing function name: exec/f_ff 
*** in file: %/C/Dev/Red/tests/source/units/auto-tests/run-all-comp2.red 
*** at line: 1 
*** near: [
    f_ff: func [/local ctx saved ~local ~ff13-i] [
        ctx: (as red-context! ((as series-buffer! ctx821/value) + 1)) 
        saved: ctx/values 
        ctx/values: as pointer! [integer!] stack/arguments 
        ~local: stack/arguments 
        ~ff13-i: ~local + 1 
        _function/init-locals 2 
        stack/mark-func-body words/_body 
        stack/reset 
        stack/mark-native ~set 
        word/push-local ctx821 1 
        integer/push 2 
        word/set 
        stack/unwind 
        stack/unwind-last 
        ctx/values: saved
    ] 
    f_ff824: func [/local ctx saved] [
        ctx: (as red-context! ((as series-buffer! ctx825/value) + 1)) 
        saved: ctx/values 
        ctx/values: as pointer! [integer!] stack/arguments 
        stack/mark-func-body words/_body 
        stack/reset 
        word/get-local ctx325 1 
        stack/check-call 
        stack/unwind-last 
        ctx/values: saved
    ]
]
```



