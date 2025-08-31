
#5145: `set-quiet` returns the word
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/5145>

**Describe the bug**

```
>> ? set-quiet
USAGE:
     SET-QUIET word value

DESCRIPTION: 
     Set an object's field to a value without triggering eventual object's events. 
     SET-QUIET is a routine! value.

ARGUMENTS:
     word         [any-type!] 
     value        [any-type!] 

>> set-quiet 'x 1
== x
```

**Expected behavior**

Docstring doesn't say it should return anything, yet it returns the word, and ideally it should return the value

**Platform version**
```
Red 0.6.4 for Windows built 15-May-2022/2:37:39+03:00  commit #2b72c44
```



