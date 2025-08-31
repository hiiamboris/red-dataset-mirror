# Differences between Red&#39;s 5 function types, and why does it distinguish them?

**Link:**
<https://stackoverflow.com/questions/55832308/differences-between-reds-5-function-types-and-why-does-it-distinguish-them>

**Asked:** 2019-04-24 14:18:52 UTC

------------------------------------------------------------------------

In Red, there are functions of datatypes `function!`, `op!`, `native!`,
`routine!` and `action!`. What are the differences between them? As far
as I know `function!` is used for user-defined functions and `op!` for
infix operators, and `routine!` for functions defined in `Red/System`,
but why is there a need for the other two?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 6) --- by 9214

### `function!`

As you\'ve guessed yourself, `function!`s are user-defined functions
that support refinements and typechecking, and can also contain embedded
docstrings.

Typically, `function!` values are created with `func`, `function`,
`does` and `has` constructors, and utilize so-called *spec* dialect;
but, in theory, nothing stops you from making your own constructors or
devising your own spec formats.

It\'s also worth noting that `function!`s fully support reflection.

### `op!`

`op!`s are infix wrappers on top of other 4 types of functions - they
take one value on the left and result of an expression on the right, and
they also take precedence other functions during evaluation.

`op!` values are limited to two arguments, don\'t support refinements,
and have a limited support for reflection (e.g. you can\'t inspect their
bodies with `body-of`).

### `routine!`

`routines!` exist in both realms of Red and Red/System (low-level
dialect on top of which Red runtime is build). Their specs are written
in *spec* dialect, but their bodies contain Red/System code. Oh, and
they support reflection.

Usually they are used for library bindings (like the SQL lib you\'ve
mentioned), interaction with runtime, or for performance bottlenecks
(Red/System is a compiled language, so rewriting perfomance-critial
parts of your app as a set of `routine!`s will give you a significant
boost, at the cost of mandatory compilation).

### `native!`

`native!`s are functions written in Red/System (for perfomance,
simplicity or feasibility reasons) and compiled down to native code
(hence the name). Not sure what else can be said about them, aside from
implementation details. `native!` aren\'t very user-facing, so you might
want to study Red\'s source code in case you have any questions left.

### `action!`

`action!`s are a standardized set of function written in Red/System
(just like `native!`s) that each datatype implements (or inherits) as
its \"method\". `action!` are polymorphic in a sense that they dispatch
on their first argument:

    >> add 1 2%
    == 1.02
    >> add 2% 1
    == 102%
    >> append [1] "2"
    == [1 "2"]
    >> append "1" [2]
    == "12"

In mainstream languages this typically looks like `"1".append([2])` or
something like that.

Distinction between `action!`s and `native!`s boils down to a design
choice:

-   you can have as many `native!` as you want, but `action!`s, for
    efficiency, have a fixed-size dispatch table (which means that
    maximum number of `action!`s per datatype is limited; minimum number
    is two: `make` \[to create value\] and `mold` \[to serialize value
    to `string!`\]).

-   logically, `action!`s are organized around datatype to which they
    belong, in one file, while `native!`s aren\'t really concerned with
    datatypes, and implement control flow, trigonometric functions,
    operations on sets, etc.

------------------------------------------------------------------------

Coincidentially, just recently we have a [similar
discussion](https://gitter.im/red/help?at=5cb598aebd70a40d5f5a6481){rel="noreferrer"}
about `action!`s and `native!`s in our community chat, which you might
want to read. I can also recommend to skim thru Rudolf Meijer\'s [Red
specification](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc){rel="noreferrer"}
draft, and, of course, [official reference
documentation](https://doc.red-lang.org/en/datatypes.html){rel="noreferrer"}.

As for \"why\" in your question - distinction between 5 types is just an
implementation detail, inherited from Rebol. Logically, they all
implement what you might call a \"function\" from conceptual standpoint,
and fall into `any-function!` camp.

------------------------------------------------------------------------

### Answer (score: 3) --- by HostileFork says dont trust SE

While to a caller it may seem similar to run a function whose body is a
BLOCK! of code to one which is implemented as native instructions\...the
implementation has to go down a different branch.

I don\'t know precisely what Red does in the compilation case, the
interpreter case for Rebol2 and Red are similar. These different types
are effectively part of a big switch() statement. If it looks in the
cell describing the \"function\" and finds TYPE_NATIVE it knows to
interpret the cell\'s contents as containing a native function pointer.
If it finds TYPE_FUNCTION, it knows to pick apart the cell as containing
a pointer to a block of code to execute:

[https://github.com/red/red/blob/cb39b45f90585c8f6392dc4ccfc82ebaa2e312f7/runtime/interpreter.reds#L752](https://github.com/red/red/blob/cb39b45f90585c8f6392dc4ccfc82ebaa2e312f7/runtime/interpreter.reds#L752){rel="nofollow noreferrer"}

Now I myself would agree with your line of questioning. e.g. is this
leaking an implementation detail to the user\--who shouldn\'t be
concerned with this facet in the type system?

But for what it is worth, there is a catch-all typeset called
ANY-FUNCTION!:

    >> any-function!
    == make typeset! [native! action! op! function! routine!]

And you might think of that as \"anything that obeys a function-like
interface for calling\". There are some complexities however, as OP!
gets its first argument from the left\...so that really is a matter of
concern from an interface perspective.

Anyway\... a NATIVE! (body is built as native code into the executable)
vs. a FUNCTION! (body is a block of Red code run by interpretation or
compilation) is just one distinction. A ROUTINE! is a facade built to
interact with a DLL/library [a la
FFI](https://en.wikipedia.org/wiki/Foreign_function_interface){rel="nofollow noreferrer"}
that did not have a-priori knowledge of Red. An ACTION! is a very
oversimplified attempt at what are called in other languages
[Generics](https://en.wikipedia.org/wiki/Generic_function){rel="nofollow noreferrer"}.
An OP! just gets its first argument from the left.

Point being that each of these might feel the same to a caller (except
OP!), but the implementation has to do something different. The way it
knows to do something different is via a type byte in a value cell.
That\'s how Rebol2 did it\--and Red followed Rebol2 fairly closely\--so
that\'s how it also does it. It means that any novel concept of what
provides the implementation behind a function requires a new datatype,
and it\'s probably not the greatest idea.

*Comment by nickkoro:* Thanks for your answer.

*Comment by HostileFork says dont trust SE:* \@nickkoro I feel I
answered your original question (\"Why does Red have 5 different types
of functions?\") better than the one you ultimately accepted, which adds
the answer as a footnote (and glosses the difficulty of OP! when lumping
these together). But that\'s based on my reading. If his answer was what
you were looking for, then I changed the title of your question to match
what he actually answered\--where inventorying the function types and
adding \"why\" as a footnote would have been appropriate.

*Comment by nickkoro:* You\'re right that the title is misleading, I\'ll
change it. I was looking for an overview of the differences (which imho
the accepted answer covers best) **and** for why this decisions where
made (which you covered).

------------------------------------------------------------------------

### Answer (score: 0) --- by Lee

Red is based on Rebol an so has the same types.

-   **function!** is an user defined function defined in red
-   **native!** is an function in machinecode
-   **op!** is an infix operator written in machinecode
-   **action!** is an polymorphic function in machinecode
-   **routine!** is an function in imported from dynamic library

*Comment by nickkoro:* Thank you for your response, but I still not get
the difference between a `native!` and a `routine!`. You can, in fact,
write `routines!` yourself (have done that for a small private mysql
lib) and they don\'t have to be imported. Futhermore, afaik you can
define `op!` in interpreted Red to. And what do you mean by a
\"polymorphic function\"?

------------------------------------------------------------------------

## Comments on question
