
#5027: Global words in macros not having the right value
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5027>

**Describe the bug**

I've got the following script which inits a value in the preprocessor, then changes it
```
#if true [
	#do [abc: 0  print "Set to zero!"]
	#macro ['macro1] func [[manual] s e] [abc: 1000 ?? abc remove s]
	#macro ['macro2] func [[manual] s e] [?? abc remove s]
]
macro1
macro2
macro2
```
One would expect it to set `abc` to `0`, then to `1000` and leave at that. But somehow it gets set to `0` *again*, without printing "Set to zero!" line:
```
Set to zero!
abc: 1000
abc: 0
abc: 0
```

**To reproduce**

Run the provided script interpreted.

**Expected behavior**
```
Set to zero!
abc: 1000
abc: 1000
abc: 1000
```

**Platform version**
```
Red 0.6.4 for Windows built 22-Dec-2021/17:36:36+03:00  commit #328c904
```



Comments:
--------------------------------------------------------------------------------

On 2022-02-26T11:23:38Z, dockimbel, commented:
<https://github.com/red/red/issues/5027#issuecomment-1052036303>

    It's a binding issue with new rules created by manual macros, they somehow keep their binding to ancestor context.

--------------------------------------------------------------------------------

On 2022-02-26T14:22:33Z, dockimbel, commented:
<https://github.com/red/red/issues/5027#issuecomment-1052140902>

    The previous simple call to `bind` was not enough to bind the `function!` bodies embedded in the rules, so those bodies needs to be accessed and rebound one by one. Also, proper rebinding to `exec` was not always done.

