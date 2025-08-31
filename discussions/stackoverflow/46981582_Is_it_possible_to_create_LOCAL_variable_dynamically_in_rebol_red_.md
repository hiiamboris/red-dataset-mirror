# Is it possible to create LOCAL variable dynamically in rebol / red?

**Link:**
<https://stackoverflow.com/questions/46981582/is-it-possible-to-create-local-variable-dynamically-in-rebol-red>

**Asked:** 2017-10-27 18:45:41 UTC

------------------------------------------------------------------------

It is easy to create GLOBAL variables dynamically in rebol / red with
set like

    i: 1
    myvarname: rejoin ["var" i]
    set to-word myvarname 10
    var1

but then var1 is global. What if I want to create var1 dynamically
inside a function and make it LOCAL so as to avoid collision with some
global variables of same name ?

In javascript it is possible: [How to declare a dynamic local variable
in
Javascript](https://stackoverflow.com/questions/17322450/how-to-declare-a-dynamic-local-variable-in-javascript)

Not sure it is possible in rebol/red ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by HostileFork says dont trust SE

In Rebol, there is USE:

    x: 10
    word: use [x] [
       x: 20
       print ["Inside the use, x is" x]
       'x ;-- leak the word with binding to the USE as evaluative result
    ]
    print ["Outside the use, plain x is" x]
    print ["The leaked x from the use is" get word]

That will give you:

    Inside the use, x is 20
    Outside the use, x is 10
    The leaked x from the use is 20

One should be forewarned that the way this works is it effectively does
a creation like **make object! \[x: none\]**. Then it does a deep walk
of the body of the USE, looking for ANY-WORD! that are named **x** (or
**X**, case doesn\'t matter)\...and binds them to that OBJECT!.

This has several annoying properties:

-   The enumeration and update of bindings takes time. If you\'re in a
    loop it will take this time each visit through the loop.

-   The creation of the OBJECT! makes two series nodes, one for tracking
    keys (x) and one for tracking vars (20). Again if you are in a loop,
    the two series nodes will be created each time through that loop. As
    the GET outside the loop shows, these nodes will linger until the
    garbage collector decides they\'re not needed anymore.

-   You might want to say **use \[x\] code** and not disrupt the
    bindings in code, hence the body would need to be deep copied before
    changing it.

The undesirable properties of deep binding led Red to [change the
language
semantics](https://github.com/red/red/wiki/Differences-between-Red-and-Rebol#local-contexts-for-loops){rel="nofollow noreferrer"}
of constructs like FOR-EACH. It currently has no USE construct either,
perhaps considered best to avoid for some of the same reasoning.

*(Note: New approaches are being investigated on the Rebol side for
making the performance \"acceptable cost\", which might be good enough
to use in the future. It would be an evolution of the technique used for
[specific
binding](https://github.com/metaeducation/ren-c/wiki/Relative-Binding-and-FRAME!-Internals){rel="nofollow noreferrer"})*.

*Comment by user310291:* I know use but I can\'t see how to add
variables inside use block dynamically (I\'m in the context of a code
generator): maybe it\'s not even possible ?

*Comment by HostileFork says dont trust SE:* \@user310291 You might find
[this
answer](https://stackoverflow.com/questions/46350543/use-strings-to-create-words-and-paths-in-red-language/46352390#46352390)
instructional on that point.

------------------------------------------------------------------------

### Answer (score: 2) --- by sqlab

In Red you have **function**, in Rebol2 you have **funct**. Both create
local variable words automatically. Here an example for Rebol2

    >> for num 1 100 1 [ 
    [      set to-word rejoin ["f" num] funct [] compose/deep [
    [            print [ "n =" n:  (num) ]
    [          ]
    [    ]
    >> f1
    n = 1
    >> f2
    n = 2
    >> n
    ** Script Error: n has no value
    ** Near: n

How it is done, you can see with `source funct`

------------------------------------------------------------------------

## Comments on question
