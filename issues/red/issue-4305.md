
#4305: Paren in path evaluating to a function overrides the result when it's used
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4305>

**Describe the bug**

Almost the same problem as https://github.com/red/red/issues/3098 but now it's triggered by that result being used in an expression:
```
>> a: reduce ['b does [print "called" 100]]
>> id: func [x][:x]

>> a/('b)
called
== 100

>> id a/('b)
called
== b

>> x: a/('b)
called
== b
```
When compiled, it works properly though.

**To reproduce**
```
a: reduce ['b does [print "called" 100]]
id: func [x][:x]
a/('b)
id a/('b)
x: a/('b)
```

**Expected behavior**

`100` in all cases

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 31-Jan-2020/17:12:41+03:00 commit #414cdb3
```



