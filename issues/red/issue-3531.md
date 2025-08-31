
#3531: class-of object is not inherited when deriving new object
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
<https://github.com/red/red/issues/3531>

### Expected behavior

If an `object!` value is defined using `make <object-value> <spec>`, the class of the new object should be equal to the class of the original object
### Actual behavior
The class of the new object is different
### Steps to reproduce the problem
```
>> o1: make object! [a: 1]
== make object! [
    a: 1
]
>> class-of o1
== 1000006
>> o2: make o1 [b: 2]
== make object! [
    a: 1
    b: 2
]
>> class-of o2
== 1000007
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

On 2018-09-06T10:03:58Z, meijeru, commented:
<https://github.com/red/red/issues/3531#issuecomment-419038385>

    I have now discovered that the class is only inherited if no new fields are added. Therefore this issue can be closed, unless it is felt that inheritance of class *would* be useful also in the case of extension (addition of new fields).

--------------------------------------------------------------------------------

On 2018-09-06T17:10:40Z, greggirwin, commented:
<https://github.com/red/red/issues/3531#issuecomment-419171262>

    I believe the design rationale here is that for objects to be of the same "class", they must be compatible. The new object inherits from the prototype, so is compatible, but it doesn't work the other way around. So your proto object would be of the same class as the new one, but be missing values.
    
    Good to note in docs.

--------------------------------------------------------------------------------

On 2018-09-06T19:54:24Z, meijeru, commented:
<https://github.com/red/red/issues/3531#issuecomment-419220636>

    Have noted in the Specs document, so this can be closed.
    "If there are no new fields, the class property of the new object is copied from the prototype; the new object is then said to be derived from the prototype. Otherwise, the new object receives a new class value."

--------------------------------------------------------------------------------

On 2018-09-06T20:23:57Z, greggirwin, commented:
<https://github.com/red/red/issues/3531#issuecomment-419228912>

    Thanks!

