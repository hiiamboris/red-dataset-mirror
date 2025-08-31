
#5289: Style using 'password is overridden when 'all-over is used on the field
================================================================================
Issue is closed, was reported by mikeyaunish and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5289>

**Describe the bug**
Style using 'password is overridden when 'all-over is used on the field

**To reproduce**
Steps to reproduce the behavior:
1. Run this: 
```view [
    style password-field: field loose password
    f1: password-field "hello"
    f2: password-field "goodbye" all-over 
]
```
3. Notice second field isn't 'password protected

**Expected behavior**
Styles utilizing the 'password facet should be carried through to all styled objects.
Or - if this is a security related issue, documentation about how the 'password facet
is inherited should be described.

**Screenshots**
![password-issue](https://user-images.githubusercontent.com/29316525/221886823-8996d06e-4dfd-4b10-b7cc-942e2b9ff085.gif)


**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4648 date: 22-Feb-2023/4:28:04 commit: #8bac102834adef06a368d96d246676908e1b0ea2 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------
```


