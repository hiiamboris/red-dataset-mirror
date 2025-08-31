# get arity of any word or path

**Gist ID:** 5f85edba139fc88a5eb0ee9b7b30bc6b
**Created:** 2018-05-02T09:48:54Z
**Last updated:** 2021-04-12T17:50:52Z

## File: `arity.red`

```Red
arity?: func [p [word! path!] /local p2] [
	either word? p [
		preprocessor/func-arity? spec-of get :p
	][
		; path format: obj1/obj2.../func/ref1/ref2...
		; have to find a point where in that path a function starts
		; i.e. p2: obj1/obj2.../func
		; and the call itself is: func/ref1/ref2...
		p2: as path! clear []		; reuse the same block over and over again
		until [
			append  p2  pick p 1 + length? p2
			; stupid get won't accept paths of single length like [change], have to work around
			any-function? get either 1 = length? p2 [p2/1][p2]
		]
		preprocessor/func-arity?/with  (spec-of get either 1 = length? p2 [p2/1][p2])  (at p length? p2)
	]
]


```

## Comments

No comments.
