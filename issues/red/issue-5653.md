# Issue #5653: [RS] Casting `byte!` to `integer!` doesn't work correctly
<https://github.com/red/red/issues/5653>

**Describe the bug**
Casting `byte!` to `integer!` results in unexpected number.

**To reproduce**
```red
Red/System []

decode-funcs: as ptr-ptr! allocate 100

t: decode-funcs + 0
t/value: null ; ok

b: #"^(00)"
i: as-integer b
t: decode-funcs + i
t/value: null ; ok

t: decode-funcs + (as-integer #"^(00)")
?? t ; t: 03011588
t/value: null ; ok

t: decode-funcs + (as-integer b)
?? t ; t: 0F056988
t/value: null ; Runtime Error 1: access violation

; ========== some bonus errors ==========

; decode-funcs/136/value: 1 ; Compiler Internal Error: Script Error : Expected one of: word! - not: integer! 
; decode-funcs/136/value: t: 1 ; Compiler Internal Error: Script Error : comp-call expected name argument of type: word 
```

**Expected behavior**
0 `byte!` correctly converted to 0 `integer!`

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.6 ahead: 0 date: 19-Mar-2025/13:09:25 commit: #6942c7a021253150c3e3cf90428305892340db03 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------
```



## dockimbel on 2025-10-11T07:40:02Z
Good catch!


