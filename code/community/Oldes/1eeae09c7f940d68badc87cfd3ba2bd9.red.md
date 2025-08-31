# typed-array

**Gist ID:** 1eeae09c7f940d68badc87cfd3ba2bd9
**Created:** 2017-09-08T15:09:31Z
**Last updated:** 2017-09-08T15:09:31Z

## File: `typed-array.reds`

```Red
Red/System [
  title:   "Typed array"
  purpose: "Low level struct for holding typed data"
]

#enum typed-array-types! [
	TYPE_FLOAT32!:  1
] 

typed-array!: alias struct! [
	type   [typed-array-types!]
	size   [integer!]
	head   [byte-ptr!] ;points to next value (just a sugar as casting is not needed)
	data   [integer!]  ;real data starts here
]

make-f32-buffer: func[
	[variadic]
	count   [integer!]
	list    [pointer! [float!]]
	return: [typed-array!]
	/local pad array bytes buffer n 
][
	;pading result size to multiplies of 4
	pad: count // 4
	if pad > 0 [pad: 4 - pad]
	bytes: 12 + 4 * (count + pad)

	array:  as typed-array! allocate bytes
	array/type: TYPE_FLOAT32!
	array/size: count
	array/head: as byte-ptr! :array/data
	buffer: as pointer! [float32!] :array/data

	;conver float values into float32 and write them to buffer
	n: 0
	while [n < count][
		n: n + 1
		buffer/n: as float32! list/n
	]
	;zero the padded bytes if needed
	while [pad > 0][
		n: n + 1
		buffer/n: as float32! 0.0
		pad: pad - 1
	]
	array
]

```

## Comments

No comments.
