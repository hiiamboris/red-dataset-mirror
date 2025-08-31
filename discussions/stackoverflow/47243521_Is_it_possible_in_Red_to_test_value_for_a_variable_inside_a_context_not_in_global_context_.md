# Is it possible in Red to test value? for a variable inside a context not in global context?

**Link:**
<https://stackoverflow.com/questions/47243521/is-it-possible-in-red-to-test-value-for-a-variable-inside-a-context-not-in-glob>

**Asked:** 2017-11-11 22:35:58 UTC

------------------------------------------------------------------------

In last example, probe value? \'a returns true as it detects \'a has
value in global context. But I\'d like to test \'a exclusively in local
context, is there a syntax to do so ?

        context [
            probe value? 'a; false
        ]

        context [
            a: 1
            probe value? 'a; true
        ]

        ; would like false instead of true
        a: 1
        context [
            probe value? 'a; true
        ]

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by Dave Andersen

I think the simplest check would be

    context [
        probe in self 'a ; none
    ]

It returns `none` instead of `false`, but that is the only other falsy
value anyway, so it\'s totally appropriate to check against. If you
*need* it to be `false`, you can put `to-logic` in front.

*Comment by sqlab:* really better. I was just before to add it.

*Comment by endo64:* I did very similar one without seeing yours:
`>> a: 1 context [probe same? self context? 'a] ; >> false`

*Comment by user310291:* \@daveanderson I don\'t understand even context
\[(a: 1) probe in self \'a\] returns none whereas it shouldn\'t since
there is a: 1 ?

*Comment by Dave Andersen:* \@user310291 I\'m not sure about that one,
but I notice that when you evaluate it, the returned object doesn\'t
have an `a` value, so the parens must be preventing that word from being
defined in the object. You could `compose` the block before it is given
to `context` and the parens will be evaluated beforehand.

------------------------------------------------------------------------

### Answer (score: 2) --- by HostileFork says dont trust SE

> Is it possible in Red to test value? for a variable inside a context
> not in global context?

By definition, no. Because there is no such thing as \"the global
context\".

Remember that *\"Rebol (Red) actually does not have scope at all\"* \...
*\"Rebol (Red) fakes it.\"*

(See: [Is there a overall explanation about definitional scoping in
Rebol and
Red](https://stackoverflow.com/questions/21964110/is-there-a-overall-explanation-about-definitional-scoping-in-rebol-and-red))

Rebol has BIND? for asking an arbitrary ANY-WORD! where it\'s bound to
(if anywhere). Red calls this CONTEXT?. So what you can do is ask if the
binding of a word is to a context you care about.

    ctx1: context [a: 10]
    ctx2: context [a: 20]

    word: bind 'a ctx1

    print ctx1 = context? word ; true
    print ctx2 = context? word ; false

So if what you mean by \"global context\" is actually the so-called
SYSTEM/WORDS object, then that can be your test:

    context [
        probe value? 'a ; false
    ]

    context [
        a: 1
        probe system/words <> context? 'a ; true
    ]

    a: 1
    context [
        probe system/words <> context? 'a ; false
    ]

As to whether this is appropriate for your purposes, I don\'t know. Just
remember there\'s no scope in Rebol/Red, unless you rig up some fake
approximation that works well enough for what you\'re doing.

*Comment by endo64:* `Red doesn't have that (yet?)` isn\'t `context?`
native does what you want?

*Comment by HostileFork says dont trust SE:* \@user310291 See [update
with CONTEXT?
operation](https://stackoverflow.com/posts/47245754/revisions), didn\'t
know they\'d renamed BIND? to that.

*Comment by user310291:* \@HostileFork thanks context? seems that\'s
what I want :)

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

Here a solution without searching in the \'global\' **system/words**,
but in the \'local\' **self**

    >> a: 1
    == 1
    >> context [
    [        probe all [
    [            find words-of self 'a 
    [            value? pick find words-of self 'a 1
    [        ]
    [        probe value? 'a
    [    ]
    none
    true
    == make object! []
    >> 
    >> context [
    [        probe all [
    [            find words-of self 'a 
    [            value? pick find words-of self 'a 1
    [        ]
    [        probe value? 'a
    [        a: 2
    [    ]
    none
    false
    == make object! [
       a: 2
    ]
    >> 
    >> context [
    [        a: 2
    [        probe all [
    [            find words-of self 'a 
    [            value? pick find words-of self 'a 1
    [        ]
    [        probe value? 'a
    [    ]
    true
    true
    == make object! [
        a: 2
    ]

*Comment by user310291:* that\'s ok if I know the value of \'a in
advance only ?

*Comment by sqlab:* I don\'t understand your question?

*Comment by user310291:* I want to test if variable a has been declared
within local context whatever the value of a: 1, 2, \"test\" \... in
your example you test for value a=1 ? Or I misunderstood ?

*Comment by sqlab:* No, I test for existence of the word **a** in
words-of object at first, then if the existent word has a value. I see
there are some relics in my answer. I will correct that

------------------------------------------------------------------------

## Comments on question
