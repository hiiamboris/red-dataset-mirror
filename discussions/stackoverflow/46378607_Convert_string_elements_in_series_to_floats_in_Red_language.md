# Convert string elements in series to floats in Red language

**Link:**
<https://stackoverflow.com/questions/46378607/convert-string-elements-in-series-to-floats-in-red-language>

**Asked:** 2017-09-23 10:30:35 UTC

------------------------------------------------------------------------

I want to convert many decimal numbers available as strings to floats in
one go. I am trying following code which combines these strings into a
series and then convert them to floats. This works all right but fails
if there is an error:

    a: "1.5" 
    b: ""
    c: "3.7"
    invars: [a b c]

    print a
    print type? a

    set invars foreach x invars [append [] to-float reduce x]  ; code to convert string series to float series; 

    print a
    print type? a

The error is:

    *** Script Error: cannot MAKE/TO float! from: ""
    *** Where: to
    *** Stack: to-float 

For error correction, I tried following code:

    temp: []
    foreach x invars [
        y: copy ""
        either error? [set [y] to-float reduce x]
            [append temp reduce x]         ; put original value if not convertable
            [append temp reduce y]  ]
    print temp 
    set invars temp
    print a 
    print type? a

But this is also not working. Where is the problem and how can this be
corrected?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by sqlab

    forall invars [invars/1:  load get invars/1]
    >> invars
    == [1.5 [] 3.7]

and if you want to get rid of the empty blocks

    >> replace/all invars block! 0
    == [1.5 0 3.7]

and if you really want to do all in (:less:) steps

    forall invars [invars/1: either empty? invars/1: get invars/1 [0.0] [load invars/1]]

After you can set your variables again.

But if you want just set your variables, you have to do

    foreach x invars [set :x load get x]

with to-float

     foreach x invars [either empty? get x [set :x 0] [set :x to-float get x]]

and finally an all error safe version with to-float

    foreach x invars [attempt [set :x to-float get x]]
    == 3.7
    >> a
    == 1.5
    >> b
    == ""
    >> c
    == 3.7

*Comment by rnso:* Where do I put `to-float` ?

*Comment by sqlab:* If you use a solution with **either empty?** you
could replace **load** with **to-float**

*Comment by sqlab:* Which one is not working? All versions work as
described. Use a new fresh console

*Comment by rnso:* Ok. I was setting invars again to output of above
code.

*Comment by rnso:* Can you point me to documentation link where use of
`:x` (colon before variable) is described?

*Comment by sqlab:* maybe
[rebol.org/ml-display-message.r?m=rmlBPQQ](http://www.rebol.org/ml-display-message.r?m=rmlBPQQ){rel="nofollow noreferrer"}
or
[rebol.com/docs/core23/rebolcore-4.html](http://www.rebol.com/docs/core23/rebolcore-4.html){rel="nofollow noreferrer"}

*Comment by rgchris:* \@rnso Rebol documentation: [5.4 Getting
Words](http://www.rebol.com/docs/core23/rebolcore-4.html#section-5.4){rel="nofollow noreferrer"}

*Comment by rgchris:* `set :x` is repeated in your example, can write
`set x either empty? get x [0.0][to float! get x]`

*Comment by sqlab:* There is always room for enhancements.) This way is
already shown in one of the versions above.

------------------------------------------------------------------------

## Comments on question
