# How to modify each element of a block by &quot;foreach&quot; in red/rebol

**Link:**
<https://stackoverflow.com/questions/66818220/how-to-modify-each-element-of-a-block-by-foreach-in-red-rebol>

**Asked:** 2021-03-26 13:51:17 UTC

------------------------------------------------------------------------

I want to modify each element of a block by `foreach`. I tried like this
but failed:

    >> a: [3 4 5 6]
    == [3 4 5 6]
    >> foreach i a [i + 1]
    == 7
    >> a
    == [3 4 5 6] ;; block a is not changed. What I want is [4 5 6 7]

Is there a better way to achieve it?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by 9214

Changes that you made to values do not persist in a block itself. This
ties back to your
[question](https://stackoverflow.com/questions/66793343/how-does-functions-of-red-rebol-pass-parameters-by-value-or-by-reference)
about call-by-value parameter passing in Rebol and Red: you modify a
*copy* on the stack (passed down to `+` along with `1`), not the actual
value slot that sits inside block `a`.

To achieve what you want, you need to increment integers in-place,
without pushing them on the stack. One way to do so is by using
`forall`.

    >> block: [1 2 3]
    == [1 2 3]
    >> also block forall block [block/1: block/1 + 1]
    == [2 3 4]

What `forall` does is setting a word to a series and then incrementally
bumping its index:

    >> forall block [probe block]
    [1 2 3]
    [2 3]
    [3]

Since it doesn\'t extract the actual values, you can access them using
path notation, and then modify them in place. `block/1` always pick the
first value on each iteration.

*Comment by lyl:* Thank you. In your example, the function `also`
returns `block` that has been modified( \[1 2 3\] to \[2 3 4\]), why in
the following example, it return the original value?
`i:1 also i i: i + 1`, return 1 not 2

*Comment by 9214:* \@lyl, arguments to functions are evaluated from left
to right, so the first `i` evaluates to `1` before increment happens.
`also` evaluates both of its arguments, but returns the first one. In
case of a block it is different because what gets modified is a buffer
shared between two value slots.

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

    >> help forall
    USAGE:
       FORALL 'word body

    DESCRIPTION: 
       Evaluates body for all values in a series. 
       FORALL is a native! value.

    ARGUMENTS:
       'word        [word!] "Word referring to series to iterate over."
       body         [block!] 

use forall

    > a: [3 4 5 6]
    == [3 4 5 6]
    >> forall a [a/1: a/1 + 1]
    == 7
    >> probe a
    [4 5 6 7]
    == [4 5 6 7]

------------------------------------------------------------------------

### Answer (score: 1) --- by iArnold

As usual, no reply with your foreach.

    a: [2 3 4 5]
    b: copy []
    foreach i a [append b i + 1]

and if you wish you can set a to b now

    a: b

The problem with doing this in one step is that you do not have an index
you can use here (despite the suggestive letter i, but that is
representing the content of each item inside the block).

So now you can choose your favourite solution.

*Comment by lyl:* Another good solution! Thank you. And why must `copy`
be used for `b`? What\' wrong with simply `b: []`?

*Comment by iArnold:* That is a good question and it brings you closer
to understanding Rebol. Because in Rebol code is data (and data can thus
also be code) if you have a script and say b: \[\] then that is code
that (in C terms) assigns a pointer called b to that particular piece of
code represented by the \[\]. So if that changes because you say c: b
and then change c, b also changes, it points to the same initial \[\].
To do a copy makes sure it copies a new empty block \[\].

------------------------------------------------------------------------

## Comments on question

*Comment by endo64:* Here is another solution using parse:
`parse block [some [pos: integer! (change pos pos/1 + 1)]]` or
`parse block [some [change v: integer! (v/1 + 1)]]` (latter is Red only)

*Comment by lyl:* Good idea! Thank you \@endo64!
