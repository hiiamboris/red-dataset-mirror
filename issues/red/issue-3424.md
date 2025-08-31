
#3424: assignment to pair component is not type-checked
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
<https://github.com/red/red/issues/3424>

### Expected behavior
If `p` is a `pair!` value, `p/1: <value>` should give an error if `<value>` is not of `integer!` type
### Actual behavior
```
>> p: 1x2
>> p/1: 1.0
== 0
>> p
== 0x2
```
### Steps to reproduce the problem
Any code similar to the above with a non-integer value.
### Red and platform version
```
all
```


Comments:
--------------------------------------------------------------------------------

On 2018-06-14T13:02:50Z, meijeru, commented:
<https://github.com/red/red/issues/3424#issuecomment-397287663>

    Similarly for tuple! and image!

--------------------------------------------------------------------------------

On 2019-01-03T19:00:06Z, meijeru, commented:
<https://github.com/red/red/issues/3424#issuecomment-451242774>

    Can now be closed.

