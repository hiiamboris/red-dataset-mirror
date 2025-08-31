
#5589: A `++` in the middle if a lit-path! in not interpreted correctly
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5589>

**Describe the bug**
Two consecutive `+` in a `lit-path!` causes an error!

**To reproduce**
```
probe pt: 'table/++/(m/col)

*** Syntax Error: (line 48) invalid path at 'table/++/(m/col)
```

**Platform version**
;-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 374 date: 10-Jan-2025/11:17:29 commit: ;#68f6dd532a4cd9c53fa68656805bc59390a6ab42 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
;--------------------------------------------



