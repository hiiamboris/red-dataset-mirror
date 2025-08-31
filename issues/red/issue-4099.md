
#4099: Tricky scenario of series modification will require a special case
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.review]
<https://github.com/red/red/issues/4099>

**Describe the bug**

I first mentioned it [in #4088](https://github.com/red/red/issues/4088#issuecomment-544528096) but decided I'm not going to fix it in PR #4097 (junk bytes are a certain bug) 
```
>> change next s: "/\" reduce [s s]
== ""
>> s
== "//\^@//\"
>> change/part next s: "/\" reduce [s s] next s
== ""
>> s
== "//\\ //\"
```

This is the best I could do (in PR #4097) without overcomplicating the algorithm:
```
>> change next s: "/\" reduce [s s]
== ""
>> s
== "//\//\"
>> change/part next s: "/\" reduce [s s] next s
== "\"
>> s
== "//\//\\\"
```
The problem here is that `change` (using `change-range`) forms and inserts every item from the block sequentially. So once the first item is inserted (`s = "//\"`), the second item already refers to the changed data. So now `//\\` not `/\` will be inserted after the 1st item: between `//\` and `\`. And so on: on every insertion the item becomes bigger.

To remedy that I would need either to copy the target buffer, or to form all the items in advance.
At this point I'm not sure if this case is worth fixing it, leaving it for later.

**Expected behavior**

The block `[s s]` contains two identical values, so it is expected that two identical values will be inserted into the target string:
```
>> change next s: "/\" reduce [s s]
== ""
>> s
== "//\/\"
>> change/part next s: "/\" reduce [s s] next s
== ""
>> s
== "//\/\\"
```

Same reasoning applies to `insert`, `append` and other modifying actions involving forming blocks.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Oct-2019/15:33:41+03:00 commit #ed913ef
```



