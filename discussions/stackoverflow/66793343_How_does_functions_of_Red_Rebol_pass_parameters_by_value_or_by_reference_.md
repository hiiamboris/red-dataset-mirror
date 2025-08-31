# How does functions of Red/Rebol pass parameters, by value or by reference?

**Link:**
<https://stackoverflow.com/questions/66793343/how-does-functions-of-red-rebol-pass-parameters-by-value-or-by-reference>

**Asked:** 2021-03-25 05:00:01 UTC

------------------------------------------------------------------------

I\'m puzzled by the result of the following two codes:

**Code1:**

    >> f: func [x][head insert x 1]
    == func [x][head insert x 1]
    >> a: [2 3]
    == [2 3]
    >> f a
    == [1 2 3]
    >> a
    == [1 2 3] ;; variable a is destroyed

**Code2:**

    >> g: func [x y][x: x + y]
    == func [x y][x: x + y]
    >> c: 1 d: 2
    == 2
    >> g c d
    == 3
    >> c
    == 1
    >> d
    == 2
    ;;variable c and d keep their original values

My question is: how does functions in Red/Rebol get their arguments, by
value or by reference?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by 9214

That\'s a good question. And the answer is: parameters are passed by
value, but some parameters may contain references within them.

Every value in Rebol/Red is represented as a boxed structure of uniform
size, often called a *slot* or a *cell*. This structure is logically
divided into 3 parts: header, payload and extra.

      ┌─────────┐
      │ header  │
      ├─────────┤ Historically, the size of the value slot is 4 machine pointers in size,
      │ payload │ 1 for header, 1 for extra, and 2 for payload.
      │         │ E.g. on 32-bit systems that's 128 bits, or 16 bytes.
      ├─────────┤ 
      │ extra   │
      └─────────┘

-   The header contains various meta-information that helps to identify
    the value that payload contains, the most important piece is a type
    tag, or, in Rebol\'s parlance, a *datatype ID*.
-   The payload contains the data representation of some value, such as
    numbers, strings, characters, etc.
-   The extra part serves as a space reserved for optimizations (e.g. a
    cache) and stashing data that doesn\'t fit into the payload.

Now, value slots have uniform size, and, naturally, some data simply
cannot fit in them fully. To address that, value slots can contain
*references* (basically a pointer with an extra layer of indirection, to
make data garbage-collectible and shareable between multiple slots) to
external *buffers*.

      ┌─────────┐
      │ header  │
      ├─────────┤
      │ payload │ --→ [buffer]
      │         │
      ├─────────┤
      │ extra   │
      └─────────┘

Values that fit into the value slot (such as `scalar!`) are called
*direct*, and values that don\'t (such as `series!`) are called
*indirect*: because references within them introduce a level of
indirection between the value slot and the actual data. For example,
[here](https://github.com/red/red/blob/6378183233387d79c0b514511923c6cf51e42691/runtime/datatypes/structures.reds){rel="nofollow noreferrer"}
is how various slot layouts are defined in Red.

Content of the value slot is simply a bunch of bytes; how they are
interpreted by the runtime depends on the datatype ID in the header.
Some bytes might be just literals, and others might be indirect pointers
to data buffers. Passing parameters to a function just copies these
bytes, regardless of what they mean. So, both literals and references
are treated the same in this regard.

So, if you have a value slot that internally looks like this:

    ┌────────┐
    │DEADBEEF│ header
    ├────────┤
    │00000000│ payload
    │FACEFEED│
    ├────────┤
    │CAFEBABE│ extra
    └────────┘

Then, say, `FACEFEED` can be a signed integer `-87097619`, or
varied-size bit-fields packed together, or it can be a machine pointer:
that depends on what datatype ID in the header (e.g. `EF` byte) ascribes
to it.

When value slot is passed as a parameter to a function, all of its bytes
will simply be copied over onto the evaluation stack, regardless of what
they encode or represent. For direct values the logic is
straightforward: if the parameter is modified within the function, the
original value is left untouched, because it\'s just a copy. That\'s
what your 2nd example is all about.

     Parameter        Stack
    ┌────────┐      ┌────────┐
    │DEADBEEF│      │DEADBEEF│
    ├────────┤      ├────────┤
    │00000000│      │00000000│ Both represent the same integer -87097619.
    │FACEFEED│      │FACEFEED│ ← You modify this one, with no effect on the other.
    ├────────┤      ├────────┤
    │CAFEBABE│      │CAFEBABE│
    └────────┘      └────────┘

But with indirect values it\'s more interesting. They are copied over
verbatim too, but that makes two copies share the same references to a
single buffer (remember that bytes representing reference are the same
in both slots). So, when you modify a buffer via one (e.g. `insert`
element at the head), the other reflects the change too.

     Parameter        Stack
    ┌────────┐      ┌────────┐
    │DEADBEEF│      │DEADBEEF│
    ├────────┤      ├────────┤
    │00000000│      │00000000│ Both refer to the same buffer (same machine pointers!)
    │FACEFEED│──┐───│FACEFEED│ 
    ├────────┤  │   ├────────┤
    │CAFEBABE│  │   │CAFEBABE│
    └────────┘  │   └────────┘
                ↓
          [b u f f e r] ← You modify the content of the buffer.

Returning to your 1st example:

    >> f: func [x][head insert x 1]
    == func [x][head insert x 1]
    >> a: [2 3]
    == [2 3]
    >> f a
    == [1 2 3]
    >> a
    == [1 2 3] ;; variable a is destroyed

Simplifying quite a bit, this is how it looks like under the hood:

           value slot               buffer     value slot (parameter on stack)
    <word a in global context> --→ [1 2 3] ←-- <word x in function's context>

Naturally, there are ways to clone value slot *and* a buffer to which it
refers: this is what `copy` does.

    >> f: func [x][head insert x 1]
    == func [x][head insert x 1]
    >> a: [2 3]
    == [2 3]
    >> f copy a
    == [1 2 3]
    >> a
    == [2 3]

Diagrammatically (again, simplifying quite a bit):

    value slot          buffer
         <x>     --→   [1 2 3]
         <a>     --→   [2 3]

Series values (such as blocks) also contain another piece of data in
their payload: an index.

    >> at [a b c d] 3 ; index 3, buffer → [a b c d]
    == [c d]

When passing block as a parameter, its index is copied over too, but
unlike data buffer, it is not shared between the two value slots.

     Parameter        Stack
    ┌────────┐      ┌────────┐
    │DEADBEEF│      │DEADBEEF│
    ├────────┤      ├────────┤
    │00000000│      │00000000│ Suppose that 0's here are an index.
    │FACEFEED│──┐───│FACEFEED│ Modifying this one won't affect the other.
    ├────────┤  │   ├────────┤
    │CAFEBABE│  │   │CAFEBABE│
    └────────┘  │   └────────┘
                ↓
          [b u f f e r]

So:

    >> foo: func [x][x: tail x] ; tail puts index, well, at the tail
    == func [x][x: tail x]
    >> y: [a b c]
    == [a b c]
    >> foo y
    == [] ; x is modified
    >> y
    == [a b c] ; y stays the same

*Comment by Maciej Łoziński:* 9214 your SO answers are a hidden
goldmine. Kudos!

*Comment by lyl:* Perfect job! \@9214 And different methods of passing
args of function in accordance with different data type may cause
inconformity and unexpected side-effect. Great attention has to be paid
for when coding. Is this good deed?

*Comment by 9214:* \@lyl there are no different methods of argument
passing, to be precise. It\'s all uniform, pass-by-value, copying of
value slots onto the evaluation stack. But, yes, for newcomers
unfamiliar with this aspect of the language it causes a great deal of
confusion. The more you get familiar with it, the more you start
leveraging such mutability to your advantage in an idiomatic manner.
Besides, `copy`ing everything by default would severely degrade the
performance.

------------------------------------------------------------------------

## Comments on question

*Comment by endo64:* Beside \@9214\'s great explanation, check this out
as well:
[github.com/red/red/wiki/...](https://github.com/red/red/wiki/%5BDOC%5D-Why-you-have-to-copy-series-values){rel="nofollow noreferrer"}

*Comment by lyl:* Many thanks \@endo64 for this useful info.
