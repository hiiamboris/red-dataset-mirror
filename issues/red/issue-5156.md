
#5156: `percent!` type is not allowed
================================================================================
Issue is closed, was reported by ALANVF and has 2 comment(s).
[status.built] [type.bug] [test.written]
<https://github.com/red/red/issues/5156>

**Describe the bug**
[Block comparison](https://github.com/red/red/blob/master/runtime/datatypes/block.reds#L614) doesn't implement `percent!` logic. This behavior could probably be applied to `time!` and `char!` values as well in the future, as well as all string-based types.

**To reproduce**
```
>> [0.01] = [1%]
== false
```

**Expected behavior**
```
>> [0.01] = [1%]
== true
```


Comments:
--------------------------------------------------------------------------------

On 2022-07-02T07:42:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/5156#issuecomment-1172854853>

    dupe of https://github.com/red/red/issues/4456

