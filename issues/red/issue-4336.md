
#4336: INSERT/PART any-block! any-string! doesn't work
================================================================================
Issue is open, was reported by hiiamboris and has 12 comment(s).
[type.review] [type.design]
<https://github.com/red/red/issues/4336>

**Describe the bug**
```
>> append/part [] "abc" 1
== ["abc"]
```
Expected: `["a"]`

**To reproduce**

Here's a more thorough script:
```
test: func [s t expr] [
	print [
		"s:" pad mold s 6
		"t:" pad mold t 20
		pad mold expr 30
		"=>" mold do expr
	]
]
; foreach btype reduce [block! path!] [
; foreach btype reduce [block! hash! path!] [
foreach btype reduce to block! any-block! [
	; foreach stype reduce [string! file!] [
	foreach stype reduce to block! any-string! [
		foreach expr [
			[append/part t s at s i]
			[append/part t s i - 1]
			[head insert/part t s at s i]
			[head insert/part t s i - 1]
		][
			s: to stype "abc"
			t: make btype []
			repeat i 4 [test s t expr]
		]
	]
]
```
It will crash today however, because of #4335 

**Expected behavior**
```
s: "abc"  t: []                   [append/part t s at s i]       => [""]
s: "abc"  t: [""]                 [append/part t s at s i]       => ["" "a"]
s: "abc"  t: ["" "a"]             [append/part t s at s i]       => ["" "a" "ab"]
s: "abc"  t: ["" "a" "ab"]        [append/part t s at s i]       => ["" "a" "ab" "abc"]
s: "abc"  t: []                   [append/part t s i - 1]        => [""]
s: "abc"  t: [""]                 [append/part t s i - 1]        => ["" "a"]
s: "abc"  t: ["" "a"]             [append/part t s i - 1]        => ["" "a" "ab"]
s: "abc"  t: ["" "a" "ab"]        [append/part t s i - 1]        => ["" "a" "ab" "abc"]
... and so on for all tested datatypes ...
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Feb-2020/6:07:00+03:00 commit #bf15211
```



Comments:
--------------------------------------------------------------------------------

On 2020-03-14T05:40:35Z, qtxie, commented:
<https://github.com/red/red/issues/4336#issuecomment-599014883>

    Currently the `/part` refinement of `insert` and `append` only apply to any-block!. Other types will be treated as a single value. Seems it's the same in Rebol.
    
    Rebol2:
    ```
    >> head insert/part [] "abc" 1
    == ["abc"]
    ```

--------------------------------------------------------------------------------

On 2020-03-14T15:03:16Z, greggirwin, commented:
<https://github.com/red/red/issues/4336#issuecomment-599075808>

    A design choice, as this could also be a valid interpretation:
    ```
    >> append/part [] "abc" 1
    == [#"a"]
    >> append/part [] "abc" 2
    == [#"a" #"b"]
    ```
    And including `/only` could append as a string. Starts to get involved though, and harder to reason about.

--------------------------------------------------------------------------------

On 2020-03-14T15:30:23Z, hiiamboris, commented:
<https://github.com/red/red/issues/4336#issuecomment-599080191>

    @greggirwin if so, then `append [] "abc"` should also yield `[#"a" #"b" #"c"]` which is a breaking change.

--------------------------------------------------------------------------------

On 2020-03-14T15:48:29Z, greggirwin, commented:
<https://github.com/red/red/issues/4336#issuecomment-599083811>

    Good point. I was going based on the doc string "number of values" part. Funny how we can drive, and derive things each way.

--------------------------------------------------------------------------------

On 2020-03-14T15:57:04Z, 9214, commented:
<https://github.com/red/red/issues/4336#issuecomment-599085457>

    ```red
    >> append/only/part [a b] [c d e] 2
    == [a b [c d e]]
    ```
    I expected `[a b [c d]]`. By the same token:
    
    ```red
    >> append/part [] "abc" 1
    == [#"a"]
    >> append/part [] "abc" 2
    == [#"a" #"b"]
    >> append/only/part [] "abc" 2
    == ["ab"]
    ```
    
    I find it consistent with the usual meaning of `/only`.

--------------------------------------------------------------------------------

On 2020-03-14T16:08:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/4336#issuecomment-599087516>

    This part I agree with:
    ```
    >> append/only/part [a b] [c d e] 2
    == [a b [c d e]]  ;) should be [a b [c d]]
    ```
    The other examples are breaking changes. Although I'm not totally against it, it needs solid justification.

