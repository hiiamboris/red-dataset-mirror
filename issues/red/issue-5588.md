
#5588: Lit-path! with a `+` or `-` in the middle stop the path
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5588>

**Describe the bug**
A `lit-path!` with a `+` but also a `-` in the middle of it becomes active on the next paren and inteprets it

**To reproduce**
```
>> probe pt: 'table/+/(m/col)
table/+/

*** Script Error: m is unset in path m/col
```

**Platform version**
;-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 374 date: 10-Jan-2025/11:17:29 commit: ;#68f6dd532a4cd9c53fa68656805bc59390a6ab42 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
;--------------------------------------------



Comments:
--------------------------------------------------------------------------------

On 2025-02-05T13:43:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/5588#issuecomment-2636892767>

    That's just a lexing problem of stopping the path after a slash, not "interpretes the next paren".

