
#678: Number - string parsing isn't working properly
================================================================================
Issue is closed, was reported by kealist and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/678>

Writing some tutorials, I stumbled upon some problems with number-string parse rules. 

```
red>> parse "cat" [2 "cat"]
== true
red>> parse "cat" [1 "cat"]
== true
red>> parse "cat" [3 "cat"]
== true
red>> parse "cat" [4 "cat"]
== false
```



