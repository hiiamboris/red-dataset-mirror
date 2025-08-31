
#5067: Interpreter stack CORRUPTION when using parens in paths
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5067>

**Describe the bug**
```
c: context [
	b: reduce ['f does [print "stuff"]]
	o: object [f: does [print "stuff"]]
]
probe c/('b)/f
probe c/('o)/f
```
Output:
```
stuff
b
stuff
o
```

**Expected behavior**
```
stuff
unset
stuff
unset
```

**Platform version**
```
Red 0.6.4 for Windows built 25-Jan-2022/14:48:41+03:00  commit #dbbe6e0
```

Historically related: https://github.com/red/red/issues/1865


Comments:
--------------------------------------------------------------------------------

On 2022-02-14T15:15:31Z, dockimbel, commented:
<https://github.com/red/red/issues/5067#issuecomment-1039205419>

    I have a partial fix for it, I need to improve it a bit and do more testing before submitting.

--------------------------------------------------------------------------------

On 2022-02-14T17:28:49Z, greggirwin, commented:
<https://github.com/red/red/issues/5067#issuecomment-1039356736>

    Knowing what the problem is, is more than half the problem.

