
#4956: PUT doesn't take all hashable values as a key
================================================================================
Issue is closed, was reported by RaycatWhoDat and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/4956>

**Describe the bug**
[This page](https://github.com/red/red/wiki/[DOC]-Comparison-of-aggregate-values-(block!-vector!-object!-hash!-map!)) states that:
> Hashable — scalar! all-word! any-string!

However, PUT only takes `[scalar! any-word! any-string! binary!]` for its `key` argument.

**To reproduce**
```
>> m: #()
== #()
>> m/(#a): 1
== 1
>> m/(#a)
== 1
>> m
== #(
    #a 1
)
>> select m #a
== 1
>> put m #a 2
*** Script Error: put does not allow issue! for its key argument
*** Where: put
*** Stack: 
>> extend m [#b 3]
== #(
    #a 1
    #b 3
)
```

**Expected behavior**
You should be allowed to use PUT with all hashable datatypes.

**Platform version**
Red 0.6.4 for Linux built 2-Sep-2021/7:40:47-05:00  commit #579b9d3


