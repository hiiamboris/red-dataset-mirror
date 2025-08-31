
#5590: `path!` in `block!` with some single characters combinations are not lexed properly
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5590>

**Describe the bug**
A `path!` inside a `block!` with single characters inside of it are split in multiple parts, lexed in a wrong way.
(Attribution: This last has been discovered by @hiiamboris )

**To reproduce**
```
>> [=/-/=]
== [= /- /=]
```

**Expected behaviour**
```
>> [+/-/=]
== [+/-/=]
```

**Platform version**
;-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 374 date: 10-Jan-2025/11:17:29 commit: ;#68f6dd532a4cd9c53fa68656805bc59390a6ab42 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
;--------------------------------------------



Comments:
--------------------------------------------------------------------------------

On 2025-02-08T22:05:28Z, dockimbel, commented:
<https://github.com/red/red/issues/5590#issuecomment-2645960474>

    Your expected behaviour is already what you get, you should have been more careful when writing it.

--------------------------------------------------------------------------------

On 2025-02-08T22:10:01Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5590#issuecomment-2645961853>

    I have copied Boris code without testing it.
    
    This is the full code that show the error:
    
    ```
    >> [+/-/=]
    == [+/-/=]
    >> [=/-/=]
    == [= /- /=]
    ```
    
    It was not split but an unique one

