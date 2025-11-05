# Issue #5654: [JSON] Improperly en/de-codes codepoints beyond the basic plane
<https://github.com/red/red/issues/5654>

**Describe the bug**

In JSON [only chars in the range 0-FFFF](https://datatracker.ietf.org/doc/html/rfc8259#section-7) can be represented, so the 10000-1FFFF range becomes surrogate pairs.

Red JSON codec fails to encode and decode those:
```
>> to-json/ascii "^(1f440)"                    ;) just ate the 0x10000 bit!
== {"\uF440"}
>> length? probe to-json "^(1f440)"            ;) correct
{"👀"}
== 3
>> length? probe load-json {"\ud83d\udc40"}    ;) loaded as surrogate pairs!
"👀"
== 2
>> to {} to #{} load-json {"\ud83d\udc40"}     ;) surrogate pairs don't round-trip!
*** Access Error: invalid UTF-8 encoding: #{EDB18000}
*** Where: to
*** Near : to "" to #{} load-json {"\ud83d\udc40"}
*** Stack:  
```

**To reproduce**
```
to-json/ascii "^(1f440)"
length? probe load-json {"\ud83d\udc40"}
to {} to #{} load-json {"\ud83d\udc40"}
```

**Expected behavior**
```
1 = length? probe load-json {"\ud83d\udc40"}
"^(1f440)" = to {} to #{} load-json {"\ud83d\udc40"}
```

**Platform version**
```
Red 0.6.6 for Windows built 9-Sep-2025/3:21:04+08:00  commit #c8b6ebc
```

See also https://github.com/red/red/issues/5621



## greggirwin on 2025-10-08T16:29:40Z
Thanks @hiiamboris !


