
#5581: Extend on a MAP does not check odd arguments
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/5581>

**Describe the bug**
`Extend` on map! does not check odd arguments, [here](https://matrix.to/#/!mjbZGzLqlsqlDLaQVP:gitter.im/$1odFEyuSSEblz3fGNQe7g4NH0u4SMTy0yYklp12ttz8?via=gitter.im&via=matrix.org&via=tchncs.de) is the discussion

**To reproduce**
```
>> extend m: #[a: 0] [a 22 b 333 c]
== #[
    a: 22
    b: 333
]
```

Instead:

```
>> make map! [a 22 b]
*** Script Error: invalid argument: [a 22 b]
*** Where: make
*** Near : make map! [a 22 b]
*** Stack:  
```

**Platform version**

;-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 211 date: 8-Nov-2024/21:54:12 commit: #fc80690c2fcc855ccbb960b4c42465a29cef44b9 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
;--------------------------------------------





