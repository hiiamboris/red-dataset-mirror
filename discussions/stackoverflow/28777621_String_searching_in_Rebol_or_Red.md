# String searching in Rebol or Red

**Link:**
<https://stackoverflow.com/questions/28777621/string-searching-in-rebol-or-red>

**Asked:** 2015-02-28 03:01:50 UTC

------------------------------------------------------------------------

I\'m interested in searching on a lot of long strings, to try and hack
out a sed-like utility in rebol as a learning exercise. As a baby step I
decided to search for a character:

    >> STR: "abcdefghijklmopqrz"

    >> pos: index? find STR "z"
    == 18

    >> pos
    == 18

Great! Let\'s search for something else\...

    >> pos: index? find STR "n"
    ** Script Error: index? expected series argument of type: series port
    ** Where: halt-view
    ** Near: pos: index? find STR "n"

    >> pos
    == 18

What? :-(

Yeah, there was no \"n\" in the string I was searching. But what is the
benefit of an interpreter blowing up instead of doing something
sensible, such as returning a testable \"null\" char in pos?

I was told I should have done this:

    >> if found? find STR "z" [pos: index? find STR "z"]
    == 18

    >> if found? find STR "n" [pos: index? find STR "n"]
    == none

    >> pos
    == 18

Really? I have to search the string TWICE; the first time just to be
sure it is \"safe\" to search AGAIN?

So I have a three-part question:

1.  How would a wizard implement my search function? I presume there is
    a wizardly better way better than this\....

2.  Is Red going to change this? Ideally I\'d think find should return a
    valid string position or a NULL if it hits end of string (NULL
    delimited, may I presume?). The NULL is FALSE so that would set up
    for a really easy if test.

3.  What is the most CPU effective way to do a replace once I have a
    valid index? There appear to so many choices in Rebol (a good thing)
    that it is possible to get stuck in choosing or stuck in a
    suboptimal choice.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by HostileFork says dont trust SE

> I was told I should have done this:
>
>     >> if found? find STR "z" [pos: index? find STR "z"]
>     == 18
>
>     >> if found? find STR "n" [pos: index? find STR "n"]
>     == none
>
>     >> pos
>     == 18
>
> Really? I have to search the string TWICE; the first time just to be
> sure it is \"safe\" to search AGAIN?

You certainly don\'t have to search the string twice. But `index?`
*(likely future name since it doesn\'t return a yes/no: `index-of`)*
doesn\'t return a NONE! value if given a NONE! input. It assumes the
caller wants an integer position back and raises an error if it can\'t
give you one.

### How would a wizard implement my search function?

To eliminate the double search, you can use a short circuit
evaluation\...

    >> all [pos: find STR "z" pos: index? pos]
    == 18

    >> pos
    == 18

    >> all [pos: find STR "n" pos: index? pos]
    == none

    >> pos
    == none

But note that without introducing a second variable you will overwrite
your previous `pos`. Let\'s say you call your variable `index` instead
and pos is a temporary:

    >> all [pos: find STR "z" index: index? pos]
    == 18

    >> index
    == 18

    >> all [pos: find STR "n" index: index? pos]
    == none

    >> index
    == 18

The ability to throw set-words at arbitrary points in mid-expression is
quite powerful, and it\'s why things like multiple initialization
(`a: b: c: 0`) are not special features of the language, but something
that falls out of the evaluator model.

### Is Red going to change this?

It\'s not likely that the benefits of `index?` (*cough* `index-of`)
returning a NONE! value if given a NONE! input outweigh the problems it
would cause by being so tolerant. It\'s always a balance.

Note that FIND does indeed behave as you expect. FOUND? is just a
syntactic convenience that transforms a position found into a true
value, and a NONE! returned into a false one. It is equivalent to
calling TRUE? (but just a little more literate when reading). There is
no need to use it in the condition of an IF or UNLESS or EITHER\...as
they will treat a NONE result as if it were false and any position as if
it were true.

### What is the most CPU effective way to do a replace once I have a valid index?

What would have been fastest would probably have been to have hung onto
the position, and said `change pos #"x"`. (Though internally
\"positions\" are implemented by index plus series, and not an
independent pointer. So the advantage is not *that* significant in
micro-optimization world, where we\'re counting things like additions of
offsets\...)

As for which operation with an index: I\'d say choose how you like it
best and micro-optimize later.

I don\'t personally think `STR/:index: #"x"` looks all that great, but
it\'s the briefest in characters.

`STR/(index): #"x"` does the same thing and looks better IMO. But at the
cost of the source code structure blowing up a bit. That\'s a SET-PATH!
series containing a PAREN! series followed by a CHAR!\...all embedded in
the original series \"vector\" that\'s holding the code. Under the hood
there\'s going to be locality problems. [And we know how important that
is these
days\...](http://blog.hostilefork.com/locality-locality-locality/){rel="nofollow"}

It\'s likely that the seemingly naive POKE is the fastest.
`poke STR index #"x"`. It may look like \"4 elements instead of 2\", but
the \"2 elements\" of the path cases are an illusion.

In Rebol it\'s always a bit of a hard thing to guess, so you have to
gather data. You can run some repeated iterative tests to find out. To
time a block of code, see the builtin `delta-time`.

In Red the compiled forms *should* be equivalent, but if somehow this
winds up being interpreted you\'d probably have similar timings to
Rebol.

------------------------------------------------------------------------

### Answer (score: 3) --- by draegtun

No surprises that HostileFork answer covers everything beautifully! +1

Just wanted to add an alternative solution to point 1 that i use
regularly:

    >> attempt [index? find STR "z"]   
    == 18

    >> attempt [index? find STR "n"] 
    == none

Online documentation for Rebol 2
[`attempt`](http://www.rebol.com/docs/words/wattempt.html){rel="nofollow"}
& Rebol 3
[`attempt`](http://www.rebol.com/r3/docs/functions/attempt.html){rel="nofollow"}

*Comment by HostileFork says dont trust SE:* Nice and succinct! But
you\'ll pay 3x or more performance for that error catching, compare
`delta-time [loop 100000 [all [pos: find STR "n" pos: index? pos]]]` to
`delta-time [loop 100000 [attempt [index? find STR "n"]]]`. *(Of course,
briefer is better most of the time for what Rebol is good for\... just
playing devil\'s advocate\...)*

*Comment by HostileFork says dont trust SE:* I should clarify in the
above that the performance penalty is a Rebol2 issue, which this
question was tagged with and where I was running tests for this answer.
The use of attempt should no longer be considered a performance
concern\...rather a *semantics* concern, because \"suppresses all errors
as equal\" is a very broad net to rely upon!

------------------------------------------------------------------------

### Answer (score: 2) --- by DocKimbel

Searching strings in Red/Rebol is very simple and convenient. About the
issues you have encountered, let me unpack the details for you:

First of all, the interpreter is giving you a good hint about what you
are doing wrong, in form of an error message:
`index? expected series argument of type: series port`. This means that
you used `index?` on the wrong datatype. How did that happen? Simply
because the
[`find`](http://www.rebol.com/docs/words/wfind.html){rel="nofollow"}
function returns a `none` value in case the search fails:

    >> str: "abcdefghijklmopqrz"
    >> find str "o"
    == "pqrz"
    >> type? find str "o"
    == string!

    >> find str "n"
    == none
    >> type? find str "n"
    == none!

So, using `index?` directly on the result of `find` is *unsafe*, unless
you know that the search *won\'t fail*. If you need to extract the index
information anyway, the safe approach is to test the result of `find`
first:

    >> all [pos: find str "o" index? pos]
    == 14
    >> all [pos: find str "n" index? pos]
    == none
    >> if pos: find str "o" [print index? pos]
    == 14
    >> print either pos: find str "n" [index? pos][-1]
    == -1

Those were just examples of safe ways to achieve it, depending on your
needs. Note that `none` acts as `false` for conditional tests in `if` or
`either`, so that using `found?` in such case, is superfluous.

## Now let\'s shed some lights on the core issue which brought confusion to you.

Rebol languages have a fundamental concept called a `series` from which
`string!` datatype is derived. Understanding and using properly series
is a key part of being able to use Rebol languages in an idiomatic way.
Series look like usual lists and string-like datatypes in other
languages, but they are *not* the same. A series is made of:

-   a list of values (for strings, it is a list of characters)
-   a implicit index (we can call it a *cursor* for sake of simplicity)

The following description will only focus on strings, but the same rules
apply to all series datatypes. I will use `index?` function in the
examples below just to display the *implicit index* as an integer
number.

By default, when you create a new string, the cursor is at *head*
position:

    >> s: "hello"
    >> head? s
    == true
    >> index? s
    == 1

But the cursor can be moved to point to other places in the string:

    >> next s
    == "ello"
    >> skip s 3
    == "lo"
    >> length? skip s 3
    == 2

As you can see, the string with a moved cursor is not only displayed
from the cursor position, but also **all the other string (or series)
functions will take that position into account**.

Additionally, you can also *set* the cursor for each reference pointing
to the string:

    >> a: next s
    == "ello"
    >> b: skip s 3
    == "lo"
    >> s: at s 5
    == "o"
    >> reduce [a b s]
    == ["ello" "lo" "o"]
    >> reduce [index? a index? b index? s]
    == [2 4 5]

As you can see, you can have as many different references to a given
string (or series) as you wish, each having its own *cursor* value, but
all pointing to the *same underlying list of values*.

One important consequence of series properties: *you do not need to rely
on integer indexes to manipulate strings (and other series) like you
would do in other languages*, you can simply leverage the cursor which
comes with any series reference to do whatever computation you need, and
your code will be short, clean and very readable. Still, integer indexes
can be useful sometimes on series, but you *rarely* need them.

Now let\'s go back to your use-case for searching in strings.

    >> STR: "abcdefghijklmopqrz"
    >> find STR "z"
    == "z"
    >> find STR "n"
    == none

That is all you need, you do not have to extract the index position in
order to use the resulting values for pretty much any computation you
need to do.

    >> pos: find STR "o"
    >> if pos [print "found"]
    found
    >> print ["sub-string from `o`:" pos]
    sub-string from `o`: opqrz
    >> length? pos
    == 5
    >> index? pos
    == 14
    >> back pos
    == "mopqrz"
    >> skip pos 4
    == "z"

    >> pos: find STR "n"
    >> print either pos ["found"]["not found"]
    not found
    >> print either pos [index? pos][-1]
    -1

Here is a simple example to show how to do sub-string extraction without
any explicit usage of integer indexes:

    >> s: "The score is 1:2 after 5 minutes"
    >> if pos: find/tail s "score is " [print copy/part pos find pos " "]
    1:2

With a little practice (the console is great for such experimentations),
you will see how simpler and more efficient it is to rely fully on
series in Rebol languages than just plain integer indexes.

Now, here is my take on your questions:

1.  No wizardry required, just use series and `find` function
    adequately, as shown above.

2.  Red is not going to change that. Series are a cornerstone of what
    makes Rebol languages simple and powerful.

3.  `change` should be the fastest way, though, if you have many
    replacements to operate on a long string, reconstructing a new
    string instead of changing the original one, leads often to better
    performances, as it would avoid moving memory chunks around when
    replacement strings are not of same size as the part they replace.

------------------------------------------------------------------------

## Comments on question
