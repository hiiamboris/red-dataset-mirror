
#3534: runtime error 101 on TRIM/WITH called with BINARY! as a second argument
================================================================================
Issue is closed, was reported by 9214 and has 6 comment(s).
<https://github.com/red/red/issues/3534>

### Expected behavior
`trim/with <binary!> <binary!>` removes specified bytes, `trim/with <binary!> <string!>` either treats characters in `string!` as bytes (and vice versa for `trim/with <string!> <binary!>`), or raises an error.

### Actual behavior
```
*** Runtime Error 101: no value matched in SWITCH
*** at: 00431869h
```

[Culprit](https://github.com/red/red/blob/master/runtime/datatypes/string.reds#L2342).

### Steps to reproduce the problem
```red
trim/with {} #{}
```

### Red and platform version
Latest.


Comments:
--------------------------------------------------------------------------------

On 2018-09-15T23:44:03Z, endo64, commented:
<https://github.com/red/red/issues/3534#issuecomment-421655267>

    It looks like adding `TYPE_BINARY` just before `TYPE_STRING` as you pointed solves all the issues:
    
    ```
    >> trim/with "aA" #{6141}
    == ""
    >> trim/with #{6141} "aA"
    == #{}
    >> trim/with #{6141} #"a"
    == #{41}
    >> trim/with #{6141} #{41}
    == #{61}
    ```

--------------------------------------------------------------------------------

On 2018-09-21T17:24:40Z, 9214, commented:
<https://github.com/red/red/issues/3534#issuecomment-423612360>

    @greggirwin I believe this issue can be closed without adding any tags to it?

--------------------------------------------------------------------------------

On 2018-09-27T23:11:23Z, 9214, commented:
<https://github.com/red/red/issues/3534#issuecomment-425270849>

    Silence! :^/

