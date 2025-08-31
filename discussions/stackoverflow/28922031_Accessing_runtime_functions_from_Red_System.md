# Accessing runtime functions from Red/System

**Link:**
<https://stackoverflow.com/questions/28922031/accessing-runtime-functions-from-red-system>

**Asked:** 2015-03-08 01:17:12 UTC

------------------------------------------------------------------------

So the issue came up while experimenting with marshaling values back and
forth between Red and Red/System. I would like to access the guts of an
object passed to a routine.

I had noticed that there are functions in the Red Runtime for handling
things like this, get-values, get-words, etc in the object context.
There is a file in the runtime sources called
[`object.reds`](https://github.com/red/red/blob/7ff7458999b90d5f38952939fd9f95c5cdbb759e/runtime/datatypes/object.reds){rel="nofollow"}

How do I utilize these? Can I utilize these? Is there a way to access
them without re-including (and by extension compiling) a copy of the
(already included) runtime into my app?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by earl

You can just call these from inside Red/System routines right away. No
additional include is necessary. Here\'s a brief example:

    Red []

    get-object-size: routine [
        obj [object!]
        return: [integer!]
    ] [
        object/get-size obj
    ]

    print get-object-size object [foo: 42 bar: 99]

When you compile and run this, it will eventually output `2`.

------------------------------------------------------------------------

### Answer (score: 1) --- by Rudolf W. Meijer

In general, for each Red datatype there is a Red/System file in the
sources (see the
[repository](https://github.com/red/red/tree/master/runtime/datatypes){rel="nofollow"})
which defines a `context` whose name is the same as that datatype
without the `!` (except for `context!` and `function!`, where a `_` is
prefixed to avoid name clashes). Within such a `context`, there are
functions defined for each of the `actions` on values of that type, as
well as auxiliary functions that may be useful within routines. However,
I would imagine that the auxiliary functions, not being tied to the
language specification, are not guaranteed to be there as the
implementation evolves. Thus I would caution against relying on them too
much.

------------------------------------------------------------------------

## Comments on question

*Comment by earl:* Please add a short code example to illustrate what
you are trying to achieve.
