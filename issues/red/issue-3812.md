
#3812: [View] `size-text/with` ignores `/with` when used on rich-text
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[GUI]
<https://github.com/red/red/issues/3812>

**Describe the bug**
```
>> r: rtd-layout ["ab^/cd"]
>> size-text r
== 11x22
>> size-text/with r "a"
== 11x22
>> size-text/with r "abcdefgh"
== 11x22
>> size-text/with r "a^/^/b^/^/c^/^/d"
== 11x22
```

**Expected behavior**

The result should reflect given text size using rich-text's selected font (set as `r/font` facet or a default fallback if `r/font = none`)
For comparison:
```
>> r/text: "abcdefgh" size-text r
== 41x11
>> r/text: "a^/^/b^/^/c^/^/d" size-text r
== 5x79
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 5-Mar-2019/0:09:36+03:00 commit #53b5b37
```



Comments:
--------------------------------------------------------------------------------

On 2019-03-12T19:30:33Z, greggirwin, commented:
<https://github.com/red/red/issues/3812#issuecomment-472148370>

    It's clear from the source of `size-text` that the refinement text arg isn't used for rich text at all. There are also a couple magic numbers there that would be nice to explain.

