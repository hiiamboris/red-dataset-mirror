URL: <https://github.com/hiiamboris/red-formatting/discussions/19>
Date created: 2021-08-21T12:41:01Z

# The missing `format-binary`

See https://github.com/hiiamboris/red-formatting/discussions/18#discussioncomment-1215697
Proposed spec:
```
func [
	"Format binary data as multiline space-delimited hex string"
	binary [binary!]
	digits [integer!] "Number of closely standing hex digits per group"
	groups [integer!] "Number of groups per line"
	/swap "Reverse bytes within each group (to swap endianness)"
]
```
/swap is supposed to convert things like `1234 5678` into `3412 7856`. 
`digits` and `groups` are positive integers.


## Comments

### greggirwin commented at 2021-08-22T20:34:22Z:

In the case of endianness, since we have a default in Red, I'd go with a more explicit name. `/swap` is nice and short, but leaves a lot of room for doubt. Even `big-endian` is more useful in some cases (and completely expliclit), while `network-order` has domain meaning. Then we have the question of whether it means to adjust the output or determines the expected input format. Semantics there.

