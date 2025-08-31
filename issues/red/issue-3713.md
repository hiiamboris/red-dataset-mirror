
#3713: Malignant output from react/link
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3713>

**Describe the bug**

`react/link` should trim it's output to acceptable limits, like 100 chars. Otherwise every forgotten `none` and what have you stalls the execution considerably.

**To reproduce**

Try this:
```
view [
	base with [
		react/link/later func [f p] [f/offset/y: p/offset/y oops] [self parent]
	]
] 
```
It will spam just about 450 lines. In a real program this becomes many thousands of lines printed over minutes.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 5-Jan-2019/4:37:59+03:00 commit #1c0642e
```



