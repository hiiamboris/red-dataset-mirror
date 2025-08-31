
#3522: return spec of modify action is incorrrect
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3522>

### Expected behavior
result of `modify` should have type `map!` or `file!` as per the action spec
### Actual behavior
when `modify` is used to set the `owned` property of a series within an object the result is the series
### Steps to reproduce the problem
```
>> modify o/b 'owned reduce [o 'b]
== [1 2 3]
>> reflect o/b 'owned
== make object! [
    b: [1 2 3]
]
```
### Red and platform version
```
all
```


Comments:
--------------------------------------------------------------------------------

On 2018-08-27T17:54:37Z, meijeru, commented:
<https://github.com/red/red/issues/3522#issuecomment-416311641>

    I cannot imagine which application of `modify` would result in either a `map!` or a `file!` value.

--------------------------------------------------------------------------------

On 2019-08-20T19:55:14Z, dockimbel, commented:
<https://github.com/red/red/issues/3522#issuecomment-523169965>

    The returned type constraint has been removed, as `modify` could in fact return any type.

