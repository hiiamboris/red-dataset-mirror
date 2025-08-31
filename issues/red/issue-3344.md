
#3344: make op! doesn't distinguish left/right argument eval rules
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/3344>

### Test script
```
o1: make op! f1: func ['x 'y] [(get x) * (get y)]
o2: make op! f2: func [ x  y] [x       * y]
o3: make op! f3: func [ x 'y] [x       * (get y)]
o4: make op! f4: func ['x  y] [(get x) * y]
o5: make op! f5: func [ x 'y] [x       * y]
o6: make op! f6: func ['x  y] [(get x) * (get y)]
a: 2 b: 3
f1 a b
f2 a b
f3 a b
f4 a b
f5 a b
f6 a b
a o1 b
a o2 b
a o3 b
a o4 b
a o5 b
a o6 b
```

### Expected behavior
`o5` and `o6` are expected to fail (just as `f5` and `f6` rightfully do)

### Actual behavior
Instead, `o5` and `o6` are doing fine, while `o3` and `o4` fail.
```
>> a o3 b
*** Script Error: get does not allow integer! for its word argument
*** Where: get
*** Stack:  

>> a o4 b
*** Script Error: * does not allow word! for its value2 argument
*** Where: *
*** Stack:  

>> a o5 b
== 6
>> a o6 b
== 6
```

It appears that op! infers the evaluation type of it's 2nd argument (literal or normal) from the 1st.
Probably related ticket https://github.com/red/red/issues/3179 (incomplete implementation of it?)
Gitter snapshot :point_up: [April 23, 2018 12:05 AM](https://gitter.im/red/bugs?at=5adcf923109bb04332ec80c9)

### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 633 date: 12-Apr-2018/10:39:17 commit: #f56b72e152d47fea33ba9e38937077cb9356d04d ]
PLATFORM: [ name: "Windows 7" OS: 'Windows arch: 'x86-64 version: 6.1.0 build: 7601 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-11-21T15:10:02Z, a-nick-fischer, commented:
<https://github.com/red/red/issues/3344#issuecomment-440698224>

    Problem still persists in the latest build:
    ```
    -----------RED & PLATFORM VERSION----------- 
    RED: [ branch: "master" tag: #v0.6.3 ahead: 1115 date: 21-Nov-2018/3:36:16 commit: #e613df39a96e7122594fc442e9ec9f2e89a6228d ]
    PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
    --------------------------------------------
    ```
    
    Pretty annoying, because it prevents some elegant styles like, for example, proper pipes:
    ```rebol
    |>: make op! function [a 'b][
        do head insert either series? b [next b][next reduce [b]] a
    ]
    
    123 |> [multiply 2] |> sqrt
    ;*** Script Error: sqrt is missing its number argument
    ;*** Where: sqrt
    ;*** Stack: sqrt
    ```
    (Well it's still possible, but with some hacky workarounds)

--------------------------------------------------------------------------------

On 2019-09-05T17:47:51Z, dockimbel, commented:
<https://github.com/red/red/issues/3344#issuecomment-528495077>

    Agreed that the semantics for quoted arguments need to be improved. Red followed some changes done in R3, but it seems that the R2 semantics were more useful.

--------------------------------------------------------------------------------

On 2023-06-26T15:30:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/3344#issuecomment-1607725566>

    Lit/get-arg support is [not planned](https://github.com/red/red/issues/5341#issuecomment-1607626539) for left operand anymore, so this issue is no longer relevant.

