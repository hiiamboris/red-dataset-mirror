
#5017: [Compiler] Replaces outer context values with those of inner context!
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.bug] [type.compiler]
<https://github.com/red/red/issues/5017>

**Describe the bug**

The following code:
```
Red []

outer: context [
	outer1: none
	outer2: none
	inner: context [
		inner1: none
		inner2: none
		set 'outer1 function [fn [function!]][
			self/inner2: if block? b: first body-of :fn [b]
			?? outer/outer2
		]
		set 'outer2 function []["THIS IS OUTER2 FUNC"]
	]
]

?? outer/outer2
do [outer/outer1 does [[a b c]]]
```
Works fine interpreted (`red bug2.red`):
```
outer/outer2: func []["THIS IS OUTER2 FUNC"]
outer/outer2: func []["THIS IS OUTER2 FUNC"]
```
But outputs junk when compiled (`red -c bug2.red`):
```
outer/outer2: func []["THIS IS OUTER2 FUNC"]
outer/outer2: [a b c]
```
It appears that junk is being assigned to the word with the *same index* in outer context as the one being set in the inner context. That is `self/inner1:` would harm `outer/outer1`, and if we had 3 words, `self/inner3` would harm `outer/outer3` and so on.


**Expected behavior**

As interpreted.

**Platform version**

```
Red 0.6.4 for Windows built 22-Dec-2021/17:36:36+03:00  commit #328c904
```



