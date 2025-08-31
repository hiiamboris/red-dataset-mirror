
#4327: `find`& `select` are not following non-strict comparison rules for numbers
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.design]
<https://github.com/red/red/issues/4327>

**Describe the bug**

```
>> 1 = 100%
== true
>> 1 = 1.0
== true
>> 1.0 = 100%
== true
>> find [1 1.0 100% end] 1
== [1 1.0 100% end]
>> find [1 1.0 100% end] 1.0
== [1.0 100% end]
>> find [1 1.0 100% end] 100%
== [100% end]
>> select [1 1.0 100% end] 1
== 1.0
>> select [1 1.0 100% end] 1.0
== 100%
>> select [1 1.0 100% end] 100%
== end
```

**Expected behavior**
```
>> find [1 1.0 100% end] 1
== [1 1.0 100% end]
>> find [1 1.0 100% end] 1.0
== [1 1.0 100% end]
>> find [1 1.0 100% end] 100%
== [1 1.0 100% end]
>> select [1 1.0 100% end] 1
== 1.0
>> select [1 1.0 100% end] 1.0
== 1.0
>> select [1 1.0 100% end] 100%
== 1.0
```
`find/case` and `select/case` should distinguish number types, normal `find`/`select` should not.
Reasons for that are:
- consistency of meaning of equality across Red
- use of `find`/`select` in applications that do not care about number types, only about their value

In Rebol:
- R2 does not have percent, but is able to loosely match floats with integers
- R3 has percent and matches it strictly, but is able to loosely match floats with integers

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 10-Mar-2020/16:22:26+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-10-14T18:16:04Z, greggirwin, commented:
<https://github.com/red/red/issues/4327#issuecomment-708575352>

    Recent chat: https://gitter.im/red/bugs?at=5f85619443fa5d19e6095b5a

