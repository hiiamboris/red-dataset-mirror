# rebol/red: Is there an elegant way to know if it is last item in foreach?

**Link:**
<https://stackoverflow.com/questions/46962613/rebol-red-is-there-an-elegant-way-to-know-if-it-is-last-item-in-foreach>

**Asked:** 2017-10-26 19:47:05 UTC

------------------------------------------------------------------------

My code is clunky:

      length: length? items
      count: 0
      foreach item items [
         count: count + 1
         if count = length [
            print "last item"
         ]
      ]

Is there something better ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by HostileFork says dont trust SE

Typically people use FORALL *(which would be much better named
FOR-NEXT)* which moves the series position as opposed to giving an item,
then you can test it with TAIL?. The downside is you have to pick the
item out of the series at the current position:

    forall items [
        probe items/1 ;-- how to access current item
        if tail? next items [ ;-- could use LAST? ITEMS in Rebol 3
            print "last item"
        ]
    ]

This is approximately equivalent to:

     if not tail? items [
         original: items
         until [
             probe items/1
             if tail? next items [
                 print "last item"
             ]
             items: next items
             tail? items
         ]
         items: original
     ]

Be forewarned: FORALL mutates its input series and tries to put it back
to the initial position at the end. But it has poorly-defined behavior
in the case of errors being raised, so you could leave your input in
mid-iteration if there is a problem.

*Comment by sqlab:* This does not work. Neither Rebol2 nor Red can print
\"last item\", as the loop stops at the tail before the print statement.
You should check at the next position **tail? next items**

*Comment by HostileFork says dont trust SE:* \@sqlab Thanks, corrected.
Note also that R3-Alpha has LAST? which might be good for Red to have
also.

------------------------------------------------------------------------

## Comments on question
