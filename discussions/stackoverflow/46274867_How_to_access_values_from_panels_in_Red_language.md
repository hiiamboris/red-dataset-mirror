# How to access values from panels in Red language

**Link:**
<https://stackoverflow.com/questions/46274867/how-to-access-values-from-panels-in-red-language>

**Asked:** 2017-09-18 08:33:16 UTC

------------------------------------------------------------------------

I am using following code to find products of 2 series of numbers and
then to find sum of these products:

      make-row: func [][
        compose [
            t1: text "N1:"
            f1: field 
            t2: text "N2: "
            f2: field
            t3: text "Product: "
            t4: text ""
            b: button "Get product" [
                x: face/extra/2/text          
                y: face/extra/4/text
                z: (to-integer x) * (to-integer y)
                face/extra/6/text: rejoin [z]]
            do [b/extra: reduce [t1 f1 t2 f2 t3 t4]] ]  ]

      view compose [
            (make-row) return 
            (make-row) return
        b: button "Calculate" [t2/text: "..to be given"]
        t1: text "Sum of products:"
        t2: text ""                       ; NEED TO GET SUM OF ALL PRODUCTS IN ABOVE ROWS. 
      ]  

The first part is working all right - The products are being calculated
properly. But how can I access these individual products to find sum of
products? I could not find any way since the rows are not really objects
whose public variables or methods/functions I may be able to access. How
can this be solved? Thanks for your help.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by sqlab

As I just learned about faces and panes, here a solution without error
handling

    make-row: func [][
         compose [
            text "N1:"
            field 
            text "N2: "
            field
            text "Product: "
            text ""
            button "Get product" [
                b1: index? find face/parent/pane  face
                face/parent/pane/(b1 - 1)/text:  form multiply   to-integer   face/parent/pane/(b1 - 5)/text  to-integer face/parent/pane/(b1 - 3)/text  
            ]

        ]  
    ]
    view compose [
        (make-row) return 
        (make-row) return
        button "Calculate" [
            t2/text:   form add to-integer face/parent/pane/6/text  to-integer face/parent/pane/13/text
        ]
        text "Sum of products:"
        t2: text ""  
    ]   

All face objects are ordered in the pane block of the parent face. So
looking at the index of the clicked face object you get a reference to
compute the position of other face objects.

*Comment by rnso:* Some explanation on how it is working will be
appreciated.

*Comment by Geeky I:* Btw \@rnso, I noticed you reformatted the
indentation and brackets in a lispy style. Check the red standard here:
[github.com/red/red/wiki/Coding-Style-Guide#block-layouts](https://github.com/red/red/wiki/Coding-Style-Guide#block-layouts){rel="nofollow noreferrer"}

*Comment by rnso:* I did\'nt know there is an official style for Red
language. Lispy style mainly saves space (almost empty lines).

*Comment by rgchris:* \@rnso By the looks of it, the calculations are
done based on the proximity of faces to button clicked (see the line
`find face/parent/pane face`). Remember that once created, faces are
merely objects structured in a hierarchical way where the usual rules of
Red apply. You can see this here:
`view [text "Some" text "Words" text "In" text "A" text "Window" button "Remove" [remove face/parent/pane]]`

------------------------------------------------------------------------

## Comments on question

*Comment by DocKimbel:* In `b/extra: reduce [t1 f1 t2 f2 t3 t4]`, why do
you save 6 face references when you use only 3 of them later?
