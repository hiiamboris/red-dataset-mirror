
#3540: REACT?/TARGET recognizes target fields if they were linked with IS, but not with REACT
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.dismissed] [type.review]
<https://github.com/red/red/issues/3540>

### Expected behavior
`react?/target` returns the last applied reactive expression for a given target in both cases.

### Actual behavior
Only targets in reactive relationship created with `is` are recognized.

### Steps to reproduce the problem
```red
>> foo: make reactor! [a: 1 b: 2]
== make object! [
    a: 1
    b: 2
]
>> bar: object [x: 0]
== make object! [
    x: 0
]
>> react [bar/x: foo/a + foo/b]
== [bar/x: foo/a + foo/b]
>> react?/target bar 'x
== none

>> bar: object [x: is [foo/a + foo/b]]
== make object! [
    x: 3
]
>> react?/target bar 'x
== [foo/a + foo/b]
```
Perhaps this is a subtlety of `react` vs. `is` of which I'm not aware.

### Red and platform version
```
Red 0.6.3 for Windows built 4-Sep-2018/12:57:23+05:00 commit #6115b00
```


Comments:
--------------------------------------------------------------------------------

On 2019-09-06T16:42:00Z, dockimbel, commented:
<https://github.com/red/red/issues/3540#issuecomment-528927107>

    Yes, it is limited to reactions created by `is` because that the only case where the target can be accurately identified. In a general reaction created with `react`, it's arbitrary code, so no amount of static analysis can help know accurately what the target is.
    
    See the reactions table:
    ```
    >> dump-reactions
    1
    :---  Source: object [a b]
       Field: a
      Action: [bar/x: foo/a + foo/b]
    2
    :---  Source: object [a b]
       Field: b
      Action: [bar/x: foo/a + foo/b]
    3
    :---  Source: object [a b]
       Field: a
      Action: [foo/a + foo/b]
      Target: x
    4
    :---  Source: object [a b]
       Field: b
      Action: [foo/a + foo/b]
      Target: x
    >> 
    ```
    The "Target" field is set only for reactions created with `is`.
    
    Maybe one way to improve that would be to set that field in that table when a reaction occurs and changes the value of a reactor's field... Though implementing that without having object's event low-level code in R/S calling into reactivity high-level framework in Red seems difficult. Though, a user-customized reactor object could do that easily (though paying a performance overhead cost).

