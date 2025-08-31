
#3321: rounding of negative axis to 1/-1(int) is bonkers
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3321>

### Expected behavior
this one is right:
```
>> round/to -1.1 1.0
== -1.0
>> round/to -1.9 1.0
== -2.0
>> round/to -2.1 1.0
== -2.0
```
even this is right:
```
>> round/to -10.0 -2
== -10
>> round/to -10.0 -5
== -10
>> round/to -10.0 -10
== -10
```
### Actual behavior
this one isn't:
```
>> round/to -0.9 1
== 0
>> round/to -1.1 1
== 0
>> round/to -1.9 1
== -1
>> round/to -2.1 1
== -1
>> round/to -10.0 1
== -9
>> round/to -10.0 -1
== -9
```
### Red and platform version
```
Red 0.6.3 for Windows built 6-Apr-2018/16:49:30+03:00 commit #f53f907
and the stable 0.6.3
win7 x64 6.1.7601
```


Comments:
--------------------------------------------------------------------------------

On 2018-04-08T13:54:05Z, nedzadarek, commented:
<https://github.com/red/red/issues/3321#issuecomment-379552426>

    @hiiamboris Can you confirm this:
    It seems that problem exists when first argument is `float!` and second argument is `integer!` with value  `-1`
    This works:
    ```
    round/to -3 -1
    ; == -3
    round/to -3.0 -1.0
    ; == -3.0
    round/to -3 -1.0
    ; == -3.0
    ```
    This doesn't works:
    ```
    round/to -3.0 -1
    ; == -2
    ```
    I'm on:
    ```
    >> about
    Red for Windows version 0.6.3 built 26-Mar-2018/1:14:22+02:00
    ```
    ```win 8.1 x64```

--------------------------------------------------------------------------------

On 2018-04-08T18:23:07Z, greggirwin, commented:
<https://github.com/red/red/issues/3321#issuecomment-379570840>

    Chat for this starts at https://gitter.im/red/bugs?at=5ac8b11f6d7e07082bcb3ef5 
    
    https://github.com/red/red/blob/master/runtime/datatypes/float.reds#L859
    
    @BeardPower's link to where floats are scaled by integers: https://gitter.im/red/bugs?at=5ac8c06a5f188ccc153d8b0a

--------------------------------------------------------------------------------

On 2018-04-10T18:21:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/3321#issuecomment-380199698>

    @nedzadarek affirmative

--------------------------------------------------------------------------------

On 2018-04-21T12:07:47Z, qtxie, commented:
<https://github.com/red/red/issues/3321#issuecomment-383290095>

    Fixed by commit 002dbd4

