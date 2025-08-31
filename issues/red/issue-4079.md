
#4079: `replace` on strings should work with non-formed arguments
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
<https://github.com/red/red/issues/4079>

**Describe the bug**
```
>> replace "1234" "2" "5"
== "1534"
>> replace "1234" 2 5
== "1234"             ;) it should be 1534 too
```

**Expected behavior**

"1534" both cases

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 1-Oct-2019/19:41:56+03:00 commit #2976655
```

@endo64's fix: :point_up: [October 14, 2019 10:16 PM](https://gitter.im/red/bugs?at=5da4c98e39e2ef28ade0f970)


