
#5227: -1x- should NOT be a valid pair!
================================================================================
Issue is closed, was reported by luce80 and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5227>

**Describe the bug**
 `-1x-` is parsed as a valid `pair!`

**To reproduce**
```
>> -1x-
== -1x0
```

**Expected behavior**
An `error!` should appear.



Comments:
--------------------------------------------------------------------------------

On 2022-10-15T15:50:52Z, meijeru, commented:
<https://github.com/red/red/issues/5227#issuecomment-1279771127>

    Any `<integer>x-`  is lexed as `<integer>x0`

--------------------------------------------------------------------------------

On 2022-10-16T00:18:09Z, qtxie, commented:
<https://github.com/red/red/issues/5227#issuecomment-1279857197>

    > Any `<integer>x-` is lexed as `<integer>x0`
    
    Same for `<integer>x+`, so it looks like an issue when handling sign chars.

