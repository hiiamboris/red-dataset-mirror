
#4056: [Regression] `tail?` and `empty?` on image are missing by one pixel
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[GUI]
<https://github.com/red/red/issues/4056>

**Describe the bug**

`tail?` treats single pixel as the tail

**To reproduce**
```
>> empty? make image! 0x0
== true          ;) OK
>> empty? make image! 1x1
== true          ;) wrong
>> empty? next make image! 1x2
== true          ;) wrong
>> empty? skip make image! 2x2 3
== true          ;) wrong
>> tail? make image! 1x1
== true          ;) wrong
>> tail? back tail make image! 2x2
== true          ;) wrong
```

**Expected behavior**
```
>> empty? make image! 1x1
== false
>> empty? next make image! 1x2
== false
>> empty? skip make image! 2x2 3
== false
>> tail? make image! 1x1
== false
>> tail? back tail make image! 2x2
== false
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 25-Sep-2019/22:36:30+03:00 commit #f753e25
```

Whatever was the reason for this commit https://github.com/red/red/commit/8c3058e65c10a394629ea0f1fc999ddbddc3d2a5 , it introduced the regression.



Comments:
--------------------------------------------------------------------------------

On 2020-02-12T22:52:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/4056#issuecomment-585458640>

    Affects `next` as well:
    ```
    >> i: make image! 1x1
    == make image! [1x1 #{FFFFFF}]
    >> next i
    == make image! [1x1 #{FFFFFF}]
    >> next next i
    == make image! [1x1 #{FFFFFF}]
    >> skip i 1
    == make image! [1x1 #{}]
    ```

