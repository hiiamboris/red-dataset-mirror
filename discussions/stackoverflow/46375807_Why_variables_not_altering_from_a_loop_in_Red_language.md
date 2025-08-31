# Why variables not altering from a loop in Red language

**Link:**
<https://stackoverflow.com/questions/46375807/why-variables-not-altering-from-a-loop-in-red-language>

**Asked:** 2017-09-23 03:43:23 UTC

------------------------------------------------------------------------

I want to alter a series of variables from a loop, but the following
code is not working:

    a: 10
    b: 20
    c: 30
    print reduce [a b c]              ; output is 10 20 30 as expected

    varnames: [a b c]                 ; make a series of variables
    foreach i varnames [              ; loop to convert each to 0
        i: 0
    ]

    print "After conversion loop: "
    print reduce [a b c]              ; values are still 10 20 30 (expected 0 0 0)

After running this code, I\'d expect the values of `a`, `b`, `c` to be
changed, but they\'re not:

    >> print reduce [a b c]   
    10 20 30

Where is the problem?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by Graham Chiu

    >> set varnames: [a b c] [10 20 30]
    == [10 20 30]

    >> foreach i varnames [set i 0]
    == 0

    >> reduce varnames
    == [0 0 0]

You\'ve given i a value from the loop, and then given it a different
value of 0, but you actually haven\'t altered the word that i referred
to. `set` allows you to do this.

*Comment by rnso:* Yes, it works. I think set should be emphasized more
than \':\' assignment.

*Comment by rnso:* Do you need colon in
`set varnames: [a b c] [10 20 30]` ?

*Comment by Geeky I:* \@rnso no; `set varnames [a b c] [10 20 30]` is
fine

*Comment by sqlab:* \@Geeky, this can\'t work. Try it in a new console
and you will see why not. It needs at least two operation, first **set
\'varnames \[a b c\]**

*Comment by sqlab:* or in one line **set set \'varnames \[a b c\] \[10
30 40\]**

*Comment by Geeky I:* \@sqlab you\'re right, I assumed `varnames` was
already defined before

*Comment by sqlab:* Even if **varnames** is already defined, it will not
work, as varnames is set to **\[a b c\]** and then **\[10 20 30\]** is
left alone

------------------------------------------------------------------------

### Answer (score: 2) --- by sqlab

one more, but shortest solution

    >> set [a b c] 0
    == 0
    >> reduce [a b c]
    == [0 0 0]

one more

    set set 'varnames [a b c] [0]
    >> print probe varnames
    [a b c]
    0 0 0

*Comment by sqlab:* Question and answers very similar to
[stackoverflow.com/questions/46234891/...](https://stackoverflow.com/questions/46234891/parallel-list-assignment-in-red-language/46235435#46235435 "parallel list assignment in red language")

*Comment by Geeky I:* `set varnames: [a b c] 0`

*Comment by sqlab:* of course, but **set set-word:** was shown already
by Graham above

------------------------------------------------------------------------

## Comments on question
