
#1736: Using `exit` in console gives wrong error
================================================================================
Issue is closed, was reported by ghost and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1736>

In Red

```
red>> exit
== none
red>> exit
== none
*** Script error: ask does not allow datatype! for its question argument
*** Where: ask
```

vs in Rebol2

```
>> exit
** Throw Error: Return or exit not in function
** Near: exit
```



