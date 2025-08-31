
#4993: [Regression] NaNs are strictly equal now
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4993>

**Describe the bug**
```
>> 1.#nan == 1.#nan
== true
```
Was false in `Red 0.6.4 for Windows built 12-May-2021/6:12:03+03:00  commit #cebd5b9`
Became true in `Red 0.6.4 for Windows built 13-Jun-2021/10:10:47+03:00  commit #79ded2f`

**Expected behavior**

![](https://i.gyazo.com/6456b00bb5b7045ec137e13cdf5a256f.png)




