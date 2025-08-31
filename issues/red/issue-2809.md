
#2809: REPLACE/ALL CHAR! doesn't honor VALUE length
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2809>

When replacing `string!`, it works fine:
```
>> replace/all "abcb" "b" "bb"
== "abbcbb"
```
Changing `string!` to `char!` shows the problem:
```
>> replace/all "abcb" #"b" "bb"
== "abbbb"
```
Both variants have same result in Rebol.


