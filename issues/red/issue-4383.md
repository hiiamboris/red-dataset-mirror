
#4383: to-hex is not doing proper bounds check for its `/size` value
================================================================================
Issue is closed, was reported by Oldes and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4383>

**Describe the bug**
when `to-hex/size` has `size <= 0`, it should throw an out-of-range error. 
```red
>> to-hex/size 1 0
== #
>> to-hex/size 1 -1
== #0123456789ABCDEF
```
It does truncation to maximum 8 hex digits:
```red
>> to-hex/size 1 8
== #00000001
>> to-hex/size 1 99
== #00000001
```
That is probably ok, but could be documented in doc-string.



