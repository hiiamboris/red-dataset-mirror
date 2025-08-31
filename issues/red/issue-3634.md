
#3634: [Compiler] Another `self` misbehavior
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.review] [type.compiler]
<https://github.com/red/red/issues/3634>

**Describe the bug**
The code below can be interpreted but can't be compiled.
There were other `self`-related issues: https://github.com/red/red/issues/43 https://github.com/red/red/issues/913 https://github.com/red/red/issues/925. Apparently the fix is still incomplete.

```
Red []

o1: context [
	x: none
	o2: context [
		y: none
	]
	self/x: 1
	self/o2/y: 2
]

probe o1
```

It reports an error:
```
...using libRedRT built on 4-Dec-2018/16:30:25
*** Compilation Error: word y not defined in self/o2/y:
*** in file: D:\devel\red\red-src\red\tests\source\units\1.red
*** near: []
```

**Expected behavior**
```
make object! [
    x: 1
    o2: make object! [
        y: 2
    ]
]
```

**Platform version(please complete the following information):**
```
Red 0.6.4 for Windows built 29-Nov-2018/6:09:14+03:00 commit #95481b0
```


Comments:
--------------------------------------------------------------------------------

On 2022-08-30T15:30:59Z, dockimbel, commented:
<https://github.com/red/red/issues/3634#issuecomment-1231828956>

    I'm pushing a patch for this specific case (it was [not meant to be supported](https://github.com/red/red/blob/master/encapper/compiler.r#L3366) in the current code), but it's rather an adhoc solution, as the compiler will soon be dropped. So only paths in form of `self/<object>/.../<field>` will be supported (where <field> is a field name).

