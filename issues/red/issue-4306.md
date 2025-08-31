
#4306: [View] A call to `view` destroys events sometimes
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4306>

**Describe the bug**

When a `view` func is called within the actor, some further events may get lost.

**To reproduce**
```
system/view/capturing?: yes
view [
	b: base 80x80 magenta
	on-detect [probe event/type none]
	on-down [view/options [base rate 3 on-time [unview]] [offset: 0x0]]
]
```
1. Click on the base, see how briefly shows another base in the corner
2. Observe both `down` and `up` events
3. Click again
4. Observe that only `up` event shows, while `down` is lost
5. Repeat any number of times for the same effect

Such is the output for me on W7:
```
drawing
over
down
up
up
down
up
up
...
```

**Expected behavior**

```
drawing
over
down
up
down
up
down
up
down
up
...
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 31-Jan-2020/17:12:41+03:00 commit #414cdb3
```



Comments:
--------------------------------------------------------------------------------

On 2020-04-06T17:01:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/4306#issuecomment-609917044>

    My gut says this one and https://github.com/red/red/issues/4384 are related 

