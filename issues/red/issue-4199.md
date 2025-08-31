
#4199: [Parse] REMOVE does not allow removal up to ensuing position
================================================================================
Issue is closed, was reported by 9214 and has 10 comment(s).
<https://github.com/red/red/issues/4199>

**Describe the bug**

`remove` and `change` rules can accept input position and remove/change value from current position up to it.

* `change` works both ways: it can change from early position up to current one (e.g. from head to middle) or from current one up to ensuing position (e.g. from middle to tail).
* `remove` supports only the former way.

**To reproduce**

`change`:
```red
>> t: tail h: [a b c]
== []
>> parse h [change t [1 2 3]]
== true
>> h
== [1 2 3]

>> t: tail h: [a b c]
== []
>> parse h [to end change h [1 2 3]]
== true
>> h
== [1 2 3]
```
`remove`:
```red
>> t: tail h: [a b c]
== []
>> parse h [remove t]
== true
>> t
== []
>> h
== [a b c]

>> parse h [to end remove h]
== true
>> h
== []
```


**Expected behavior**

`remove` should be consistent with `change` and support both modes of operation.

**Platform version**

The latest build, all platforms.



Comments:
--------------------------------------------------------------------------------

On 2019-12-21T18:21:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/4199#issuecomment-568201308>

    Could be related to [/part inconsistencies](https://github.com/red/red/issues/4106#issuecomment-546711381) ?

--------------------------------------------------------------------------------

On 2019-12-21T18:25:39Z, greggirwin, commented:
<https://github.com/red/red/issues/4199#issuecomment-568201547>

    Testing, to write docs, turns up all kinds of interesting details. 

--------------------------------------------------------------------------------

On 2020-03-18T14:32:58Z, 9214, commented:
<https://github.com/red/red/issues/4199#issuecomment-600657482>

    The issue is more general:
    ```red
    >> remove/part tail s: [a b c] s s
    == [a b c]
    >> remove/part tail s: [a b c] -3 s
    == [a b c]
    ```
    
    The culprit:
    https://github.com/red/red/blob/101a64f3ef84f0376431bace08cc4547437d6008/runtime/datatypes/series.reds#L833

--------------------------------------------------------------------------------

On 2020-03-18T22:47:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/4199#issuecomment-600896721>

    https://github.com/red/red/issues/4106#issuecomment-546711381

--------------------------------------------------------------------------------

On 2020-07-30T18:06:55Z, 9214, commented:
<https://github.com/red/red/issues/4199#issuecomment-666570998>

    Closing this as a dupe of #4106. Parse tests should be extended anyway once it's addressed, methinks.

