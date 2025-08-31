# Creating a series of numbers in Red language

**Link:**
<https://stackoverflow.com/questions/46672835/creating-a-series-of-numbers-in-red-language>

**Asked:** 2017-10-10 17:44:42 UTC

------------------------------------------------------------------------

I have a few simple questions, hence I am putting them together:

1.  What is the best way to create a series of numbers. Following works
    but is there a simpler method like 1:10 available in some languages?

    `myseries: []`

    `repeat i 10 [append myseries i]`

    `print myseries`

(1a. Why is above code not making usual code block on this page?)

2.  Similarly, what is the best way to create a series of 10 elements,
    all initialized to 0 or \"\"? Do I have to use there also
    `repeat i 10` or `loop 10` and serially `append` an initially blank
    series?

3.  Also, should I specify the number of elements as in following code
    while creating the series initially? What is the disadvantage of not
    doing this?

    myseries: make block! 10

Thanks for your help.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 6) --- by draegtun

1\) My preference would be to go with
[COLLECT](http://www.rebol.com/r3/docs/functions/collect.html){rel="noreferrer"}
here:

    myseries: collect [repeat i 10 [keep i]]

2\) See
[ARRAY](http://www.rebol.com/r3/docs/functions/array.html){rel="noreferrer"}
function:

    >> array/initial 10 0
    == [0 0 0 0 0 0 0 0 0 0]

You can also pass it a anonymous function:

    >> i: 0 array/initial 10 does [i: i + 1]
    == [1 2 3 4 5 6 7 8 9 10] 

3\) Generally it is good practise to use `myseries: make block! 10` (or
just 0 if size of block is unknown) to avoid unnecessary gotchas! See
[To copy or not to copy, that is the
question](http://www.rebol.net/cgi-bin/r3blog.r?view=0006){rel="noreferrer"}
& [Is REBOL a Pure Functional
Language?](http://www.rebol.com/article/0206.html){rel="noreferrer"}

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

1\) I do not know about a better way at this time, although on
[https://gitter.im/red/\...](https://gitter.im/red/home){rel="nofollow noreferrer"}
there are discussions about a range data type or **for** implementations

a\) It makes a block. You see that with `probe myseries`. What do you
expect?

2\) `>> append/dup [] 0 10 == [0 0 0 0 0 0 0 0 0 0]`

3\) If you do not initialize/reserve the needed memory, **Red** has to
make a guess how much memory is needed. This can be more than needed or
less. If less then Red has to allocate another chunk of memory. This can
happen a few times if you need more memory. Maybe it has to move around
memory blocks too if it wants continuous memory, but I do not know about
the strategy used.

------------------------------------------------------------------------

## Comments on question

*Comment by Geeky I:* This is definitely one of the things I feel should
be easier to do. However, one of the reasons it isn\'t that way already
is the focus is on acting on the data directly rather than generating a
series before hand. Still, lots of other array processing features on my
wish list
