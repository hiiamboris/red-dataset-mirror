
#3612: parse with repeated collect / keep produces extra empty blocks
================================================================================
Issue is closed, was reported by dander and has 4 comment(s).
<https://github.com/red/red/issues/3612>

**Describe the bug**
In the following code snippet, `collect` and `keep` are each called twice, but I end up with a bunch more empty blocks that seem to correspond to the `x`es (except for the first one it seems).

**To Reproduce**
```
>> parse "xx(a)xx(b)xx" [some [collect ["(" keep skip ")"] | skip]]
== [[] [#"a"] [] [] [#"b"] [] []]
```

**Expected behavior**
```
>> parse "xx(a)xx(b)xx" [some [collect ["(" keep skip ")"] | skip]]
== [[#"a"] [#"b"]]
```

**Platform version(please complete the following information):**
```
>> about
Red 0.6.4 for Windows built 23-Nov-2018/17:38:06-08:00 commit #3b0a577
```


Comments:
--------------------------------------------------------------------------------

On 2018-11-27T06:26:42Z, dander, commented:
<https://github.com/red/red/issues/3612#issuecomment-441943446>

    Based on [comments](https://gitter.im/red/parse?at=5bfcd38a97a8982b9a6edbd9) [on Gitter](https://gitter.im/red/parse?at=5bfc64b2e25cc274054a5227), it seems that the "expected behavior" I posted is incorrect, but the existing behavior is still a bit problematic.
    
    I'm not sure if I should close this issue or modify it.

--------------------------------------------------------------------------------

On 2018-11-27T09:23:59Z, dander, commented:
<https://github.com/red/red/issues/3612#issuecomment-441986778>

    I don't believe this is a valid issue after all.

