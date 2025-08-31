
#4318: [Parse] SET and COPY work even without a sub-rule
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [type.bug] [test.written]
<https://github.com/red/red/issues/4318>

**Describe the bug**

`set` and `copy` Parse keywords usually extract a matched portion of the input from a given sub-rule into a given word. However, usage of these keywords without sub-rules is still permitted.

**To reproduce**

```red
>> parse [][copy word] word
== []
>> parse [][set word] word
== none
```

Rule by itself always succeeds:

```red
>> parse [1 2 3][[copy word] 3 integer!]
== true
>> parse [a b c][[set word] 3 word!]
== true
```

**Expected behavior**

```red
*** Script Error: PARSE - unexpected end of rule after: set / copy
*** Where: parse
*** Stack:  
```

**Platform version**

Latest.



