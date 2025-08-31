
#3739: [React] skips updates when graph is forking
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/3739>

**Describe the bug**

Consider the following map of reactions:
```
s/started => a/x ,  b/y
             a/x => b/x
                    b/x, b/y => detected by a single reaction (R)
```
React will:
- detect a change in `b/y` and trigger (R)
- detect a change in `a/x` and reflect it on `b/x`
- change f `b/x` will not be detected

This leads to very poor react experience, changes often failing to be detected. And it *may be* the cause of https://github.com/red/red/issues/3731.

**To reproduce**
```
Red []

reactor: func [spec] [make deep-reactor! spec]

s: reactor [started: no]
a: reactor [x: none]
b: reactor [x: none y: none]

react [
	if s/started [
		a/x: copy "NEW-VALUE!"	print ["NEW-VALUE! => a/x"]
		b/y: copy "junk"	print ["junk => b/y"]
	]
]

react [
	print ["A/x is" a/x]
	if b/x <> a/x [ b/x: copy a/x	print [b/x "=> b/x"] ]
]

react [
	print ["B is [x:" b/x "y:" b/y "]"]
	if b/x = "NEW-VALUE!" [print "^/!!!! IT'S WORKING !!!!^/"]
]

print "^/STARTED!"
s/started: yes
```
The output I see:
```
STARTED!
NEW-VALUE! => a/x
junk => b/y
B is [x: none y: junk ]
A/x is NEW-VALUE!
NEW-VALUE! => b/x            ; b/x is changed but never triggered the (R)
A/x is NEW-VALUE!
```

**Expected behavior**

The provided script should print "!!!! IT'S WORKING !!!!" line, but it does not.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 9-Jan-2019/5:46:16+03:00 commit #acf3492
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-16T10:35:07Z, dockimbel, commented:
<https://github.com/red/red/issues/3739#issuecomment-454731579>

    Note: you can use `system/reactivity/debug?: yes` to activate traces of reactions evaluation.

--------------------------------------------------------------------------------

On 2019-01-16T10:46:15Z, dockimbel, commented:
<https://github.com/red/red/issues/3739#issuecomment-454734838>

    After a quick look, if you just remove `"y:" b/y` from last reactive formula, it will work as expected.
    
    Speculative explanation: the reactive engine is detecting such case as a possible infinite loop of reactions, so does not trigger the last one. It could be a bug or a limitation of the current detection method.
    
    I will do a deeper investigation asap.

