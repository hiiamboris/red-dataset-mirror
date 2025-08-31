
#3072: [R/S] Some local variables of type function! are not captured locally
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3072>

The code below cannot be compiled because the local variable `f` being treated as global.
```
Red/System []

red-print!: alias function! [
	str		[c-string!]
	nl?		[logic!]
]

rs-print!: alias function! [
	str		[byte-ptr!]
	size	[integer!]
	unit	[integer!]
	nl?		[logic!]
]

ptr-array!: alias struct! [
	ptr		[int-ptr!]
]

red-prints: as ptr-array! 0
rs-prints: as ptr-array! 0

red-print: func [
	str		[c-string!]
	nl?		[logic!]
	/local
		p	[ptr-array!]
		f	[red-print!]
][
	p: red-prints
	f: as red-print! p/ptr
	f str nl?
]

rs-print: func [
	str		[byte-ptr!]
	size	[integer!]
	unit	[integer!]
	nl?		[logic!]
	/local
		p	[ptr-array!]
		f	[rs-print!]
][
	p: rs-prints
	f: as rs-print! p/ptr
	f str size unit nl?
]
```


