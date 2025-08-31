
#2621: WISH: GETting an error value should "disarm" it
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[type.wish] [status.reviewed]
<https://github.com/red/red/issues/2621>

Evaluating a word that refers to a function applies the function. To prevent that, one uses a get-word.
Evaluating a word that is unset, raises an error. To prevent that, one uses a get-word.
Therefore, it would be consistent to have the rule:
Evaluating a word that refers to an error, raises the error. To prevent that, use a get-word.
```
== func [ ]["I am applied"]
>> f
== "I am applied"
>> :f
== func [ ]["I am applied"]
>> a: ()
*** Script Error: a: needs a value
*** Where: a
>> a
*** Script Error: a has no value
*** Where: catch
>> :a      :: does nothing - if probed, prints "unset"
>> e: try [1 / 0]
*** Math Error: attempt to divide by zero
*** Where: /
>> e
*** Math Error: attempt to divide by zero
*** Where: /
>> :e             ;; this would be desirable, but it does the same as e
make error! [
    code: none
    type: 'math
    id: 'zero-divide
    arg1: none
    arg2: none
    arg3: none
    near: none
    where: '/
    stack: 43811648
]
>>
```



Comments:
--------------------------------------------------------------------------------

On 2017-05-25T11:21:37Z, dockimbel, commented:
<https://github.com/red/red/issues/2621#issuecomment-303987092>

    It is disarmed already, it is just that the console will automatically FORM an error if it's the last value from a command-line:
    ```
    >> e: try [1 / 0] none
    == none
    >> e none
    == none
    >> probe e none
    make error! [
        code: none
        type: 'math
        id: 'zero-divide
        arg1: none
        arg2: none
        arg3: none
        near: none
        where: '/
        stack: 37520192
    ]
    == none
    ```

--------------------------------------------------------------------------------

On 2017-05-25T12:17:46Z, meijeru, commented:
<https://github.com/red/red/issues/2621#issuecomment-303996674>

    If it's disarmed already, no need for the wish then! For me it can be closed.

