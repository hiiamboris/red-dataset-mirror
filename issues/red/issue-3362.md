
#3362: Strange behaviour of CONTEXT and OBJECT with exit in spec-block
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[type.bug]
<https://github.com/red/red/issues/3362>

### Expected behavior

`make object! [x: 1 exit]` when used outside a function gives an error saying `return or exit not in function`
`context` and `object` are (equivalent) functions that contain a call of `make object!`; therefore a `return` or `exit`  in the spec block is not caught this way; in fact `return` is processed "normally" yielding the value following it as return value of the function `context` resp. `object`; however, `exit` in the spec block should yield the `unset!` value as a result of the `context` or `object` function, and it does not seem to do so;
Compare:
```
>> f: does [exit]
== func [][exit]
>> type? f
== unset!
>> 
```


### Actual behavior

```
>> o: context [exit]
== [exit]
>> type? o
== console
```

### Steps to reproduce the problem

Execute the above code
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 669 date: 27-Apr-2018/10:07:23 commit: #4c36108655f3410124f8539543cbd4bc4525fed1 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 16299 ]
--------------------------------------------

```


Comments:
--------------------------------------------------------------------------------

On 2019-01-06T12:52:33Z, meijeru, commented:
<https://github.com/red/red/issues/3362#issuecomment-451739337>

    In the meantime, behaviour has become different:
    ```
    >> o: context [exit]
    *** Script Error: unset needs a value
    *** Where: context
    *** Stack: context  
    ```
    and even more curious:
    ```
    >> spec: [exit]
    == [exit]
    >> context spec
    *** crash ***
    ```

