
#4550: Set-paths accept unset values silently
================================================================================
Issue is open, was reported by hiiamboris and has 10 comment(s).
[type.review]
<https://github.com/red/red/issues/4550>

**Describe the bug**

```
>> a: object [b: 1]
>> a/b: ()
>>
```
This contrasts with R2's set-paths and `set` native:
```
>> set 'a/b ()
*** Script Error: a/b needs a value
*** Where: set
*** Stack:  
```

**Expected behavior**

An error that `a/b` requires a value.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-Jun-2020/20:24:25+03:00 commit #4d864b1
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-25T12:25:11Z, meijeru, commented:
<https://github.com/red/red/issues/4550#issuecomment-649508863>

    There is also a difference between object!, and map! or block!
    ```
    >> a: make object! [b: 1]
    == make object! [
        b: 1
    ]
    >> a/b: ()
    >> a/b
    *** Script Error: a/b has no value
    >> a: make map! [b: 1]
    == #(
        b: 1
    )
    >> a/b: ()
    >> a/b
    >>
    ```
    block! behaves the same as map!, namely no error on selection by path

--------------------------------------------------------------------------------

On 2020-08-03T12:56:32Z, 9214, commented:
<https://github.com/red/red/issues/4550#issuecomment-668007279>

    I propose that `path!`s always error out if they select `unset`, regardless of the addressed container value; on the other hand, `get-path!`s should return `unset` as-is. This is consistent with how `word!`s and `get-word!`s behave.
    ```red
    >> abracadabra
    *** Script Error: abracadabra has no value
    *** Where: catch
    *** Stack:  
    
    >> :abracadabra
    >> 
    ```

--------------------------------------------------------------------------------

On 2020-08-05T12:49:52Z, 9214, commented:
<https://github.com/red/red/issues/4550#issuecomment-669174007>

    And then there are `select` and `put` as functional `path!` counterparts:
    ```red
    >> select reduce ['foo ()] 'foo
    >> put [foo] 'foo ()
    >> put reduce [()] () 'foo
    *** Script Error: put does not allow unset! for its key argument
    *** Where: put
    *** Stack:  
    ```
    This IMO should remain as-is since they have always "neutralized" active values and acted like `get-path!` equivalents.

--------------------------------------------------------------------------------

On 2020-08-11T12:41:40Z, 9214, commented:
<https://github.com/red/red/issues/4550#issuecomment-671922724>

    Welp.
    ```red
    >> foo: object [bar: none]
    == make object! [
        bar: none
    ]
    >> foo/bar: ()
    >> get/any 'foo/bar
    *** Script Error: foo/bar has no value
    *** Where: get
    *** Stack:  
    ```

--------------------------------------------------------------------------------

On 2020-08-11T13:10:47Z, 9214, commented:
<https://github.com/red/red/issues/4550#issuecomment-671937637>

    On a quick look, `object!` is problematic because `set` and `get` rely on its `eval-path` action, which handles `unset` cases internally.
    
    https://github.com/red/red/blob/494b4020e705044ab21855403078e26d41320fd7/runtime/natives.reds#L603-L608
    
    https://github.com/red/red/blob/494b4020e705044ab21855403078e26d41320fd7/runtime/interpreter.reds#L711
    
    https://github.com/red/red/blob/494b4020e705044ab21855403078e26d41320fd7/runtime/datatypes/object.reds#L1188-L1193
    So, you cannot `get/any 'foo/bar` because `foo/bar` is `eval-path`ed, and it thinks that you're trying to access `foo/bar` as-is, without `get/any`. But if you remove this `unset` handling, then `foo/bar` will return `unset` instead of erroring.
    
    The rest of the datatypes that can be "pathed" into probably have the same problem.
    
    Also: https://github.com/red/red/issues/4448.

