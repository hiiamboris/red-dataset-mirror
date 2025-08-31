URL: <https://github.com/red/red/discussions/5524>
Date created: 2024-07-10T11:29:55Z

# Parse: thru any vs. thru some

These first two seem to be ok: 

```
parse [1 bye bye] [some word!]
; == false 
; (ok, because it can't pass the beginning integer)
```

```
parse [1 bye bye] [thru some word!]
; == true
; (ok, because thru passes the beginning integer) 
```



But what about this one:

```
parse [1 bye bye] [thru any word!]
; == false

```
`Any `should be more inclusive than `some`.  


## Comments

### hiiamboris commented at 2024-07-10T12:03:29Z:

`any` succeeds on zero matches as well, so `thru` also succeeds without advancing the input, then you have 3 more tokens left, and `parse` returns `false` indicating that it hasn't consumed all input

It's better to use our matrix rooms for such specific discussions, e.g. [red/parse](https://matrix.to/#/%23red_parse%3Agitter.im?via=gitter.im&via=matrix.org&via=matrix.freyachat.eu)

There's also a [ParSEE visual tool](https://codeberg.org/hiiamboris/red-spaces/src/branch/master/programs/README.md#parsee-parsing-flow-visual-analysis-tool-parsee-red) available that aims to help understand the parsing progress, give an overview and let you explore it step by step (good for more complex rules or rule dictionaries). Or the low-level `parse-trace` wrapper available in the runtime (good for simple rules like this one).

### greggirwin commented at 2024-07-10T18:06:04Z:

Red is more protective of infinite loops, but you still have to be careful with combinations of things that may not advance the input.

