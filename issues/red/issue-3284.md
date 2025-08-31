
#3284: compiler misinterprets object function call as an object path
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.compiler]
<https://github.com/red/red/issues/3284>

snippet here ;)
```
Red []

c: context [ o: does [context [a: 1]] ]

make c/o []				;-- 1
x: make (c/o) []	;-- 2
x: make c/o []		;-- 3
```
### Expected behavior
successful compilation (interpreter works fine)
### Actual behavior
```
Compiling D:\usr\redtest\2\ticket9.red ...
...using libRedRT built on 27-Mar-2018/3:35:35+3:00
*** Red Compiler Internal Error: Script Error : comp-context expected proto argument of type: object
*** Where: comp-set-word
*** Near:  [comp-context/with/extend original proto]
```
### Steps to reproduce the problem
last line (;-- 3) is the killing one, comment it out and no problem
### Red version and build date, operating system with version.
```
>> system/build/config/build-basename
== %gui-console-2017-8-3-49893
```
(stable 0.6.3 is affected too)
OS: win7 x64 v6.1.7601


