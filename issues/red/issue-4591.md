
#4591: PARSE 0 0 <value> matches one value
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4591>

```
>> parse " " [0 0 space]
== true
>> parse [x][0 0 'x]
== true
```
Parsing 0 to 0 values returns true for one value also. It should return FALSE instead.

**Platform version**
```
Red 0.6.4 for Linux built 7-Jul-2020/7:13:45```


Comments:
--------------------------------------------------------------------------------

On 2020-07-29T12:03:02Z, 9214, commented:
<https://github.com/red/red/issues/4591#issuecomment-665623449>

    ```red
    >> parse [x][0 0 (probe "the rule is never taken") 'x]
    == true
    >> parse [x][0 0 [(probe "the rule is never taken")] 'x]
    "the rule is never taken"
    == true
    ```
    #3679

