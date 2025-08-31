
#2899: WISH: KEEP ONLY support in PARSE
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[type.wish]
<https://github.com/red/red/issues/2899>

See this code:

```
>> parse "ab" [collect [set v1 "a" set v2 "b" keep (reduce [v1 v2])]]
== [[#"a" #"b"]]
```

This is actually `keep/only` equivalent, not `keep`.

Expected behaviour:
```
>> parse "ab" [collect [set v1 "a" set v2 "b" keep only (reduce [v1 v2])]]
== [[#"a" #"b"]]
>> parse "ab" [collect [set v1 "a" set v2 "b" keep (reduce [v1 v2])]]
== [#"a" #"b"]
```


Comments:
--------------------------------------------------------------------------------

On 2018-04-25T06:31:21Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2899#issuecomment-384175084>

    Following the introduction of the [Red REP repository for enhancements and wishes](https://gitter.im/red/red?at=5adfeed527c509a7744a3dc8), this issue is being closed.
    
    If you believe that your wish is still valid, please open a new issue for it in the new [red/REP repo](https://github.com/red/REP). It would help if you could include a link to this issue when opening an issue in the REP repository.

