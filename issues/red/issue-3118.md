
#3118: copy/deep on map! datatype affects previous shallow copies
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3118>

If you copy a `map!` and then subsequently deep copy the original, series in the shallow copy get bound to the subsequent deep copy.

### Expected behavior
```text
>> m: #(a: 1 b: [2])
== #(
    a: 1
    b: [2]
)
>> mm: copy m
== #(
    a: 1
    b: [2]
)
>> same? mm/b m/b
== true
>> mmm: copy/deep m
== #(
    a: 1
    b: [2]
)
>> same? mm/b m/b
== true                                                                        
>> same? mm/b mmm/b
== false
```
### Actual behavior
```text
>> m: #(a: 1 b: [2])
== #(
    a: 1
    b: [2]
)
>> mm: copy m
== #(
    a: 1
    b: [2]
)
>> same? mm/b m/b
== true
>> mmm: copy/deep m
== #(
    a: 1
    b: [2]
)
>> same? mm/b m/b
== false
>> same? mm/b mmm/b
== true
```
### Steps to reproduce the problem
Run the above example in the Red console
### Red version and build date, operating system with version.
Red 0.6.3 27-Nov-2017/11:22:42+08:00
MacOS 10.12 & Windows 7
```


