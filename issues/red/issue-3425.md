
#3425: bitset components can be set to 0 or 1, but not tested on those values
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.dismissed] [type.wish]
<https://github.com/red/red/issues/3425>

### Expected behavior
if `b` is a bitset value, `b/0: 1` is equivalent to `b/0: true`; thus one could expect that `b/0 = 1` would be interpreted as `b/0 = true` i.e. `true`
### Actual behavior
```
>> b: charset ""
== make bitset! #{00}
>> b/0
== false
>> b/0: 1
== 1
>> b/0
== true
>> b/0 = 1
== false
```

### Steps to reproduce the problem`

Execute above code
### Red and platform version
```
all
```


Comments:
--------------------------------------------------------------------------------

On 2018-06-22T02:50:16Z, greggirwin, commented:
<https://github.com/red/red/issues/3425#issuecomment-399304665>

    This is another pragmatic compromise, allowing tests like `if b/0 [...]`. Without casting to logic, you would always have to compare bits against 0/1 explicitly. A choice we could make. But just because the set value passes through, for chaining, as with set-word/path, doesn't mean the passed value should be what the type might use internally. That would make chaining unusable. Or at least very hard to reason about, as it wouldn't be commutative.

--------------------------------------------------------------------------------

On 2019-08-20T19:46:32Z, dockimbel, commented:
<https://github.com/red/red/issues/3425#issuecomment-523166892>

    In `b/0 = 1`, `b/0` evaluates to `true`, therefore the result of that expression can only be `false`, as:
    ```
    true = 1
    == false
    ```
    
    > one could expect that b/0 = 1 would be interpreted as b/0 = true i.e. true
    
    That goes against the basic semantics of the language, as demonstrated above.

--------------------------------------------------------------------------------

On 2019-08-21T08:44:11Z, meijeru, commented:
<https://github.com/red/red/issues/3425#issuecomment-523360077>

    You have convinced me.

