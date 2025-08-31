
#3358: Parses' any with string causes infinite loop
================================================================================
Issue is closed, was reported by nedzadarek and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3358>

### Expected behavior
It should returns true.
### Actual behavior
Infinite loop.
### Steps to reproduce the problem
`parse "foo" [any "" "foo"] `
but when you put string into block it won't cause infinite loop:
`parse "foo" [any [""] "foo"]`
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 654 date: 22-Apr-2018/3:07:51 commit: #f28db3b0886fcdf53c7ee9face81d874126a1f21 ]
PLATFORM: [ name: "Windows 8" OS: 'Windows arch: 'x86-64 version: 6.2.0 build: 9200 ]
--------------------------------------------
```
```
Red for Windows version 0.6.3 built 26-Mar-2018/1:14:22+02:00
win 8.1
```

[Red/bug room](https://gitter.im/red/bugs?at=5ae5a1bc109bb04332124341)


