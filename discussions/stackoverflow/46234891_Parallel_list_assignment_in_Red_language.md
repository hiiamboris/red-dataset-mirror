# Parallel list assignment in Red language

**Link:**
<https://stackoverflow.com/questions/46234891/parallel-list-assignment-in-red-language>

**Asked:** 2017-09-15 08:17:17 UTC

------------------------------------------------------------------------

I have 2 lists:

    alist: [a b c d]
    blist: [1 2 3 4]

(In reality they are long lists). How can I assign variables in alist to
corresponding values in blist in one go? Hence a becomes 1, b becomes 2
and so on.

I tried:

    foreach i alist j blist [i: j]

But it give following error:

    *** Script Error: j has no value
    *** Where: foreach
    *** Stack: 

I also tried:

    i: 1
    while [true] [ 
        if i > (length? alist) [break]
        alist/i: blist/i  
        i: i + 1
    ]

But it also does not work:

    *** Script Error: cannot set none in path alist/i:
    *** Where: set-path
    *** Stack: 

`alist/i` and `blist/i` return `none` (on checking with print command).

Similar question are there for other languages also, e.g.: [Parallel
array assignment in
PHP](https://stackoverflow.com/questions/2182563/parallel-array-assignment-in-php)
and [Parallel assignment in
Java?](https://stackoverflow.com/questions/5917684/parallel-assignment-in-java)
. Thanks for your help.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by sqlab

easy way, set one list to the other

    >> set alist blist
    == [1 2 3 4]
    >> a
    == 1
    >> b
    == 2
    >> c
    == 3
    >> d
    == 4
    >> alist
    == [a b c d]
    >> reduce alist
    == [1 2 3 4]
    >> get alist/1    
    == 1

and the cumbersome way

    >> forall alist [alist/1: blist/(index? alist) ]
    >> i: 2
    == 2
    >> get alist/:i
    == 2

*Comment by rnso:* If i=1, how can I get a list/i ?

*Comment by rnso:* Also how can I get a list with series of numbers,
like 1:10 maybe step 2?

*Comment by rnso:* Is there a map function also in red to apply a
function to all elements of list?

*Comment by sqlab:* have a look at \>\>help map-each and \>\>help for

*Comment by Graham Chiu:* \@mso you do know about
[chat.stackoverflow.com/rooms/291/rebol](https://chat.stackoverflow.com/rooms/291/rebol)
?

*Comment by sqlab:* Red does not have an official map-each, but sooner
than later it will come. Until then there are some implementations done
by users you can search on gitter.im/red/red. Same situation with for.
Ask for help on gitter.im/red/help

*Comment by rnso:* Is `pick alist i` same as `alist/:i`? Similarly, are
`poke alist i 5` and `alist/:i: 5` also same?

*Comment by sqlab:* Is pick alist i same as alist/:i? Yes and no. If i
is integer yes, otherwise alist/:i like select alist i. a.s.o. No to the
second question

------------------------------------------------------------------------

## Comments on question
