
#4511: CHANGE arbitrarily thrashes hash! table
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4511>

**Describe the bug**

I was trying to replace O(n) `remove/part` within a big block with a O(1) `change`.
This script is supposed to give the same result for hash & block:
```
Red []

fs: [] loop n: 20 [append fs f: does []]

foreach type reduce [block! hash!] [
	r: collect [
		b: make type []
		repeat i n [append/dup b :fs/:i 3]
		repeat i n [
			s: b
			while [s: find/same s :fs/:i] [
				; remove s       ;) this works
				change s e: back tail b
				clear e
			]
			keep length? b
		]
	]
	print [type tab mold r]
]
```

Results however are not the same and also random. Here are 5 consecutive runs:
```
block   [57 54 51 48 45 42 39 36 33 30 27 24 21 18 15 12 9 6 3 0]
hash    [57 54 51 48 45 42 39 36 33 30 29 28 27 26 25 24 23 22 21 20]

block   [57 54 51 48 45 42 39 36 33 30 27 24 21 18 15 12 9 6 3 0]
hash    [57 54 51 48 45 42 39 36 33 30 29 28 27 25 24 23 22 21 19 18]

block   [57 54 51 48 45 42 39 36 33 30 27 24 21 18 15 12 9 6 3 0]
hash    [57 54 51 48 45 42 39 36 33 30 29 28 26 25 24 23 22 21 20 19]

block   [57 54 51 48 45 42 39 36 33 30 27 24 21 18 15 12 9 6 3 0]
hash    [57 54 51 48 45 42 39 36 33 30 27 26 24 23 21 20 19 18 17 16]

block   [57 54 51 48 45 42 39 36 33 30 27 24 21 18 15 12 9 6 3 0]
hash    [57 54 51 48 45 42 39 36 33 30 29 28 26 25 23 22 21 20 19 18]
```

**To reproduce**

Risk running the provided script above maybe :point_up_2:

Another variant uses integers :point_down: 
```
vs: [] repeat i n: 20 [append vs i]

foreach type reduce [block! hash!] [
	r: collect [
		b: make type []
		repeat i n [append/dup b :vs/:i 3]
		repeat i n [
			s: b
			while [s: find/same s :vs/:i] [
				; remove s       ;) this works
				change s e: back tail b
				clear e
			]
			keep length? b
		]
	]
	print [type tab mold r]
]
```
Result is wrong, but at least stable:
```
block   [57 54 51 48 45 42 39 36 33 30 27 24 21 18 15 12 9 6 3 0]    
hash    [57 54 51 48 45 42 39 36 33 30 29 28 26 24 22 21 20 19 18 17]
```

**Expected behavior**

Same as block: last item should be zero.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 8-Jun-2020/19:25:17+03:00 commit #3d23acd
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-12T07:15:43Z, qtxie, commented:
<https://github.com/red/red/issues/4511#issuecomment-643110595>

    The current implementation cannot handle this case properly. Another reason to merge PR https://github.com/red/red/pull/4026 😉

