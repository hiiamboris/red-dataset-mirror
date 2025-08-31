
#5065: Natives & actions are not `same?` after first usage
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5065>

**Describe the bug**
```
Red []
f: function [] [
	old: values-of system/words
	loop 1 [] repeat x 1 [] prin [] exp 1 max 1 0 odd? 2 divide 2 2 
	new: values-of system/words
	repeat i length? words: words-of system/words [
		unless :old/:i =? :new/:i [
			s1: mold/flat/part :old/:i 30
			s2: mold/flat/part :new/:i 30
			print ["i=" i words/:i "^-= " s1 " -> " s2]
		]
	]
]
f
```
This script compares system values before and after `loop 1...` line and outputs:
```
i= 131 divide   =  make action! [["Returns the qu  ->  make action! [["Returns the qu
i= 216 odd?     =  make action! [[{Returns true i  ->  make action! [[{Returns true i
i= 275 loop     =  make native! [["Evaluates body  ->  make native! [["Evaluates body
i= 276 repeat   =  make native! [[{Evaluates body  ->  make native! [[{Evaluates body
i= 308 prin     =  make native! [["Outputs a valu  ->  make native! [["Outputs a valu
i= 343 max      =  make native! [["Returns the gr  ->  make native! [["Returns the gr
i= 365 exp      =  make native! [[{Raises E (the   ->  make native! [[{Raises E (the
```
Apparently `=?` compares some cached value used by natives and reports them as non-equal.

**To reproduce**

Run the script

**Expected behavior**

Should stay `same?`

**Platform version**
```
Red 0.6.4 for Windows built 25-Jan-2022/14:48:41+03:00  commit #dbbe6e0
```



Comments:
--------------------------------------------------------------------------------

On 2022-02-10T16:54:08Z, dockimbel, commented:
<https://github.com/red/red/issues/5065#issuecomment-1035159924>

    Without looking at the code, I guess it's caused by the generic comparator we use as default for many types which compares the `cell!` parts one by one. As all `any-function!` have an optional cache for their spec, that is not taken into account and gives then a wrong result.

--------------------------------------------------------------------------------

On 2022-02-15T17:17:39Z, dockimbel, commented:
<https://github.com/red/red/issues/5065#issuecomment-1040553436>

    I let you add a test for this one if you think it is worth it (I don't), just make it as light as possible.

--------------------------------------------------------------------------------

On 2022-02-15T17:37:18Z, hiiamboris, commented:
<https://github.com/red/red/issues/5065#issuecomment-1040572860>

    https://github.com/red/red/pull/5074

