
#4089: Comparison of blocks containing NaNs is undefined yet
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.review]
<https://github.com/red/red/issues/4089>

**Describe the bug**

While we're waiting for PR #3902 to be merged, there's another peculiarity requiring attention:
```
>> x: 0.0 / 0
== 1.#NaN
>> a: reduce [x]
== [1.#NaN]
>> b: reduce [x]
== [1.#NaN]
>> b =? b
== true
>> b == b
== true
>> b = b
== true
>> a == b
== false
>> a = b
== false
```

**Expected behavior**

I believe `b = b` and `b == b` should be false in this test, as `==` and `=` are *data* comparisons, and NaN cannot equal another NaN by IEEE's decree.
Funny thing will be to note in the docs though: we will have `b =? b = yes`  but `b = b = no` and `b == b = no` ☻

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 1-Oct-2019/19:41:56+03:00 commit #2976655
```



