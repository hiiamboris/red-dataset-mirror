# Getting values from multiple lists to one in Red language

**Link:**
<https://stackoverflow.com/questions/46359664/getting-values-from-multiple-lists-to-one-in-red-language>

**Asked:** 2017-09-22 07:57:17 UTC

------------------------------------------------------------------------

I want to get values from 2 series into one but it is not working:

I have 2 series:

    a: [1 2 3]
    b: [4 5 6 7]

I want to get all values in one list, so that I can access them as
allv/1, allv/2\... allv/7.

Following is not working since it makes a series of series and not
series of values:

    allv:  [a b]
    print allv     ; => prints all 6 values, but following do not work: 
    print allv/1   ; => gives a  (desired is 1)
    print allv/2   ; => gives b  (desired is 2)
    print allv/3   ; => gives none (desired is 3)

I tried following function to combine values in one series:

    mycombine: function [ll][
        temp: []
        foreach l ll [
            repeat i length? l [
                temp: append temp l/:i ] ]
        temp]

    mycombine [a b]

But above gives error:

    *** Script Error: length? does not allow word! for its series argument
    *** Where: length?
    *** Stack: rncombine 

The series has got converted into word and is not working.

How can I solve this?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by sqlab

Just append

    a: [1 2 3]
    b: [4 5 6 7]
    c: [8 9 10]
    d: [11 12 13 14]
    >> allv: append a b
    == [1 2 3 4 5 6 7]
    >> a
    == [1 2 3 4 5 6 7]

does what you want. But beware even a contains all values, as you have
appendend the values of b to the block a. If you want a new block you
have to use

    allv: append copy a b

If you want to append more series you can do

    >> foreach x [a b c d] [ append [] reduce x]
    == [1 2 3 4 5 6 7 8 9 10 11 12 13 14]

Instead of reduce also `get x` is working. Another way of combining

    >> compose [(a) (b) (c)]
    == [1 2 3 4 5 6 7 8 9 10 ]

*Comment by rnso:* I have variable number of series to be combined. What
if I have to combine 4 series with different number of elements in each?

*Comment by sqlab:* you can append as many times as you like, just take
care to what block you append

*Comment by rnso:* I have combine a and b into another series, leaving a
and b unchanged. That is important.

*Comment by sqlab:* Then use a new block/series where you append to. see
the last two examples above.

*Comment by rnso:* Is this different / not recommended / not needed:
`allv: append copy allv copy a`

*Comment by sqlab:* The second copy is superfluous and not recommended.
The first copy would not work if allv is not introduced before as allv:
\[\] . If it is defined before it is a new initializing of allv.

------------------------------------------------------------------------

## Comments on question
