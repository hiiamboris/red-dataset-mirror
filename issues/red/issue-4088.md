
#4088: CHANGE on the same buffer won't often work properly
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.bug]
<https://github.com/red/red/issues/4088>

**Describe the bug**

Different type scenario:
```
>> a: "[......]" change/part (skip a 2) a 2  a
== "[.[......]...]"
>> a: "[......]" change/part a a 2  a
== "[......].....]"
>> a: "[......]" change/part (skip a 2) as file! a 2  a
== "[.[....]...]"                                   ;) wrong
>> a: "[......]" change/part a as file! a 2  a
== ".....].....]"                                   ;) wrong
```

Overlapping copy scenario (debug console crashes on this, see #4087):
```
>> change/part a: "123" next a a  a
== "21123"                                   ;) wrong, expected 23123
```

**To reproduce**
```
a: "[......]" change/part (skip a 2) as file! a 2  a
a: "[......]" change/part a as file! a 2  a
change/part a: "123" next a a  a
```

**Expected behavior**
```
>> a: "[......]" change/part (skip a 2) a 2  a
== "[.[......]...]"
>> a: "[......]" change/part a a 2  a
== "[......].....]"
>> a: "[......]" change/part (skip a 2) as file! a 2  a
== "[.[......]...]"
>> a: "[......]" change/part a as file! a 2  a
== "[......].....]"
>> change/part a: "123" next a a  a
== "23123"
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 1-Oct-2019/19:41:56+03:00 commit #2976655
```



Comments:
--------------------------------------------------------------------------------

On 2019-10-19T15:21:29Z, hiiamboris, commented:
<https://github.com/red/red/issues/4088#issuecomment-544159296>

    Don't wanna open another issue for it: when `/part` is specified, `/dup 0` works wrongly:
    ```
    >> change/part/dup s: "abcde" "!" 4 0
    == "abcde"
    >> s
    == "abcde"
    ```
    Expected `"e"` and `s = "e"`
    Same for negative `/dup` ofc

--------------------------------------------------------------------------------

On 2019-10-21T14:00:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/4088#issuecomment-544528096>

    Another bad case scenario:
    ```
    >> change next s: "1" reduce [s s s]
    == ""
    >> s
    == "11$11^@^@^@11$11"      ;) expected "1111"
    ```

