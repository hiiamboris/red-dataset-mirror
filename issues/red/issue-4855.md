
#4855: Dates ignore sub-seconds in comparison
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4855>

**Describe the bug**
```
>> t: now/precise
>> t': t + 0:0:0.01
>> t' <= t
== true
>> t' >= t
== true
```

**Expected behavior**

`t' <= t` to be false

**Platform version**
```
Red 0.6.4 for Windows built 2-Mar-2021/15:01:01+03:00 commit #6de9b93
```



Comments:
--------------------------------------------------------------------------------

On 2021-03-16T19:14:03Z, greggirwin, commented:
<https://github.com/red/red/issues/4855#issuecomment-800535144>

    ```
    >> t' = t
    == true
    >> t' <> t
    == false
    >> t' < t
    == false
    >> t' > t
    == false
    ```

--------------------------------------------------------------------------------

On 2021-03-16T19:24:56Z, greggirwin, commented:
<https://github.com/red/red/issues/4855#issuecomment-800541830>

    Date compare intentionally rounds (%date.reds @Line:1093). @dockimbel will have to say why.
    ```
    		t1: floor value1/time + 0.5						;-- in UTC already, round to integer
    		t2: floor value2/time + 0.5
    ```

--------------------------------------------------------------------------------

On 2021-03-16T20:09:25Z, hiiamboris, commented:
<https://github.com/red/red/issues/4855#issuecomment-800568531>

    R2 didn't do that:
    ```
    >> t: now/precise
    >> t + 0:0:0.0000000001 = t
    == true
    >> t + 0:0:0.000000001 = t
    == false
    ```

--------------------------------------------------------------------------------

On 2021-03-18T07:14:47Z, qtxie, commented:
<https://github.com/red/red/issues/4855#issuecomment-801690388>

    Pushed a fix in PR #4858.

