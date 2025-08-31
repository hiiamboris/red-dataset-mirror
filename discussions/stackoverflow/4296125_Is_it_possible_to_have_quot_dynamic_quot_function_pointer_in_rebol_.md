# Is it possible to have &quot;dynamic&quot; function pointer in rebol?

**Link:**
<https://stackoverflow.com/questions/4296125/is-it-possible-to-have-dynamic-function-pointer-in-rebol>

**Asked:** 2010-11-28 09:12:22 UTC

------------------------------------------------------------------------

I can create p as a pointer to f like this:

    f: func[][print 1]
    p: :f

When executing:

    >> p
    1

But if I modify f to

    f: func[][print 1 print 2]

p won\'t print 2.

Is there another way to get p points \"dynamically\" to f ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by Carl Read

Note you\'ve created a new instance of f there - not modified it. You
can modify f though by altering the contents of its second block. ie\...

    >> f: func[][print 1]
    >> p: :f
    >> p
    1
    >> append second :f [print 2]
    == [print 1 print 2]
    >> p
    1
    2

Hope that helps.

*Comment by Ladislav:* In R3 it *is* possible to modify functions if you
can access the original body of the function.

------------------------------------------------------------------------

### Answer (score: 1) --- by Sunanda

You could use an **alias**.

Alias in REBOL is a little limited as you cannot use any pre-existing
word as an alias. But this works for me:

    f: does [print 1]    ;; define 'f as you do
    alias 'f "px"        ;; create an alias as 'px
    px 
    == 1                 ;; same result as 'f

    f: context [a: 3]    ;; change 'f to something completely different
    probe px             ;; 'px is the same as the new 'f
        make object! [
            a: 3
        ]

*Comment by Rebol Tutorial:* I love alias very much but many times it\'s
very buggy often it pretends that there is already an alias for the
string whereas it isn\'t true.

*Comment by Rebol Tutorial:* Hope alias works better in rebol 3 but I
remember carl wanted to drop it down for the very reason he knows it\'s
buggy

------------------------------------------------------------------------

### Answer (score: 0) --- by moliad

when you do F: :P you are actually doing F \"points to\" P\'s *value*
(the function).

when you do P: func \[\]\[\] again, you are creating a new function
*value* to which only P is assigned the value.

the only way to have indirection is via an accessor, something like F:
does \[P\]

when p changes *value* f will know to call the new function since the
binding of P has not changed, only its value (which is a new function).

alias are word equivalencies, not pointers, so they are also valid as
words on paths and are quite nasty in real world use.

------------------------------------------------------------------------

## Comments on question
