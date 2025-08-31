# 

**Gist ID:** ddff7dec1d0bffe1e4ea6c74b4f192ee
**Created:** 2018-04-28T11:08:20Z
**Last updated:** 2018-04-28T12:42:26Z

## File: `flatten.red`

```Red
flatten: func [
	"Remove new-line markers from block, paren or hash"
	blk [any-list!]
	/deep "remove the markers also from sub-blocks etc."
][
	new-line/all blk off
	if deep [
		forall blk [
			if block? blk/1 [flatten/deep blk/1]
		]
	]
]
```

## Comments

No comments.
