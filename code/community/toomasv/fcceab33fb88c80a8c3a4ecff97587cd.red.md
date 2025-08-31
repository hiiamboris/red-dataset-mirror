# Shorthand syntax for range 

**Gist ID:** fcceab33fb88c80a8c3a4ecff97587cd
**Created:** 2018-06-12T06:12:04Z
**Last updated:** 2018-06-17T07:15:51Z

## File: `short-range.red`

```Red
Red [
	Author: "Toomas Vooglaid"
	Date: "2018-06-13"
	File: %short-range.red
	Purpose: "Shorthand syntax for range blocks"
	Licence: "Free usage"
]
system/lexer/pre-load: func [source part /local var from to by map blk len words? s e][
	var: charset [#"-" #"0" - #"9" #"a" - #"z" #"A" - #"Z"]
	map: func [b f][forall b [set b/1 f get b/1] b]
	get-block: func [from to by /local blk len][
		blk: make block! len: to - from / by + 1 
		repeat i len [append blk i - 1 * by + from]
	]
	parse source [q:
		some [
			ahead [some var ".."]
			s: [copy from some var ".." copy to some var (by: 1) opt [#"|" copy by some var]] e: (
				words?: no
				map [from to by] func [x][any [attempt [to-integer x] also x words?: yes]] 
				change/part s either words? [
					form reduce ['get-block from to by]
				][
					mold get-block from to by
				] e
			) 
		|	skip
		]
	]
]

```

## Comments

### @toomasv on 2018-06-12T06:13:32Z

Examples:
```
foreach i 0..10|2 [print i]
0
2
4
6
8
10

>> 10..-5|-2
== [10 8 6 4 2 0 -2 -4]

>> f: does [foreach i a..b|c [print i]]
== func [][foreach i get-block a b c [print i]]
>> a: 5 b: 15 c: 3 f
5
8
11
14

>> a: 15 b: 5 c: -3 f
15
12
9
6
```

