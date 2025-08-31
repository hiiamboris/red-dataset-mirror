
#192: EITHER expression not working as argument to a typed function call
================================================================================
Issue is closed, was reported by dockimbel and has 8 comment(s).
[status.problem] [type.wish] [Red/System]
<https://github.com/red/red/issues/192>

An `either` expression passed as argument to a typed function will have its return value corrupted by other arguments. 

Example:

```
foo: func [a [byte!] return: [byte!]][a]
print ["hello" either true [" world"][newline] foo lf]
```

will print `hello` instead of `hello world`.

The ARM emitter is more sensible to this issue than the IA-32 one, because of its need for passing memory data through registers before pushing them on stack. So, for simple use cases, the IA-32 emitter will generate correct code, but anyway, you should not rely on this construction for now in your programs until a fix or workaround is found. 

As a change to the semantics of `either` might be required to fix cleanly this issue, it might be postponed until Red/System full rewrite in Red.

A simple workaround for this issue exists right now: just assign the result of the `either` expression to a local variable and pass that variable as argument to the typed function.



Comments:
--------------------------------------------------------------------------------

On 2011-12-26T03:48:36Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/192#issuecomment-3272557>

    Note that this is unfortunate for dialects, as they are written with typed functions, and it will often be desirable to inline an EITHER.

--------------------------------------------------------------------------------

On 2012-09-24T20:18:49Z, iArnold, commented:
<https://github.com/red/red/issues/192#issuecomment-8833081>

    Why is there a colon after return? to make clear the return type, as this is Red/system?

--------------------------------------------------------------------------------

On 2012-09-24T20:25:34Z, dockimbel, commented:
<https://github.com/red/red/issues/192#issuecomment-8833299>

    You should ask such questions on one of Red discussion channels (AltME, IRC, FB,...), it is off-topic here.
    
    I will answer it (this time only): it is necessary to distinguish it from a function argument that would be named "return".

--------------------------------------------------------------------------------

On 2013-05-05T12:18:41Z, PeterWAWood, commented:
<https://github.com/red/red/issues/192#issuecomment-17450902>

    Wish moved to v2 wish list on wiki.

