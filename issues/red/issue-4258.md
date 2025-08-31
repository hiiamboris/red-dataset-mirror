
#4258: CLEAN-PATH/ONLY returns empty file! for files without path
================================================================================
Issue is closed, was reported by rebolek and has 12 comment(s).
<https://github.com/red/red/issues/4258>

`clean-path/only` cleans `%./` part of path. However, if no such part of path is present, `clean-path` returns empty file. It should leave the file as is in such case.

**To reproduce**

```
>> clean-path/only %asdf
== %""
;; %asdf ; -- expected
>> clean-path/only/dir %asdf
== %""
;; %asdf/ ; -- expected
```

**Platform version**

Latest Red on all platforms


Comments:
--------------------------------------------------------------------------------

On 2020-01-23T17:41:59Z, greggirwin, commented:
<https://github.com/red/red/issues/4258#issuecomment-577790556>

    :+1: Please add a test for this as well, to catch future regressions.
    
    I hadn't looked at `clean-path` in a while. Is `/dir` needed? Just wondering what the use cases are, where it isn't just as easy to spec a dir as the value. 

--------------------------------------------------------------------------------

On 2020-01-23T17:42:49Z, greggirwin, commented:
<https://github.com/red/red/issues/4258#issuecomment-577790861>

    And maybe while you're head is in this function, look at https://github.com/red/red/issues/3571

--------------------------------------------------------------------------------

On 2020-01-23T17:44:03Z, greggirwin, commented:
<https://github.com/red/red/issues/4258#issuecomment-577791356>

    Ah, tests running now. You beat me to it. Thanks.

--------------------------------------------------------------------------------

On 2020-01-23T21:26:39Z, rebolek, commented:
<https://github.com/red/red/issues/4258#issuecomment-577884704>

    > Is /dir needed? Just wondering what the use cases are, where it isn't just as easy to spec a dir as the value.
    
    That's out of the scope of this PR. It probably has its value, I guess, even if I haven't used it in a while (ever?). `clean-path` would need more attention anyway, as there's still an open issue with `url!`.

--------------------------------------------------------------------------------

On 2020-01-23T21:45:35Z, meijeru, commented:
<https://github.com/red/red/issues/4258#issuecomment-577891711>

    "there's still an open issue with url!" indeed see #3571

--------------------------------------------------------------------------------

On 2020-01-25T03:49:12Z, x8x, commented:
<https://github.com/red/red/issues/4258#issuecomment-578373733>

    Doesn't work for this case:
    ```
    clean-path/only %../path/../file
    ;   %../path/../file
    ```
    I had a quick go at an alternative that should solve all current issues (and maybe add some new ones.. )
    It's here https://gist.github.com/x8x/612e9fa77378b93d98f0cf19ed27c215
    
    Also, we have `dirize`, we should probably have `undirize` as well.

