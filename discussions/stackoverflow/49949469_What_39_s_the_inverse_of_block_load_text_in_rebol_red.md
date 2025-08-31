# What&#39;s the inverse of block: load text in rebol / red

**Link:**
<https://stackoverflow.com/questions/49949469/whats-the-inverse-of-block-load-text-in-rebol-red>

**Asked:** 2018-04-20 20:44:30 UTC

------------------------------------------------------------------------

Let\'s say I have some rebol / red code. If I load the source text, I
get a block, but how can get back the source text from block ? I tried
form block but it doesn\'t give back the source text.

        text: {
            Red [Title: "Red Pretty Printer"]

            out: none   ; output text
            spaced: off ; add extra bracket spacing
            indent: ""  ; holds indentation tabs

            emit-line: func [] [append out newline]

            emit-space: func [pos] [
                append out either newline = last out [indent] [
                    pick [#" " ""] found? any [
                        spaced
                        not any [find "[(" last out find ")]" first pos]
                    ]
                ]
            ]

            emit: func [from to] [emit-space from append out copy/part from to]

            clean-script: func [
                "Returns new script text with standard spacing."
                script "Original Script text"
                /spacey "Optional spaces near brackets and parens"
                /local str new
            ] [
                spaced: found? spacey
                clear indent
                out: append clear copy script newline
                parse script blk-rule: [
                    some [
                        str:
                        newline (emit-line) |
                        #";" [thru newline | to end] new: (emit str new) |
                        [#"[" | #"("] (emit str 1 append indent tab) blk-rule |
                        [#"]" | #")"] (remove indent emit str 1) break |
                        skip (set [value new] load/next str emit str new) :new
                    ]
                ]
                remove out ; remove first char
            ]

            print clean-script read %clean-script.r
        }

        block: load text

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 6) --- by HostileFork says dont trust SE

LOAD is a higher-level operation with complex behaviors, e.g. it can
take a FILE!, a STRING!, or a BLOCK!. Because it does a lot of different
things, it\'s hard to speak of its exact complement as an operation.
*(For instance, there is SAVE which might appear to be the \"inverse\"
of when you LOAD from a FILE!)*

But your example is specifically dealing with a STRING!:

> If I load the source text, I get a block, but how can get back the
> source text from block ?

As a general point, and very relevant matter: **you can\'t \"get back\"
source text**.

In your example above, your source text contained comments, and after
LOAD they will be gone. Also, a very limited amount of whitespace
information is preserved, in the form of the NEW-LINE flag that each
value carries. Yet what specific indentation style you used\--or whether
you used tabs or spaces\--is not preserved.

On a more subtle note, small amounts of notational distinction are lost.
STRING! literals which are loaded will lose knowledge of whether you
wrote them `"with quotes"` or `{with curly braces}`\...neither Rebol nor
Red preserve that bit. (And even if they did, that wouldn\'t answer the
question of what to do after mutations, or with new strings.) There are
variations of DATE! input formats, and it doesn\'t remember which
specific one you used. Etc.

But when it comes to talking about code round-tripping as text, the
formatting is minor compared to what happens with binding. Consider that
you can build structures like:

    >> o1: make object! [a: 1]
    >> o2: make object! [a: 2]
    >> o3: make object! [a: 3]

    >> b: compose [(in o1 'a) (in o2 'a) (in o3 'a)]
    == [a a a]

    >> reduce b
    [1 2 3]

    >> mold b
    "[a a a]"

You cannot simply serialize **b** to a string as `"[a a a]"` and have
enough information to get equivalent source. Red obscures the impacts of
this a bit more than in Rebol\--since even operations like `to block!`
on STRING! and `system/lexer/transcode` appear to do binding into the
user context. But it\'s a problem you will face on anything but the most
trivial examples.

There are some binary formats for Rebol2 and Red that attempt to address
this. For instance in \"RedBin\" [a WORD! saves its
context](https://doc.red-lang.org/en/redbin.html#_word_a_id_word_a){rel="noreferrer"}
*(and index into that context)*. But then you have to think about how
much of your loaded environment you want dragged into the file to
preserve context. So it\'s certainly opening a can of worms.

This isn\'t to say that the ability to MOLD things out isn\'t helpful.
But there\'s no free lunch\...so Rebol and Red programs wind up having
to think about serialization as much as anyone else. If you\'re thinking
of doing processing on any source code\--for the reasons of comment
preservation if nothing else\--then PARSE should probably be the first
thing you reach for.

*Comment by user310291:* Thanks for this thorough explanation. Still
there should have been better options like some refinement to preserve
formatting structure and comment when using load or save.

*Comment by HostileFork says dont trust SE:* \@user310291 I suggest
working through some examples of what you think it *should* do, and
realize it\'s tough. There are many difficult aspects of preserving
formatting structure and comments when the source format is text
characters, and [not able to reflect direct
intention](https://www.youtube.com/watch?v=tSnnfUj1XCQ){rel="nofollow noreferrer"}.
You are presumably LOADing and then SAVEing the code for a
reason\...e.g. to do some manipulations of it. But you can\'t really
attach `;`-style comments or whitespace directly to the thing they are
commenting on. It would take a lot of guessing, and wind up wacky.

*Comment by user310291:* but parse is horribly over-complicated to
extract NESTED sub blocks.

------------------------------------------------------------------------

## Comments on question
