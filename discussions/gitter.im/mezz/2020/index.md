# Archived messages from: [gitter.im/red/mezz](/gitter.im/red/mezz/) from year: 2020

## Monday 4th May, 2020

toomasv

[07:43](#msg5eafc7a53d58de7a38f2b640)What do ya all think about generalizing `split`?

```
split: func [
	{Break series into pieces using the provided delimiter(s)}
	series [series!] "Series to break up"
	dlm [char! string! bitset! block!] "Delimiter (block! is parse rule)" 
	/local _
][
	parse/case series [
		collect any [
			keep copy _ [to [dlm | end]]
			opt dlm
		]
	]
]
```

```
>> split "abcdef" #"c"
== ["ab" "def"]
>> split "abcdef" "cd"
== ["ab" "ef"]
>> split "abcdef" charset "cd"
== ["ab" "def"]
>> split [a b c d e f] ['c]
== [[a b] [d e f]]
>> split [a b c d e f] ['c 'd]
== [[a b] [e f]]
>> split [a b c d e f] ['c | 'd]
== [[a b] [d e f]]
>> split [1 2 3 4 5] [quote 3]
== [[1 2] [4 5]]
>> split [a b 3 cd] [number!]
== [[a b] [cd]]
>> split [a = b + c] ['=]
== [[a] [b + c]]
```

[07:56](#msg5eafca910b23797ec05ebf35)^ Wrong lines there:

```
>> split "abcdef" charset "cd"
== ["ab" "" "ef"]
>> split [a b c d e f] ['c | 'd]
== [[a b] [] [e f]]
```

xqlab

[08:22](#msg5eafd0ad5cd4fe50a3eab130)I support that

toomasv

[08:59](#msg5eafd9695cd4fe50a3eac675)Profiling shows it is also a bit faster on string splitting.

endo64

[13:38](#msg5eb01ae65cd4fe50a3eb6e3e)Looks good!

greggirwin

[20:58](#msg5eb081ecf0377f163168b0e8)I want `split` to be like the one in R3, but improved. Full disclosure being that I designed and developed with with @giesse.
