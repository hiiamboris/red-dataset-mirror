
#4017: CLI console does not remember last input when fetched from history
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [type.bug]
<https://github.com/red/red/issues/4017>

```
>> print "hi"
hi
>> 123
== 123
```
then:
1. press UP key twice to select `print "hi"`
2. press ENTER
3.  press UP, `123` show up instead of `print "hi"`.

This is a recent regression.


