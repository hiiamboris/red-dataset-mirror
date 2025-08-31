
#5119: `find/last/skip` cannot find items in other columns than the last
================================================================================
Issue is open, was reported by hiiamboris and has 8 comment(s).
[type.design]
<https://github.com/red/red/issues/5119>

**Before submitting**

Using this code:
```
b: [a b c a b c]
foreach x [a b c] [
	forall b [
		if p: find/last/skip b x 3 [
			print [mold p "found" x "from" mold b]
		]
	]
	if p: find/last/skip tail b x 3 [
		print [mold p "found" x "from []"]
	]
]
```
In R2 (correct - all columns can be searched for):
```
[a b c] found a from [a b c a b c]
[a b c] found a from [a b c]
[b c] found b from [b c a b c]
[b c] found b from [b c]
[c] found c from [c a b c]
[c] found c from [c]
```
Red (broken - only can search for `c`):
```
[c] found c from [a b c a b c]
[c] found c from [b c a b c]
[c] found c from [c a b c]
[c] found c from [a b c]
[c] found c from [b c]
[c] found c from [c]
```
R3 (broken - ignores columns completely):
```
[a b c] found a from [a b c a b c]
[a b c] found a from [b c a b c]
[a b c] found a from [c a b c]
[a b c] found a from [a b c]
[a b c] found a from [b c]
[a b c] found a from [c]
[a b c] found a from []
[b c] found b from [a b c a b c]
[b c] found b from [b c a b c]
[b c] found b from [c a b c]
[b c] found b from [a b c]
[b c] found b from [b c]
[b c] found b from [c]
[b c] found b from []
[c] found c from [a b c a b c]
[c] found c from [b c a b c]
[c] found c from [c a b c]
[c] found c from [a b c]
[c] found c from [b c]
[c] found c from [c]
[c] found c from []
```

**Expected behavior**

As in R2

**Platform version**
```
Red 0.6.4 for Windows built 4-Apr-2022/15:09:55+03:00  commit #28dad01
```



Comments:
--------------------------------------------------------------------------------

On 2022-04-11T08:03:36Z, qtxie, commented:
<https://github.com/red/red/issues/5119#issuecomment-1094677715>

    The rules of `/skip` in Red are as follows:
    
    ### forward searching
    Start from the current position, searching to tail. Treat the first value as the key. It's the same as R2.
    ```
    >> find/skip [a b c a b c] 'a 3             ;-- example 1
                  ^start position
    == [a b c a b c]
    >> find/skip at [a b c a b c] 4 'a 3        ;-- example 2
                           ^start position
    == [a b c]
    >> find/skip [a b c a b c] 'b 3             ;-- example 3
                  ^start position
    == none
    ```
    In example 3, as the skip (column) size is 3, we always compare 'a with 'b, so find nothing.
    ### backward searching
    Start from the current position, searching to head. Treat the first value as the key.
    ```
    >> find/last/skip [a b c a b c] 'c 3         ;-- example 1
                                 ^start position
    == [c]
    >> find/last/skip [a b c a b c] 'b 3         ;-- example 2
                                 ^start position
    == none
    ```
    In example 2, as the skip (column) size is 3, we always compare 'c with 'b, so find nothing.

--------------------------------------------------------------------------------

On 2022-04-11T08:48:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/5119#issuecomment-1094730049>

    Hint: /last in R2 doesn't start from tail. It starts from /head + max integer number of /skips possible.

--------------------------------------------------------------------------------

On 2022-04-11T08:49:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/5119#issuecomment-1094733238>

    I find R2 rules much more useful and predictable.

--------------------------------------------------------------------------------

On 2022-09-27T16:51:46Z, hiiamboris, commented:
<https://github.com/red/red/issues/5119#issuecomment-1259785096>

    See also https://github.com/red/red/issues/5096

