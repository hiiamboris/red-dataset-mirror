
#3251: SET on object breaks on-change*
================================================================================
Issue is closed, was reported by endo64 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3251>

### Expected behavior

`set obj none` should not set `on-change*` to `none` or any other given value.

### Actual behavior

Error occurs when `on-change*` is not in expected form.

### Steps to reproduce the problem

```
>> o: object [a: 1 on-change*: func [w o n] []]
>> set o none ; or any value
*** Script Error: invalid argument: none

>> o/a: 2
*** Script Error: invalid argument: none

>> body-of o
== [a: 2 on-change*: none]  ;<<<
```

Please see also #2919

### Red version and build date, operating system with version.

Red for Windows version 0.6.3 built 11-Mar-2018/0:01:47+03:00



