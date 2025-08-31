
#4716: [R/S] assign struct value to nested one failed
================================================================================
Issue is open, was reported by bitbegin and has 2 comment(s).
[status.reviewed] [type.review] [Red/System]
<https://github.com/red/red/issues/4716>

**To reproduce**
```
Red/System []

STRUCT_F!: alias struct! [
	n	[integer!]
	f	[float32!]
]

STRUCT_N!: alias struct! [
	f	[STRUCT_F! value]
]

a: declare STRUCT_N!
b: declare STRUCT_F!
b/n: 1
a/f: b

print-line a/f/n
```

will print 
```
134525168
```
on linux

**Expected behavior**
should print 1

```
Red 0.6.4 for Linux built 10-Nov-2020/9:37:33
```



Comments:
--------------------------------------------------------------------------------

On 2020-11-29T19:29:56Z, dockimbel, commented:
<https://github.com/red/red/issues/4716#issuecomment-735442415>

    This feature has not been implemented yet.

