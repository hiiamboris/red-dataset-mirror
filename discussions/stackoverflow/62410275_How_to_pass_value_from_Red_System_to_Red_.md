# How to pass value from Red/System to Red?

**Link:**
<https://stackoverflow.com/questions/62410275/how-to-pass-value-from-red-system-to-red>

**Asked:** 2020-06-16 13:58:06 UTC

------------------------------------------------------------------------

I need to pass the value that I generate in Red/System to Red. I
discovered docs but did not find an example of how to use it. Here is my
code:

    Red []

    #system [   
        data!: alias struct! [
            a   [integer!]
            b   [c-string!]
        ] 

        data: declare data!

        _foo: func [return: [data!]]
        [
            data/a: 123
            data/b: "Hello"
            return data
        ]

    ]

    sqlite: context
     [

        my-red-block: []; I want to place here: 123 "Hello"

        foo: routine [
            /local
            x [data!]
        ]
        [
            x: _foo
            ; next line do now work
            ; push my-red-block x/a
        ]
     ]

    view [button "Select" [sqlite/foo]] 

`my-red-block` here is Red `block` that I want to fill with data from
Red/System part.

[https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#routine-type](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#routine-type){rel="nofollow noreferrer"}

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by 9214

### Intro

Red uses data stack to pass arguments and return the result. Each value
on the stack is a boxed structure 4 platform pointers in size and may
contain references to external buffers; this means that you need to
construct them and push them on a stack, although some primitive
Red/System types (like e.g. `logic!` or `integer!`) are promoted
automatically if you return them.

In your case, however, usage of the stack is not necessary, as you want
to allocate values directly in a block. Experience with low-level
programming and knowledge of
[Red/System](https://static.red-lang.org/red-system-specs.html){rel="nofollow noreferrer"}
with Red [runtime
API](https://github.com/red/red/tree/master/runtime){rel="nofollow noreferrer"}
are the essential prerequisites for this task. So let\'s take your
example and go through it step by step.

### Unpacking

1.  You have a block and you want to append two values to it, `123` and
    `"Hello"`. Suppose you want to do that from Red/System. For that, we
    need to write a routine.

        list: []
        foo: routine [][...]

2.  Inside this routine, you need to get hold of the block referenced by
    `list` word. The hard way to do that is to instantiate a symbol and
    look up the value in global context by its ID:

        list: []

        foo: routine [
            /local
                blk [red-block!]
        ][
            blk: as red-block! _context/get-global symbol/make "list"
        ]

    Passing `list` as an argument would be more reasonable, but I\'ll
    keep it as-is for educational purposes.

3.  Now we want to append `123` to this block. There\'s
    `block/rs-append` function that does exactly that, but it accepts a
    boxed argument. So we need to box `123` ourselves first.

    1.  [This](https://github.com/red/red/blob/7509ffd29769d1254dc8a9787d3972b5e4b34e85/runtime/datatypes/structures.reds#L159){rel="nofollow noreferrer"}
        is how boxed integer looks like; as you can see, it\'s simply
        32-bit `123` value + slot header and padding. We can construct
        and initialize such structure ourselves:

            int: stack/push*         ; allocate slot on data stack
            int/header: TYPE_INTEGER ; set datatype
            int/value: 123           ; set value

        Fortunately, Red runtime already covers that with `integer/box`
        function that takes a Red/System `integer!` and returns a boxed
        `red-integer!` struct:

            integer/box 123

    2.  Now we need to append this boxed integer to a block.
        Intuitively, we can check [`block.reds`
        definitions](https://github.com/red/red/blob/master/runtime/datatypes/block.reds){rel="nofollow noreferrer"}
        and find `block/rs-append` that matches our requirements:

            block/rs-append blk as red-value! integer/box 123

        At the end of this step, we have:

    ```{=html}
    <!-- -->
    ```
        list: []

        foo: routine [
            /local
                blk [red-block!]
        ][
            blk: as red-block! _context/get-global symbol/make "list"
            block/rs-append blk as red-value! integer/box 123
        ]

4.  Now we want to append a `"Hello"` string, but first we need to
    construct it. Red strings support UTF-8 and use fixed-size internal
    encoding (1, 2 or 4 bytes per character, depending on the maximum
    codepoint size); that\'s a lot of details to get right manually, so
    the typical way of constructing such string is by converting it from
    `c-string!`.

        list: []

        foo: routine [
            /local
                blk [red-block!]
                str [c-string!]
        ][
            blk: as red-block! _context/get-global symbol/make "list"
            block/rs-append blk as red-value! integer/box 123
            str: "Hello"
        ]

    Examining [`string!` datatype runtime
    definitions](https://github.com/red/red/blob/master/runtime/datatypes/string.reds){rel="nofollow noreferrer"}
    you will notice some handy wrappers prefixed with `load`; this is a
    convention indicating that such function can be used to construct
    (i.e. \"load\") high-level Red value from low-level Red/System
    parts, in our case `red-string!` from `c-string!`. Since we want to
    construct it at the tail of a block, we can use `string/load-in`:

        str: "Hello"
        string/load-in str length? str blk UTF-8

    Note that I use `length?` instead of `size?` to exclude
    NUL-terminated byte.

### Conclusion

This is it. At the end of the day we can tidy the code a little bit and
check if it works at all:

    Red [Note: "compile in release mode (-r flag)"]

    list: []

    foo: routine [
        /local
            blk [red-block!]
            int [integer!]
            str [c-string!]
    ][
        blk: as red-block! _context/get-global symbol/make "list"
        int: 123
        str: "Hello"

        block/rs-append blk as red-value! integer/box int
        string/load-in str length? str blk UTF-8
    ]

    foo
    probe list

Compiling this script in release mode and executing the resulting binary
from the shell gives us the expected result:

    [123 "Hello"]

------------------------------------------------------------------------

Needless to say, this all might look quite overwhelming to newcomers:
while both Red and Red/System have decent documentation and learning
resources, their bridging via runtime interaction is uncharted
territory. The reason for that is because the project is evolving and
the API is not yet stabilized, so, at the moment, it\'s not the right
time to document it and cast the design decisions in stone. Experienced
developers can get their bearings pretty quickly though, but that
requires a solid conceptual understanding of Red\'s evaluation model \--
these basics are what you need to master first.

There\'s also a plethora of [library
bindings](https://github.com/red/code/tree/master/Library){rel="nofollow noreferrer"}
that you can learn from \-- judging by the original example, you are
trying to make a CRUD View interface on top of SQLite.

*Comment by Dmitry Bubnenkov:* Big thanks! Could you add mention why it
should be compiled in release mode?

*Comment by 9214:* \@DmitryBubnenkov see
[this](https://www.red-lang.org/2017/03/062-libred-and-macros.html){rel="nofollow noreferrer"}
article. You can use the development mode of course, but that would
require rebuilding libRedRT each time a new unique runtime call is
introduced in your Red/System code. By default libRedRT exports only a
[pre-defined
set](https://github.com/red/red/blob/master/system/utils/libRedRT-exports.r){rel="nofollow noreferrer"}
of runtime definitions, and if your code uses a call not from that list,
then it won\'t compile in development mode without a custom libRedRT.

*Comment by Dmitry Bubnenkov:* You show access to global context, but
how to find symbol that place in separate context? Maybe I should start
new question?

*Comment by 9214:* \@DmitryBubnenkov for that you really need to pass as
an argument to routine something that references that context, like e.g.
a word or an object. Once you have a symbol ID and a context node, you
can fetch the value using `_context/get-any`. With the global context
it\'s easier because its node is accessible via `global-ctx` variable.
OTOH, in your case you should rather pass the block itself.

------------------------------------------------------------------------

## Comments on question
