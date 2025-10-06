# Editing in console

Working in console is nice, but if you write some function that you think would be useful to save for later, it's not very straightforward. It's not hard, but if you don't know how, you're out of luck. So let's try to simplify it.

Ideally, fconsole should be able to switch to editor mode, that's not possible without full IO and `console://` port. Or it's possible, but only with custom console. But making line-oriented editor (even with preview) is entirely in the realm of current Red. We can try to write some functions on which such editor can be based.

## Saving

### MOLD-FUNCTION

```
mold-function: func [
	name
	/local output
][
	output: clear ""
	fn: get name
	append output rejoin [name ": ["]

]

```
