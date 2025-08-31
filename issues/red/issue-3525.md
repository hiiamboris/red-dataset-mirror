
#3525: Bracketed constructs are not treated equally by lexer as regards whitespace around them
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3525>

### Expected behavior
All bracketed constructs `[] #[] () #() {} #{} "" <>` should be treated equally by the lexer as regards the need for whitespace around them.
### Actual behavior
`#[] #() #{}` and `<>` are treated differently from the others
The presence of the `#` could justify that difference, but that does not explain `<>`...
### Steps to reproduce the problem
```
>> load "1#[true]"
*** Syntax Error: invalid integer! at "1#[true]"
>> load "a#[true]"
== [a true]
>> load "1#{}"
*** Syntax Error: invalid integer! at "1#{}"
>> load "a#{}"
== [a #{}]
>> load "1<>"
*** Syntax Error: invalid integer! at "1<>"
>> load "a<>"
== [a <>]
>> load "1[]"
== [1 []]
>> load "a[]"
== [a []]
>> load "1()"
== [1 ()]
>> load "a()"
== [a ()]
>> load "1{}"
== [1 ""]
>> load "a{}"
== [a ""]
>> load {1""}
== [1 ""]
>> load {a""}
== [a ""]
```
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 845 date: 20-Aug-2018/0:39:55 commit: #318673b7ae1c33b5852087f80905f2293ce5bd3f ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2019-09-06T15:52:02Z, dockimbel, commented:
<https://github.com/red/red/issues/3525#issuecomment-528909981>

    * `load "1<>"` => can be fixed.
    * `#{}` => we allow prefixes for binaries (ex: `2#{11110000} == #{F0}`)
    * `#()` and `#{}` for sake of consistency with above rule, we don't allow at head sticky values not ending with a delimiter.

