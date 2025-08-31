# Use strings to create words and paths in Red language

**Link:**
<https://stackoverflow.com/questions/46350543/use-strings-to-create-words-and-paths-in-red-language>

**Asked:** 2017-09-21 18:06:23 UTC

------------------------------------------------------------------------

I have strings in a `namelist`, that correspond to variables as well as
field names in the application.

The function should read strings from namelist, add an \'f\' to get
field_names, and then put variable values in corresponding fields.

I tried following code, that does not give any error, but also does not
work:

    namelist: ["var1" "var2"]
    var1: 5
    var2: 10

    process: [
        repeat i length? namelist [
            (to-set-path compose rejoin [namelist/:i "f/text"] (to-word namelist/:i))
        ]
    ]

    lay: layout [ 
        text "Values to appear here: "
        var1f: field "a"
        var2f: field "b"

        button "Click" [do process]
    ]

    view lay

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 6) --- by HostileFork says dont trust SE

As a general point: it is easy to turn strings into WORD!s *(e.g.
`to-word "foo"`)*. However, it can be tough to magically make that WORD!
reference be bound to \"the variable you meant\". The wily reasons for
this have to do with the fact that there *is no scope*. See:

[Is there a overall explanation about definitional scoping in Rebol and
Red](https://stackoverflow.com/questions/21964110/is-there-a-overall-explanation-about-definitional-scoping-in-rebol-and-red)

So what you are trying to do is going to be a little dodgy regardless.
There are better ways. But to try to avoid un-asking the question, I\'ll
explain what\'s happening here and how to fix it in the style you were
attempting.

# corrected version is for instructional purposes only. please do this another way.

> `compose rejoin [namelist/:i "f/text"]`

REJOIN is applied to blocks, and merges the contents, with a result type
*loosely* based on the first element. *(It\'s a [questionable
operation](https://forum.rebol.info/t/rejoin-ugliness-and-the-usefulness-of-tests/248){rel="nofollow noreferrer"},
but historically popular in Rebol code.)*

Since `namelist/:i` is a string, your REJOIN will produce a
string\...and this string will wind up being passed to COMPOSE. But
COMPOSE is meant to be applied to BLOCK!s\...and searches for
parenthesized groups *inside* of it, evaluating them while leaving the
rest of the code alone. It\'s a kind of templating system for blocks,
with no effect on other kinds of input\...so you\'ll get the same string
out.

TO-SET-PATH is thus being fed a STRING! *(e.g. \"var1f/text\")*. I
didn\'t even know that path conversion accepted strings. I find the
behavior of this operation to be puzzling, because it apparently LOADs
the string and then makes it the singular element of a length 1
SET-PATH!.

    >> p: to-set-path "foo/bar"
    == foo/bar: ;-- huh? really, did that work?

    >> type? p
    == set-path! ;-- ok, good, I guess.

    >> length? p
    == 1 ;-- wait, what?

    >> type? first p
    == path! ;-- a PATH! inside a SET-PATH!...?

    >> length? first p
    == 2

    >> type? first first p
    == word!

    >> foo: 10
    >> get first first p
    == 10 ;-- well, at least it's bound

That\'s not making the kind of SET-PATH! you want; you want a SET-PATH!
with 2 WORD! elements. Converting a BLOCK! to a SET-PATH! would be a way
of doing this.

    to-set-path compose [(load rejoin [namelist/:i "f"]) text]

Now we see COMPOSE being used correctly, where it will run the
evaluation inside the parentheses and leave the `text` word alone. This
produces a block with 2 elements in it, which is easily converted to a
SET-PATH!. I\'m using LOAD instead of TO-WORD to take care of some of
the \"magic\" of connecting to an actual variable that plain word
conversion would not do. But it\'s just a workaround\--not a sure thing,
and won\'t always be the answer to the problem.

But producing a SET-PATH! doesn\'t mean it runs. If I say:

    s: to-set-word "x"
    probe type? s

No SET-WORD! is executed, it\'s merely generated. And in this case,
stored in the variable s. But if I hadn\'t stored it in a variable, the
evaluation product would have just been thrown out\...the way 2 is
simply thrown out if I write `1 + 1 print "hi"`. To execute the
SET-PATH!, you need to put it in a context where it will be composed
into source and evaluated.

*(Note: Ren-C has a [primitive called
EVAL](https://forum.rebol.info/t/meet-the-eval-native/311){rel="nofollow noreferrer"}
which can do this on the fly, e.g. `eval (quote x:) 10` will assign 10
to x.)*

But in Red you\'ll need to do something like this:

    namelist: ["var1" "var2"]
    var1: 5
    var2: 10

    process: [
        repeat i length? namelist [
            do probe compose [
                (to-set-path compose [(load rejoin [namelist/:i "f"]) text])
                to-string
                (load namelist/:i)
            ]
        ]
    ]

    lay: layout [ 
        text "Values to appear here: "
        var1f: field "a"
        var2f: field "b"

        button "Click" [do process]
    ]

    view lay

Now your outer COMPOSE is building an 3-element block, where the first
element will be a SET-PATH!, the second a WORD! that was literally left
alone to convert your integer to a string, and the third a WORD! that
will be evaluated to the relevant integer. The DO of that block will
have the assignment effect.

I changed your `to-word namelist/:i` to `load namelist/:i`. Again, for
the reason I mentioned\...TO-WORD alone doesn\'t put on a \"binding\".

I left a PROBE in there so you could see what is built and executed:

    [var1f/text: to-string var1]
    [var2f/text: to-string var2]

PROBE is a very helpful tool, which outputs its argument but also passes
it through. You can insert it at various points in your code to get a
better understanding of what\'s going on.

*(Note: If you\'re wondering why I don\'t suggest writing a narrow
EVAL-2 helper operation that only works for SET-PATH!, it\'s because
such a thing exists with a better name. It\'s called SET. Try
`set (quote x:) 10` then `print x`. In fact, variants of this is how
you\'d actually want to do things\... `obj: make object! [a: 10]` then
`set (in obj 'a) 20` then `print obj/a`. As I said, there\'s a lot
better ways to go about what you\'re doing, but I tried to stay focused
on doing it the-way-you-were-trying.)*

*Comment by rnso:* Very well explained. Can we create an `eval` function
which combines to-set-path for first part and to-word for subsequent
parts?

*Comment by rnso:* I am also finding it difficult to adjust your code if
var1 and var2 are \"numbers\" 5 and 10 (not strings). The keyword
`to-string` creates an error when put in compose part.

*Comment by HostileFork says dont trust SE:* \@rnso EVAL can\'t be built
in userspace in Red even in theory, because it would be \"variadic\",
and it does not support that. **eval :add** would consume two subsequent
arguments (meaning EVAL had to act as arity 2), while **eval quote x:**
would only consume one subsequent argument (a contradictory definition
of EVAL at arity 1). But even if you have variadics\--[Ren-C
does](https://trello.com/c/Y17CEywN/131-extremely-flexible-varargs-variadic-functions-with){rel="nofollow noreferrer"}\--writing
EVAL yourself would still be a major pain, like reimplementing the Rebol
evaluator in Rebol.

*Comment by HostileFork says dont trust SE:* \@rnso I\'ve modified the
example to show you a place you can put TO-STRING. Now your generated
code block has three elements: a SET-PATH! and two WORD!s. I will again
reiterate I only explained this to try and tell you mechanically what
was going wrong\... and maybe the understanding will benefit you\... but
I will leave it to others and the [Red
gitter.im](https://gitter.im/red){rel="nofollow noreferrer"} or
something to talk about better ways; I do not speak for Red, nor do I
work at all with the GUI dialect.

*Comment by HostileFork says dont trust SE:* *(I would say there is \"no
reason Red couldn\'t add EVAL as a native\"\...however, from experience
I will say it\'s not as trivial to add into an evaluator as it seems,
especially if you\'re concerned about efficiency. There\'s a lot of GC
concerns about holding an additional cell for the evaluative product,
paying for the initialization and maintenance of that cell, none of
which is free\...and trying to take shortcuts without breaking things
like `eval eval eval...` can be challenging. It\'s harder than it looks
to write an EVAL that\'s both rigorous and efficient.)*

------------------------------------------------------------------------

### Answer (score: 5) --- by rgchris

This doesn\'t directly answer your question, though seems to address the
problem you\'re facing. It uses the `face/extra` field to associate the
fields to your value list:

    namelist: [var1 var2]
    var1: 5
    var2: 10

    process: function [][
        foreach face lay/pane [
            if find namelist face/extra [
                face/text: form get to word! face/extra
            ]
        ]
    ]

    lay: layout [ 
        text "Values to appear here: "
        field "a" extra 'var1
        field "b" extra 'var2

        button "Click" [process]
    ]

    view lay

The only wrinkles are: it applies `get` to the words as they are set in
the View spec---they need to be within the same context as the values
you\'re working on, and---you can\'t get a `lit-word!` so have to change
it `to word!` before getting.

Another approach if you want to contain your values in a map:

    values: #(foo: 5 bar: 10)

    process: function [container [object!]][
        foreach face container/pane [
            if find values face/extra [
                face/text: form select values face/extra
            ]
        ]
    ]

    view [ 
        text "Values to appear here: "
        field "a" extra 'foo
        field "b" extra 'bar

        button "Click" [process face/parent]
    ]

------------------------------------------------------------------------

### Answer (score: 3) --- by Geeky I

# Step 1: refactor

Here is your code reformatted and `print` (1) statements added:

    namelist: ["var1" "var2"]
    var1: 5
    var2: 10

    process: [
        print "process: start"      ; (1)
        repeat i length? namelist [
            (to-set-path compose rejoin [namelist/:i "f/text"] (to-word namelist/:i))
        ]
        print "process: end"        ; (1)
    ]

    lay: layout [ 
        text "Values to appear here: "
        var1f: field "a"
        var2f: field "b"

        button "Click" [do process]
    ]

    view lay

When I run this in the *console* and press \"Click\", it gives the
following:

    process: start
    process: end

So I know at least the button works

# Step 2: debug with `print`

Now I can focus, moving `print` inside the code block:

    process: [
        repeat i length? namelist [
            print (
                to-set-path compose rejoin [
                    namelist/:i "f/text"
                ] (to-word namelist/:i)
            )
        ]
    ]

Almost immediately I can see what\'s wrong here :

    var1    ; expecting `var1f` here
    var2    ;

# Step 3: we need to go deeper with `probe`

## Aside

Now, before I proceed further, notice that this code doesn\'t access
anything inside the view block (*because it doesn\'t work!*). But the
nice thing here is you could ignore this and come back to it later.

*What you need is a way to access `var1f/text` programmatically*

Keeping that in mind, here is a better way to phrase this question:

## Step 3a: how to dynamically create `objects` with different names and set values to them?

`var1f/text: 5`

(given the code in step 2)

Now, I reach a conundrum here. This would probably be best asked as a
different, simpler question.

I decided to continue assuming you accomplished this (there\'s another
answer too)

### Note

The important thing to take home in this step is the `datatype` *Red
view* uses and what you\'re working with is the same thing: red
`object`s. There is no difference (all are instances of a simple face
object)

# Step 4: you\'re done! Or are you?

So you\'re able to create the gui you want for your work and you\'re
done! Right?

But then you ask yourself, is this the best way to do it? What if you
want to [add some more of
this](https://stackoverflow.com/questions/46280562/getting-strings-from-a-list-into-vid-in-red-language?rq=1),
or [something else
entirely](https://stackoverflow.com/questions/46261922/gui-elements-from-a-function-not-being-displayed-in-red-language)?

1.  You have [read the official gui
    docs](https://doc.red-lang.org/en/gui.html){rel="nofollow noreferrer"}
    especially the part about [view
    engine](https://doc.red-lang.org/en/view.html#_the_face_tree){rel="nofollow noreferrer"}
2.  You\'ve looked at examples of
    [vid](https://github.com/red/red/blob/master/tests/vid.red#L8){rel="nofollow noreferrer"}
    and [adding view `face` objects
    manually](https://github.com/red/red/blob/master/tests/view-test.red#L878){rel="nofollow noreferrer"}
3.  You\'ve looked at the repo on github for [sample code and small
    apps](https://github.com/red/code/tree/master/Showcase){rel="nofollow noreferrer"}
4.  You\'ve even tried the old, but stable
    [rebol2](http://www.rebol.com/downloads.html){rel="nofollow noreferrer"}

But you still don\'t get it? Don\'t despair, this is normal. A lot of
stuff have names that are conceptually similar to what you are familiar
in other languages but are different in subtle ways which tends to make
them really different. In the end tho, a lot is simpler than you\'d
think but stranger(having deeper implications)

# tl;dr

-   Separate your view code from the rest so it\'s easier to debug
-   Use `print`, `probe` and `dump-face` to debug

------------------------------------------------------------------------

## Comments on question

*Comment by Geeky I:* Your code could be structured better so it\'s
easier to understand. It would help to separate the different parts and
use that as a template in all the code you submit

*Comment by rgchris:* It does seem like you\'re going out of your way to
do something that\'s not quite clear. What is your goal here?---to use
`var1` and `var2` as defaults for the fields with the \'Click\' button
for resetting, or do you intend to sync the fields with `var1` and
`var2`? It\'s not really clear from your naming choices what your intent
is.
