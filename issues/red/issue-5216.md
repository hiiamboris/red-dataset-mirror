
#5216: [Core] Object path access failure within loops scope
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5216>

**Describe the bug**

Could be related to #4854 

**To reproduce**

Run this:
```
Red []

obj1: object []
obj2: object [owner: 'obj1]
list: function [obj [object!]] [
	print ">>>"
	?? obj/owner										;) works outside of loop!
	; test: copy/deep [									;) no problem if copied!
	test: [
		?? obj/owner									;) but not within!
		all [
			word? :obj/owner
			value? obj/owner
			obj: get obj/owner
		]
	]
	; until [not do test]
	while test []
	print "<<<"
]
list obj2
list obj2
```
It outputs:
```
>>>
obj/owner: obj1
obj/owner: obj1
obj/owner: unset
<<<
>>>
obj/owner: obj1
obj/owner: *** Script Error: owner has no value
*** Where: get
*** Near : ?? obj/owner all [word? :obj/owner value? ]
*** Stack: list ??
```
Note that `get/any` call fails within `??` after entering loops body or condition.
In 0.6.4 stable it was even worse:
```
>>>
obj/owner: obj1
obj/owner: obj1
obj/owner: *** Script Error: cannot access owner in path obj/owner
*** Where: get
*** Stack: list ??
```
Plain `get/any` call fails too, only within the loop.
`test: copy/deep [...]` removes the problem.

**Expected behavior**

```
>>>
obj/owner: obj1
obj/owner: obj1
obj/owner: unset
<<<
>>>
obj/owner: obj1
obj/owner: obj1
obj/owner: unset
<<<
```

**Platform version**

```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4506 date: 24-Sep-2022/7:39:31 commit: #487881e2aacbd6037801f75af6a975bfeaf0d90c ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2022-09-24T18:20:28Z, dockimbel, commented:
<https://github.com/red/red/issues/5216#issuecomment-1257036266>

    Cached paths are only created and used for function calls (#4854), which is not the case above.
    

--------------------------------------------------------------------------------

On 2022-09-24T18:32:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/5216#issuecomment-1257038933>

    Why copy fixes it? Maybe path slot gets corrupted somehow?

--------------------------------------------------------------------------------

On 2022-09-24T18:48:08Z, dockimbel, commented:
<https://github.com/red/red/issues/5216#issuecomment-1257042200>

    No clue. Looking into it...

--------------------------------------------------------------------------------

On 2022-09-24T20:12:09Z, dockimbel, commented:
<https://github.com/red/red/issues/5216#issuecomment-1257057259>

    Just a very edge case not taken into account in object `eval-path` action.

