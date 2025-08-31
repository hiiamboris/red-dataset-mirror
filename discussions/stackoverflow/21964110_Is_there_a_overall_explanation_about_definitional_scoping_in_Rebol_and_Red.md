# Is there a overall explanation about definitional scoping in Rebol and Red

**Link:**
<https://stackoverflow.com/questions/21964110/is-there-a-overall-explanation-about-definitional-scoping-in-rebol-and-red>

**Asked:** 2014-02-23 04:10:54 UTC

------------------------------------------------------------------------

From the [REBOL/Core Users
Guide](http://www.rebol.com/docs/core23/rebolcore-9.html#section-9){rel="noreferrer"},
and [What is
Red](http://static.red-lang.org/Recode2013-Red.pdf){rel="noreferrer"}, I
have learned that both Rebol and Red use **definitional scoping**.

From the guide, I know it is a form of **static scoping**, \"the scope
of a variable is determined when its context is defined\", and is also
called [**runtime lexical
scoping**](http://www.rebol.com/r3/notes/errors.html){rel="noreferrer"},
and is [a dynamic form of static scoping that depends on context
definitions](https://www.mail-archive.com/list@rebol.com/msg08421.html){rel="noreferrer"}.

I know in com-sci, there are two forms of scoping: lexical scoping
(static scoping) and dynamic scoping. This *definitional scoping*
confused me.

So what is definitional scoping?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 28) --- by BrianH

*Rebol actually does not have scoping at all.*

Let\'s take this code:

    rebol []

    a: 1

    func-1: func [] [a]

    inner: context [
        a: 2
        func-2: func [] [a]
        func-3: func [/local a] [a: 3 func-1]
    ]

So, with that code loaded, if Rebol had lexical scoping, this is what
you\'d see:

    >> reduce [func-1 inner/func-2 inner/func-3]
    == [1 2 1]

That would be because `func-1` uses the `a` from the outer scope, the
`a` used by `func-2` is from the inner scope, and `func-3` calls
`func-1`, which still uses `a` from the outer scope where it was defined
regardless of what\'s in `func-3`.

If Rebol had dynamic scoping, this is what you\'d see:

    >> reduce [func-1 inner/func-2 inner/func-3]
    == [1 2 3]

That would be because `func-3` redefines `a`, then calls `func-1`, which
just uses the most recent active definition of `a`.

Now for Rebol, you get that first result. But Rebol doesn\'t have
lexical scoping. So why?

Rebol fakes it. Here\'s how it works.

In compiled languages, you have scopes. As the compiler goes through the
file, it keeps track of the current scope, then when it sees a nested
scope that becomes the current scope. For lexical scoping, the compiler
keeps a reference to the outer scope, and then looks up words that
weren\'t defined in the current scope by following the links to the
outer scopes, until it finds the word, or doesn\'t. Dynamic-scoped
languages do something similar, but at runtime, going up the call stack.

Rebol doesn\'t do any of that; in particular it isn\'t compiled, it\'s
built, at runtime. What you think of as code is actually data, blocks of
words, numbers and such. The words are data structures that have a
pointer in them called a \"binding\".

When that script is first loaded all the words in the script are added
to the environment object of the script (which we inappropriately call a
\"context\", though it\'s not). While the words are being gathered, the
script data is changed. Any word found in the script\'s \"context\" is
linked to the \"context\", or \"bound\". Those bindings mean that you
can just follow that one link and get to the object where the value of
that word is stored. It\'s really fast.

Then, once that\'s done, we start running the script. And then we get to
this bit: `func [] [a]`. That is not really a declaration, that\'s a
call to a function named `func` which takes a spec block and a code
block and uses them to build a function. That function also gets its own
environment object, but with words declared in the function\'s spec. In
this case there are no words in the spec, so it\'s an empty object. Then
the code block is bound to that object. But in this case there is no `a`
in that object, so nothing is done to the `a`, *it keeps the binding it
already had from when it was bound before*.

Same goes for the `context [...]` call - yes, that\'s a call to a
function inappropriately named `context`, which builds an object by
calling `make object!`. The `context` function takes a block of data,
and it searches for set-words (those things with the trailing colons,
like `a:`), then builds an object with those words in it, then it binds
all of the words in that block and all the nested blocks to the words
that are in the object, in this case `a`, `func-2` and `func-3`. And
that means that the `a`\'s in that block of code have their bindings
*changed*, to point to that object instead.

When `func-2` is defined, the binding of the `a` in its code block is
not overridden. When `func-3` is defined, it has an `a` in its spec, so
the `a:` has its binding overridden.

The funny thing about all of this is that *there aren\'t any scopes at
all*. That first `a:` and the `a` in `func-1`\'s code body are only
bound once, so they keep their first binding. The `a:` in `inner`\'s
code block and the `a` in `func-2`\'s are bound twice, so they keep
their second binding. The `a:` in `func-3`\'s code is bound three times,
so it also keeps its last binding. It\'s not scopes, it\'s just code
being bound and then smaller bits of code being bound again, and so on
until it\'s done.

Each round of binding is performed by a function that is \"defining\"
something (really, building it), and then when that code runs and calls
other functions that define something else, those functions perform
another round of binding to its little subset of code. That\'s why we
call it \"definitional scoping\"; while it really isn\'t scoping, it is
what serves the purpose of scoping in Rebol, and it\'s close enough to
the behavior of lexical scoping that on first glance you can\'t tell the
difference.

It really becomes different when you realize that these bindings are
direct, *and you can change them* (sort of, you can make new words with
the same name and a different binding). That same function that those
definition functions call, you can call yourself: it\'s named `bind`.
With `bind` you can break the illusion of scoping and make words that
bind to any object you can get access to. You can do wonderful tricks
with `bind`, even make your own definition functions. It\'s loads of
fun!

As for Red, Red is compilable, but it also includes a Rebol-like
interpreter, binding and all of the goodies. When it\'s defining things
with the interpreter it does definitional scoping as well.

Does that help make things more clear?

*Comment by endo64:* Thank you BrianH for the great explanation. But
wouldn\'t be better using \"make object! \[\]\" or \"context\" instead
of \"object \[\]\", so it would be compatible with Rebol2 too?

*Comment by BrianH:* Darn, I thought that had made it into the
backported functions. I\'ll switch it to `context`, and move the comment
about it being a function to talk about `func` instead.

*Comment by onetom:* It\'s the clearest description on the topic to
time! Thanks BrianH for taking effort. It think mentioning Ladislav\'s
well-known, more detailed, but harder to digest
[rebol.net/wiki/Bindology](http://www.rebol.net/wiki/Bindology){rel="nofollow noreferrer"}
article on the same page might help discovering your explanation easier
by beginners.

------------------------------------------------------------------------

### Answer (score: 15) --- by HostileFork says dont trust SE

This is an old question, and \@BrianH\'s answer here is very thorough on
mechanics. But I thought I would give one with a slightly different
focus, as a bit more of a \"story\".

In Rebol, there is a category of types called **words**. These are
essentially symbols, so their string content is scanned and they go into
a symbol table. So whereas `"FOO"` would be a string, and `<FOO>` would
be another \"flavor\" of string known as a tag\... `FOO`, `'FOO`, `FOO:`
and `:FOO` are all various \"flavors\" of words with the same symbol ID.
*(A \"word\", a \"lit-word\", a \"set-word\", and a \"get-word\"
respectively.)*

Being collapsed to a symbol makes it impossible to modify the name of a
word once loaded. They\'re stuck, compared with strings that each have
their own data and are mutable:

    >> append "foo" "bar"
    == "foobar"

    >> append 'foo 'bar
    ** Script error: append does not allow word! for its series argument

Immutability has an advantage, in that as a symbol it\'s fast to compare
one word to another. But there is another piece of the puzzle: each
instance of a word can optionally have an invisible property in it
called a **binding**. That binding lets it \"point at\" a key/value
entity known as a **context** where a value can be read or written.

> *Note: Unlike \@BrianH I do not think that calling this category of
> binding targets \"contexts\" is all that bad\--at least I don\'t think
> it today. Ask me later, I might change my mind if new evidence comes
> to light. Suffice to say it\'s an object-like thing, but not always an
> object\...it might be a reference into a function\'s frame on the
> stack, for instance.*

Whoever brings a word into the system gets the first shot at saying what
context it gets bound to. A lot of that time that\'s LOAD, so if you
said `load "[foo: baz :bar]"` and got back the 3-word block
`[foo: baz :bar]` they would be bound into the \"user context\", with a
fallback to the \"system context\".

Following the binding is how everything works, and each \"flavor\" of
word does something different.

    >> print "word pointing to function runs it"
    word pointing to function runs it

    >> probe :print "get-word pointing to function gets it"
    make native! [[
        "Outputs a value followed by a line break."
        value [any-type!] "The value to print"
    ]]
    == "get-word pointing to function gets it"

> *Note: The second case didn\'t print that string. It probed the
> function specification, then the string was just the last thing in the
> evaluation so it evaluated to that.*

But once you\'ve got a block of data with words in it in your hands, the
bindings are anybody\'s game. As long as a context has the symbol for a
word in it, you can retarget that word to that context. *(Assuming also
that the block hasn\'t been protected or locked against
modification\...)*

This cascading chain of rebinding opportunities is the important point.
Since FUNC is a \"function generator\" that takes a spec and a body that
you give it, it has the ability to take the \"raw matter\" of the body
with its bindings and override whichever ones it decides to. Eerie
perhaps, but look at this:

    >> x: 10

    >> foo: func [x] [
        print x
        x: 20
        print x
    ]

    >> foo 304
    304
    20

    >> print x
    10

What happened was that FUNC received two blocks, one representing a
parameter list and the second representing a body. When it got the body,
both the `print`s were bound to the native printing function *(in this
case\--and it\'s important to point out that when you\'re getting
material from places other than the console they could each be bound
differently!)*. `x` was bound to the user context *(in this case)* which
was holding the value 10. If FUNC didn\'t do anything to change the
situation, things would stay that way.

But it put the picture together and decided that since the parameter
list had an x in it, that it would look through the body and *overwrite*
the words with the symbol ID for x with a new binding\...local to the
function. That\'s the only reason that it didn\'t overwrite the global
with `x: 20`. Had you omitted the \[x\] in the spec FUNC wouldn\'t have
done anything, and it would have been overwritten.

Each piece in the chain of definition gets an opportunity before passing
things on. Hence **definitional scoping**.

> FUN FACT: Since if you don\'t supply parameters to the spec of FUNC,
> it won\'t rebind anything in the body, this led to mistaken
> impressions that *\"everything in Rebol is in global scope\"*. But
> that\'s not true at all because as \@BrianH says: *\"Rebol actually
> does not have scoping at all (\...) Rebol fakes it.\"* In fact,
> that\'s what FUNCTION (as opposed to FUNC) does\--it goes hunting in
> the body for set-words like **x:**, and when it sees them adds them to
> the local frame and binds to them. The effect looks like local scope,
> but again, it is not!

If it sounds a bit Rube-Goldberg-esque to imagine these symbols with
invisible pointers being shuffled around, *that\'s because it is*. To me
personally, the remarkable thing is sort of that it works at all\...and
I\'ve seen people pull stunts with it that you wouldn\'t intuitively
think such a simple trick could be used to do.

Case in point: the maddeningly useful COLLECT and KEEP ([Ren-C
version](https://trello.com/c/H9I0261r){rel="nofollow noreferrer"}):

    collect: func [
        {Evaluates a block, storing values via KEEP function,
            and returns block of collected values.}
        body [block!] "Block to evaluate"
        /into {Insert into a buffer instead
                 (returns position after insert)}
        output [any-series!] "The buffer series (modified)"
    ][
        unless output [output: make block! 16]
        eval func [keep <with> return] body func [
            value [<opt> any-value!] /only
        ][
            output: insert/:only output :value
            :value
        ]
        either into [output] [head output]
    ]

This unassuming-looking tool extends the language in the following style
*(again, Ren-C version\... in R3-Alpha or Rebol2 substitute [`foreach`
for
`for-each`](https://trello.com/c/cxvHGNha){rel="nofollow noreferrer"}
and [`length?` for
`length of`](https://trello.com/c/4OT7qvdu){rel="nofollow noreferrer"})*

    >> collect [
           keep 10
           for-each item [a [b c] [d e f]] [
               either all [
                   block? item
                   3 = length of item
               ][
                   keep/only item
               ][
                   keep item
               ]
           ] 
        ]
    == [10 a b c [d e f]]

The trick here with definitional scoping is understood best by what I
mentioned above. FUNC will only overwrite the bindings of things in its
parameter list and leave everything else in the body untouched. So what
happens is that it takes the body you passed to COLLECT and uses that as
the body of a new function, where it overwrites any bindings of KEEP. It
then sets KEEP to a function that adds data to an aggregator when
called.

Here we see the KEEP function\'s versatility in splicing blocks into the
collected output or not, via an /ONLY switch *(the caller chose to not
splice only if we see an item of length 3)*. But this is only scratching
the surface. It\'s just *one* deeply powerful language feature\--added
by users after the fact\--originating from so little code it\'s almost
scary. There are certainly many more stories.

I\'m here adding an answer due to having filled in a crucial missing
link for definitional scoping, a problem known as the \"definitionally
scoped return\":

<https://codereview.stackexchange.com/questions/109443/definitional-returns-solved-mostly>

This is why the `<with> return` is alongside the KEEP in the spec. It\'s
there because COLLECT is trying to tell FUNC it wants to \"use its
services\" as a binder-and-runner-of code. But the body was already
authored somewhere else by someone else. So if it has a RETURN in it,
then that RETURN already has an idea of where to return to. FUNC is only
to \"re-scope\" the keep, but leave any returns alone instead of adding
its own. Hence:

    >> foo: func [x] [
         collect [
             if x = 10 [return "didn't collect"]
             keep x
             keep 20
         ]
    ]

    >> foo 304
    == [304 20]

    >> foo 10
    == "didn't collect"

It is `<with> return` that makes COLLECT able to be smart enough to know
that inside FOO\'s body, it didn\'t want the return rebound so that it
thought to return from the function whose parameter was just \[keep\]
instead.

And there\'s a little bit about the \"why\" of definitional scoping, vs.
just the \"what\". :-)

*Comment by HostileFork says dont trust SE:* \@klausnrooster Thanks,
though I should probably update this, I\'ve found a few other things out
since. But you may also find [Rebol vs. Lisp
Macros](http://blog.hostilefork.com/rebol-vs-lisp-macros/){rel="nofollow noreferrer"}
interesting\...

*Comment by klausnrooster:* Ha, the word \'this\' is linked to that very
page. I should be more explicit.

*Comment by HostileFork says dont trust SE:* \@klausnrooster ah, hard to
see the link (and doesn\'t show in notifications)! Well, I wrote that
too\... :-)

*Comment by Maarten Bodewes:* Don\'t try to fix what is fundamentally
broken, that\'s all I have to say.

*Comment by HostileFork says dont trust SE:* \@MaartenBodewes Is
painting fundamentally broken, and we should all use
[SolidWorks](https://www.youtube.com/watch?v=SX9cFW5iZSY){rel="nofollow noreferrer"},
having every equation and symmetry captured so nothing gets out of sync?
I guess no one should waste their life with galleries or literature,
then. Or perhaps everyone who does do art should think M.C. Escher is
the pinnacle of it\...and/or do everything in Haskell? Programming is an
*art form* and learning the higher levels of it is a lot like learning
how to break rules in other art. [Maybe someday you\'ll get
there.](https://trello.com/c/Bu40ecLC){rel="nofollow noreferrer"} :-P

*Comment by Maarten Bodewes:* Painting is not fundamentally broken and
Escher is certainly not the pinnacle of it. Breaking rules is nice if
you\'re in computer science, but for general programming you should try
and adhere to the structure that the language defines as much as
possible. Stepping outside it will lead to (subtle) bugs and
unmaintainable code. But yeah, that\'s just my opinion.

------------------------------------------------------------------------

### Answer (score: 0) --- by paul tarvydas

My understanding is:

Rebol is Statically Scoped

but,

The question is not "what scoping does Rebol employ?", but, "when is
Rebol scoping determined, when is a Rebol program compiled?".

Rebol has static scoping, but dynamic compilation.

We are accustomed to there being one compilation time and one run time.

Rebol has multiple compilation times.

The compilation of Rebol code depends on the context that exists at the
time of compilation.

Rebol code is compiled at different times, within different contexts.
This means that Rebol functions might be compiled differently at
different times.

------------------------------------------------------------------------

## Comments on question
