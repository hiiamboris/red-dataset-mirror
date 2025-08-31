# How to pass block with context to routine?

**Link:**
<https://stackoverflow.com/questions/62427866/how-to-pass-block-with-context-to-routine>

**Asked:** 2020-06-17 11:25:55 UTC

------------------------------------------------------------------------

I am continue to learn Red/System. And now I am trying to understand how
to pass word with context to function.

Here is my code:

    Red [Note: "compile in release mode (-r flag)"]

    mycontext: context [
        list: []
    ]

    foo: routine [
        blk 
        /local        
        int [integer!]
        str [c-string!]
    ][
        blk: as red-block! _context/get-any <CONTEXTHERE> symbol/make "list" ; ?? <CONTEXTHERE>
        int: 123
        str: "Hello"

        block/rs-append blk as red-value! integer/box int
        string/load-in str length? str blk UTF-8
    ]

    foo mycontext ; passing context to foo
    probe mycontext

This code do not work because list is placed in `mycontext`. The example
of passing `list` without context can be found
[here](https://stackoverflow.com/questions/62410275/how-to-pass-value-from-red-system-to-red)

I tried different approaches, but every time I got error.

[https://github.com/red/red/blob/master/runtime/datatypes/structures.reds#L188](https://github.com/red/red/blob/master/runtime/datatypes/structures.reds#L188){rel="nofollow noreferrer"}

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by 9214

Firstly, the type specification of your routine is incorrect (that\'s
what the error message tells you):

    Compiling to native code...
    *** Compilation Error: invalid definition for function exec/foo: [
        blk [red-red-block!]
        /local
        int [integer!]
        str [c-string!]
    ]

Compiler automatically puts `red-*` prefix for routine\'s arguments, so
the correct specification should be:

    foo: routine [
        blk [block!]
        /local        
            int [integer!]
            str [c-string!]
    ][
        ...
    ]

Secondly, this isn\'t correct either; you are passing an `object!`, not
a `block!`:

    *** Compilation Error: datatype not allowed

Which means that one should write:

    foo: routine [
        obj [object!]
        /local        
            int [integer!]
            str [c-string!]
    ][
        ...
    ]

Now, as I understand, you want to get a hold of that empty block
referenced by `list` and append values to it. This requires having a
context node

    obj/ctx

and symbol ID

    symbol/make "list"

Having two in place we can make a call to `_context/get-any`:

    foo: routine [
        obj [object!]
        /local
            blk [red-block!]
            int [integer!]
            str [c-string!]
    ][
        blk: as red-block! _context/get-any symbol/make "list" obj/ctx
        int: 123
        str: "Hello"

        block/rs-append blk as red-value! integer/box int
        string/load-in str length? str blk UTF-8
    ]

Alternative solution would be to construct a `word!` value using
`word/load` and call `object/rs-select`:

    foo: routine [
        obj [object!]
        /local
            blk [red-block!]
            int [integer!]
            str [c-string!]
    ][
        blk: as red-block! object/rs-select obj as red-value! word/load "list"
        int: 123
        str: "Hello"

        block/rs-append blk as red-value! integer/box int
        string/load-in str length? str blk UTF-8
    ]

Both approaches yield the expected result:

    make object! [
        list: [123 "Hello"]
    ]

Personally, I wouldn\'t complicate things that much and simply pass the
block to your routine:

    mycontext: context [
        list: []
    ]

    foo: routine [
        blk [block!]
        /local
            int [red-integer!]
            str [c-string!]
    ][
        str: "Hello"
        int: as red-integer! stack/push*
        int/header: TYPE_INTEGER
        int/value: 123

        block/rs-append blk as red-value! int
        string/load-in str length? str blk UTF-8
    ]

    foo mycontext/list
    probe mycontext

*Comment by Dmitry Bubnenkov:* Could you show the simple way of passing
block to routine? It should be someting like: `foo in mycontext 'list` ?

*Comment by 9214:* \@DmitryBubnenkov `foo mycontext/list` should
suffice; or `foo get in mycontext 'list` if you want to go that route.

*Comment by Dmitry Bubnenkov:* I tried `b [block!]` and
`blk: as red-block! _context/get-any symbol/make "list" b/ctx` but it\'s
seems that block do not have context and I do not know how to pass it

*Comment by 9214:* \@DmitryBubnenkov if you already have a block `blk`,
then all that you need to do is to append values to it.

*Comment by Dmitry Bubnenkov:* please add full example to answer. I
tried but get `Runtime Error 1: access violation` at it\'s run. It\'s
seems that I did something wrong again.

*Comment by Dmitry Bubnenkov:* Bit thanks! But why nothing do not work
without `int: as red-integer! stack/push*` and
`int/header: TYPE_INTEGER`?

*Comment by 9214:* \@DmitryBubnenkov I extended my answer with an extra
example; the crash is likely related to how `integer/box` handles data
stack: it overwrites the bottom of the stack frame (with `blk` slot in
it), which trips up `block/rs-append`. In my example I avoided that by
boxing integer manually; alternative solution would be to duplicate
`blk` on stack and let the bottom slot be reused.

------------------------------------------------------------------------

## Comments on question
