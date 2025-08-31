
#4961: `?` does not report vector's length
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[type.wish]
<https://github.com/red/red/issues/4961>

**Describe the bug**
```
>> v: make vector! 100000
== make vector! [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0...
>> ? v
V is a vector! value: make vector! [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
```
How big is it?

**Expected behavior**
```
>> h: make hash! b: []
>> ? b
B is a block! value.  length: 0  []

>> ? h
H is a hash! value: length: 0  make hash! []
```
Hash display is a bit off too. Colon instead of period.

**Platform version**
```
Red 0.6.4 for Windows built 2-Sep-2021/15:40:47+03:00  commit #579b9d3
```



