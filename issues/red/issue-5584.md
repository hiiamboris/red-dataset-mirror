
#5584: Locals used as refinements do not fire error
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5584>

**Describe the bug**
Function accepts locals as refinements without generating error

**To reproduce**
```
>> f: func [/local y][probe 22]
== func [/local y][probe 22]
>> f/y
22
== 22
```

Discussed [here](https://matrix.to/#/!mjbZGzLqlsqlDLaQVP:gitter.im/$PcUBkjsRjCxWazAp5nWTeSZ8HoRf4H9dh8Qq7Bxpagk?via=gitter.im&via=matrix.org&via=tchncs.de): 

**Platform version**
;-----------RED & PLATFORM VERSION-----------
;RED: [ branch: "master" tag: #v0.6.5 ahead: 374 date: 10-Jan-2025/11:17:29 commit: #68f6dd532a4cd9c53fa68656805bc59390a6ab42 ]
;PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]



