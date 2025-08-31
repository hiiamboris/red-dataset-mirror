# Doc strings for datatypes, maybe to add to `help`

**Gist ID:** 7b650feaf5bffff7480f7b0f5fb4f3c3
**Created:** 2017-05-16T23:37:28Z
**Last updated:** 2017-05-16T23:37:28Z

## File: `datatype-doc-strings.red`

```Red
datatype-doc-strings: [
	action!         "Polymorphic native datatype function"
	binary!         "Series of byte values"
	bitset!         "Set of bit flags, used with parse as charsets"
	block!          "Series of heterogeneous values"
	char!           "Single unicode character"
	datatype!       "Value category, determines form and behavior"
	date!           "Combined date, time, and timezone"
	decimal!        "Accurate decimal value, no floating point error"
	email!          "Email address"
	error!          "Actionable error object"
	event!          "User interface event"
	file!           "Relative or absolute file name"
	float!          "Floating point value"
	function!       "Function written in Red code"
	get-path!       "Evaluated path, up to final (unevaluated) result"
	get-word!       "Unevaluated word (variable)"
	handle!         "Opaque internal value"
	hash!           "Block-like hash table, for fast lookups"
	image!          "Rectangular image with RGB data and alpha channel"
	integer!        "Integer"
	issue!          "Marker word/hashtag"
	lit-path!       "Literal path value"
	lit-word!       "Literal word value"
	logic!          "Boolean true/false, yes/no, on/off"
	map!            "Name-value pairs with a literal form"
	module!         "Context with a specified public interface"
	money!          "Financially accurate decimal value"
	native!         "Standard function implemented in Red/System"
	none!           "Empty value"
	object!         "Group of names with values, a.k.a. Context"
	op!             "Infix operator"
	pair!           "Integral 2D point or size"
	paren!          "Automatically evaluated block"
	path!           "Refinements to functions, objects, files"
	percent!        "Per-hundred scaled decimal"
	port!           "Data or I/O channel"
	refinement!     "Variation of meaning or location"
	routine!        "Red/System function defined in Red code"
	set-path!       "Defines a path's reference value"
	set-word!       "Defines a word's reference value"
	string!         "Series of char! values"
	tag!            "Markup string (HTML or XML), in angle brackets"
	time!           "Time of day or duration"
	tuple!          "Sequence of small integers (colors, versions, IP)"
	typeset!        "Set of datatypes"
	unset!          "No value returned or set"
	url!            "Uniform resource locator or identifier"
	vector!         "High performance arrays (Red/System datatype)"
	word!           "Symbol that may be used to reference values"
]
```

## Comments

No comments.
