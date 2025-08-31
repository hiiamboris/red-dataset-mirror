
#3214: Find with complemented charset does't work correctly
================================================================================
Issue is closed, was reported by endo64 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3214>

### Expected behavior

```
>> find "abc" complement charset "*"
== "abc"
```
### Actual behavior

```
>> find "abc" complement charset "*"
== none
```

### Red version and build date, operating system with version.

Red for Windows version 0.6.3 built 28-Jan-2018/1:50:55+03:00

#3159 causes this issue.



