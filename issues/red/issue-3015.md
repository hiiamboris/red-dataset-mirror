
#3015: cannot set `err` word to any value
================================================================================
Issue is closed, was reported by 9214 and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3015>

"Fantastic beasts and where to find them":
```Red
>> abracadabra: try [1 / 0]
*** Math Error: attempt to divide by zero
*** Where: /
*** Stack:  

>> ? abracadabra
ABRACADABRA is an error! value: make error! [
    code: 400
    type: 'math
    id: 'zero-divide
    arg1: none
    arg2: none
    arg3: none
    near: none
    where: '/
    stack: -161007704
]
```
```Red
>> err: probe try [1 / 0]
make error! [
    code: 400
    type: 'math
    id: 'zero-divide
    arg1: none
    arg2: none
    arg3: none
    near: none
    where: '/
    stack: -161007692
]
*** Math Error: attempt to divide by zero
*** Where: /
*** Stack: probe  

>> ? err
ERR is a none! value: none
```


Comments:
--------------------------------------------------------------------------------

On 2017-09-04T16:01:26Z, Oldes, commented:
<https://github.com/red/red/issues/3015#issuecomment-326994105>

    Actually it's not possible to set `err` to any value:
    ```
    >> err: 1
    == 1
    >> err
    == none
    ```

--------------------------------------------------------------------------------

On 2017-09-04T16:03:46Z, 9214, commented:
<https://github.com/red/red/issues/3015#issuecomment-326994484>

    Eagle eye @Oldes !

--------------------------------------------------------------------------------

On 2017-09-04T16:05:54Z, Oldes, commented:
<https://github.com/red/red/issues/3015#issuecomment-326994834>

    It is set here https://github.com/red/red/blob/master/environment/console/engine.red#L177 using set/any which function does not detect as local.

--------------------------------------------------------------------------------

On 2017-09-04T19:08:37Z, greggirwin, commented:
<https://github.com/red/red/issues/3015#issuecomment-327016495>

    Nice catch and fix!

