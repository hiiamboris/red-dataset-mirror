# Red: any alternative to using do for adding dynamic keys to a block

**Link:**
<https://stackoverflow.com/questions/52568569/red-any-alternative-to-using-do-for-adding-dynamic-keys-to-a-block>

**Asked:** 2018-09-29 12:54:26 UTC

------------------------------------------------------------------------

Is there an alternative syntax for :

    a: [
    b: [
        1 2
    ]
    ]

    append (do "a/b") 3   

    == [
        b: [
            1 2
        ]
    ] 

I don\'t feel this as very elegant using do (it ressembles too much eval
in javascript).

I tried to-path without success.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by Peter W A Wood

The simplest way is to use path notation to \"address\" the inner block
directly:

    >> a: [ b: [ 1 2 ] ]
    == [b: [1 2]]
    >> append a/b 3
    == [1 2 3]

------------------------------------------------------------------------

### Answer (score: 2) --- by HotelFoxtrot

Re comment that you want a/b in a variable:

    a: [b: [1 2 3]]
    var: a/b
    append var 4
    probe a
    == [b: [1 2 3 4]]

*Comment by user310291:* Why this doesn\'t work though: a: \[b: \[1 2
3\]\] var: to-path \"a/b\" append var 4 probe a

*Comment by Peter Lewerin:* \@user310291: because then you append to the
path, not to what the path is supposed to access.

*Comment by user310291:* \@PeterLewerin yes I can see ;) but how to
append to the block instead if I need to use string type for \"a/b\" ?

*Comment by Peter Lewerin:* \@user310291: Red isn\'t Javascript. In a
language with meta-circular evaluation, a construct like `do` / `eval`
isn\'t just appropriate, it is indispensible. It\'s better to go with
the language than to try to go against it.

------------------------------------------------------------------------

### Answer (score: 1) --- by Peter Lewerin

Given your initial assignment

`a: [b: [1 2]] == [b: [1 2]] `

you want to append 3 to the inner block. You can get the inner block by

`do "a/b" == [1 2] `

but you can also get it by

`probe a/b == [1 2] `

which lets you append like this instead:

`append a/b 3 == [1 2 3] probe a == [b: [1 2 3]] `

In an Algol-style language, this would be something like
`a.b = append(a.b, 3)`: the `a/b` is an assignable dereference to the
inner block.

**ETA:**

If you want to bottle up the dereference, the alternative to your
`do "a/b"` could be to create a function:

`ab: function [][a/b] == func [][a/b] append ab 7 == [1 2 7] `

(Alternatively, `ab: does [a/b]`.)

*Comment by user310291:* this is not dynamic for me: what I meant is
that a/b should a string or be stored in a variable

*Comment by Peter Lewerin:* \@user310291: It\'s a good idea to state
that intent in the question. In any case, if you want to do that, then
you need to evaluate it, either with `do` or with a function (see edit).

------------------------------------------------------------------------

### Answer (score: 1) --- by SammyWise

> Why this doesn\'t work though: a: \[b: \[1 2 3\]\] var: to-path
> \"a/b\" append var 4

This does (note the GET)

    a: [b: [1 2 3]]
    var: load "a/b"
    append get var 4
    probe a
    == [b: [1 2 3 4]]

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

As path notation is just a shortcut to **select** you can circumvent the
path by using select

in Red

    >> a: [ b: [ 1 2 ] ]
    == [b: [1 2]]
    >> append select a 'b 3
    == [1 2 3]
    >> a
    == [b: [1 2 3]]

in Rebol you have to do

    >> append select a to-set-word 'b 3
    == [1 2 3]

By the way, why do you not use `a: [ b [ 1 2 ] ]` or do you want to
assign the inner block to the global variable `b` ? Then a simple **do
a** would do it and you can use

    >> do a
    == [1 2]
    >> append b 3
    == [1 2 3]

------------------------------------------------------------------------

### Answer (score: 0) --- by spork

    a: [b: [ 1 2 3]] 
    append a/b 4

    probe a
    == [b: [1 2 3 4]]

*Comment by Fabulous:* Hi and welcome to stack overflow. While this code
may solve the problem the OP had, it is advisable to include some
context or an explanation of how it addresses the problem, why this
method is better etc. Please edit the answer and include more
information.

------------------------------------------------------------------------

## Comments on question
