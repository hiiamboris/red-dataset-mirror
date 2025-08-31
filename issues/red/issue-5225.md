
#5225: Misleading "Near:" in error reports
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/5225>

**Describe the bug**

Sometimes "Near:" field points to a wrong location, as in this example:
```
Red []

a: "A" b: "B"
m: [a b]
f: func [i] [m/:i]
x: get f 3
?? x
```
Which prints:
```
*** Script Error: get does not allow none! for its word argument
*** Where: get
*** Near : m/:i
*** Stack:
```
But there's no `get` near `m/:i` (in real code it's hundreds of lines apart), so it only confuses the coder (me :).

**To reproduce**

Run provided script

**Expected behavior**

`*** Near : get f 3` perhaps

And it would also help if it encoded newline markers in the output somehow (e.g. `^/`), otherwise often I start looking for tokens separated by space, but in real code they are not.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4532 date: 6-Oct-2022/6:24:41 commit: #0657e2239680d6071a4f22f467031deeb0fd9f2d ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


