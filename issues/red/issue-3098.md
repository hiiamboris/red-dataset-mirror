
#3098: Path + final paren segment + func result == paren result
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3098>

### Expected behavior
```
>> fs: reduce [does [print "hi"] does [print "hey"] func [x][probe x probe add x 1]]
== [func [][print "hi"] func [][print "hey"] func [x][probe x probe add x 1]]
>> fs/(1 + 2) 100
100
101
== 101
```
### Actual behavior
```
>> fs: reduce [does [print "hi"] does [print "hey"] func [x][probe x probe add x 1]]
== [func [][print "hi"] func [][print "hey"] func [x][probe x probe add x 1]]
>> fs/(1 + 2) 100
100
101
== 3

>> fs: reduce [does [print "hi"] does [print "hey"] func [x y ][add x y]]
== [func [][print "hi"] func [][print "hey"] func [x y][add x y]]
>> fs/(1 + 2) 100 200
== 3

>> fs/(1 + 1) 
hey
== 2
```
### Steps to reproduce the problem

Use a paren as the last segment in a path, which evaluates to a function. 

(edited, as I mistakenly tested against R2 in my haste. Arity has no effect.)

### Red version and build date, operating system with version.

Latest code pulled and built on 5-nov-2017, Windows 7


