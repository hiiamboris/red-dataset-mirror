
#3903: [Crash] using select on removed map key crashes GUI console
================================================================================
Issue is closed, was reported by temperfugit and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3903>

**Describe the bug**

After using `remove/key` to remove a value from a map, the GUI-console crashes on `select <map> <removed-key>`.  There is no crash if you seek the value using a path as in `map/deleted-key`

```
>> a: #("one" 2 "three" four)
== #(
    "one" 2
    "three" four
)
>> select a "one"
== 2
>> remove/key a "one"
== #(
    "three" four
)
>> a/("one")
== none
>> select a "one"
```

That last line causes the console to crash.

**Expected behavior**

`select` should have returned `none`.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2019/16:38:23-05:00 commit #1a415cd
```



