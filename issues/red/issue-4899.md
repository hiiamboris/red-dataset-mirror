
#4899: Case returns none when last condition is matched but action is missing
================================================================================
Issue is closed, was reported by zwortex and has 12 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/4899>

**Before submitting**
 https://gitter.im/red/help?at=609d4d8d9f2c352db109513b

**Describe the bug**
In the following code the last condition is true, but there is no associated action. In such case, case returns none.

```
a: case [
    false [ "NOK" ]
    true
]
probe a ;= none
```
Initially the problem arose with the following snippet where the condition was missing.
```
a: case [
    false [ "NOK" ]
    []
]
probe a ;= none
```

Normally case returns none when they are no matched conditions at all :
```
a: case [
    false [ "NOK1" ]
    false [ "NOK2" ]
]
probe a ;= none
```

The same with no condition at all 
```
a: case []
probe a ;= none
```

**Expected behavior**
To be discussed. I would suggest a syntax error, or unset (i.e. no action to eval, therefore nothing to return). This is not a well formatted call, as if an argument was missing.

Note that R2/R3 returns true in that case.

**Platform version**
Red 0.6.4 for Windows built 13-May-2021/13:13:31


Comments:
--------------------------------------------------------------------------------

On 2021-05-14T09:02:41Z, zwortex, commented:
<https://github.com/red/red/issues/4899#issuecomment-841115215>

    Related notes and other cases in the [wiki](https://github.com/red/red/wiki/%5BNOTES%5D-Conditionals)

--------------------------------------------------------------------------------

On 2021-05-16T19:25:01Z, meijeru, commented:
<https://github.com/red/red/issues/4899#issuecomment-841864862>

    I observe that case does NOT require an action even in the before-last alternatives.
    E.g. `case [false true [1]]` does not give a syntax error

--------------------------------------------------------------------------------

On 2021-05-17T11:51:43Z, zwortex, commented:
<https://github.com/red/red/issues/4899#issuecomment-842261602>

    Case distinguishes conditions from actions by referring to their positions in the block. Not the type of the element : true could be the action returned in case of false. If the element is in an uneven position, it is a condition. If it is in an even position, it is an action. But if there is an uneven number of elements in the case block, that should enough to trigger a syntax error. And that would cover your case as well.

--------------------------------------------------------------------------------

On 2021-05-17T16:59:12Z, greggirwin, commented:
<https://github.com/red/red/issues/4899#issuecomment-842484017>

    We need to distinguish between elements and expressions. `Case`  evaluates expressions, so the number of elements (values) doesn't matter. e.g. 
    ```
    >> case [even? 1 ['nope]]
    == none
    >> case [even? 1 ['nope] 12 // 5 ['yup]]
    == yup
    ```
    And since the expressions can be dynamic, there's no way to know without evaluating them.

--------------------------------------------------------------------------------

On 2021-05-18T10:48:27Z, zwortex, commented:
<https://github.com/red/red/issues/4899#issuecomment-843064731>

    When compiling, a syntax error is raised. For instance, this script :
    
    ```
    Red []
    a: 2
    b: case [
        a == 1 [ "1" ]
        []
    ]
    probe b ;= none
    ```
    
    triggers that error :
    
    ```
    *** Compilation Error: CASE is missing a value    
    *** in file: D:\Developpements\RedTest\test.red   
    *** near: []                                      
    ```

--------------------------------------------------------------------------------

On 2024-07-01T17:22:08Z, dockimbel, commented:
<https://github.com/red/red/issues/4899#issuecomment-2200668068>

    Now an error occurs if the action part is missing.

