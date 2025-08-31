# code with to-word and to-path in Red language

**Link:**
<https://stackoverflow.com/questions/46390547/code-with-to-word-and-to-path-in-red-language>

**Asked:** 2017-09-24 13:27:16 UTC

------------------------------------------------------------------------

I am trying to create 2 panels through single function using compose:

    make-panel: func [sentchar][
         probe compose/deep [
            text "N1:"    
            (to-set-word rejoin["fld1" sentchar ":"]) field    ; TO BE NAMED fld1A and fld1B for 2 panels
            text "N2: "   
            (to-set-word rejoin["fld1" sentchar ":"]) field    ; TO BE NAMED fld2A and fld2B for 2 panels      
            text "Product: "    
            (to-set-word rejoin ["txt_out" sentchar ":"]) text    ; TO BE NAMED txt_outA and txt_outB for 2 panels
            button "Get product" [ 
               x: to-path to-word (rejoin ["face/parent/pane/fld1" sentchar "/text"])
               y: to-path to-word (rejoin ["face/parent/pane/fld2" sentchar "/text"])
               (to-set-path (to-path rejoin ["face/parent/pane/txt_out" sentchar "text"] )) 
                    form multiply get x get y  ]  ] ]

    view compose [
        (make-panel "A") return 
        (make-panel "B") return ]

However, I am getting errors regarding to-word and to-path even though I
have tried different combinations. Where is the problem?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 5) --- by rgchris

Your error is in trying to create a word with a \"/\" character.

    >> to-word "foo/bar"
    *** Syntax Error: invalid character in: "foo/bar"
    *** Where: to
    *** Stack: to-word  

My second inclination is that you shouldn\'t be using strings to compose
value references---if nothing else you lose binding. Can try the
following:

    to path! compose [face parent pane (to word! rejoin ["fld2" sentchar]) text]

~~My first inclination is that you\'re overcomplicating this, but
that\'s beyond the scope of your question.~~

### Update:

I will attempt to address some of the other issues in this code:

## Naming

A note on `make-panel`---it\'s a misnomer as you are not making a
`panel`, just grouping some element specs together. For the purposes of
this answer, I\'ll use the name `make-row`. Also, I will never have any
love for names like `fld1` or `tout` (which is an actual word!) but will
persevere.

## Dynamic Named Selectors

As I mentioned above, you are always better off starting with words vs.
strings as in Rebol/Red, words acquire context during evaluation---words
loaded from strings do not. For example:

    make object! [
        foo: "bar"
        probe get first [foo] ; "bar"
        probe get first load "[foo]" ; error
    ]

As you\'re creating three new words, let\'s do that explicitly:

    make-row: function [row-id [string!]][
        fld1: to word! rejoin ["fld1-" row-id]
        fld2: to word! rejoin ["fld2-" row-id]
        tout: to word! rejoin ["tout-" row-id] ; note that 'tout is an English word

        ...
    ]

From here, we can start to build unique references in our spec.

    make-row: func [row-id [string!] /local fld1 fld2 tout][
        fld1: to word! rejoin ["fld1-" row-id]
        fld2: to word! rejoin ["fld2-" row-id]
        tout: to word! rejoin ["tout-" row-id]

        compose/deep [
            text "N1:"
            (to set-word! fld1) field
            text "N2:"
            (to set-word! fld2) field
            text "Product:"
            (to set-word! tout) text
            button "Get Product" [
                ...
            ]
            return
        ]
    ]

Now we get into a sticky area with this button action:

    x: to-path to-word (rejoin ["face/parent/pane/fld1" sentchar "/text"])
    y: to-path to-word (rejoin ["face/parent/pane/fld2" sentchar "/text"])
    (to-set-path (to-path rejoin ["face/parent/pane/tout" sentchar "text"] )) 
         form multiply get x get y  ]  ] ]

I think can express in pseudo-code what you\'re trying to do:

    Product = text of product of N1 for this row * N2 for this row

The main error in your code here is you\'re mixing proximity references
with your named references. If you examine `face/parent/pane`, it has no
`fld1*`, `fld2*` or `tout*` references in there, it\'s just a block of
face objects. As you\'ve gone to the effort to make unique names, let\'s
roll with that for the moment. Remember, we\'re still deep in a
`compose/deep` operation:

    x: get in (fld1) 'data
    y: get in (fld2) 'data
    set in (tout) 'text form x * y

We\'re much more concise now and everything should be working (note that
`'data` gives you the loaded value of `'text`).

## Proximity Selectors

My concern though by this point is we\'ve a lot new words floating about
and we needed that `x` and `y`. So let\'s return to the idea of
proximity.

When you look at your composed View spec:

    view probe compose [
        (make-row "A")
        (make-row "B")
    ]

You\'ll see that your main view face will contain a lot of children. To
find faces within proximity of the button you\'re clicking, we first
need to find the button within the face. Let\'s do this:

    button "Get Product" [
        this: find face/parent/pane face
    ]

And as there\'s six preceding faces associated with the button, let\'s
go to the beginning of this set:

    button "Get Product" [
        this: skip find face/parent/pane face -6
    ]

Now we can do our calculations based on proximity:

    button "Get Product" [
        here: find face/parent/pane face
        here/6/text: form here/2/data * here/4/data
    ]

Boom! We have the same product with only one word `here` as opposed to
`rows-count * 3 + x + y`. Awesome!

As we\'re not generating any additional words, we don\'t even need a
function to generate our rows, boils down to the following:

    row: [
        text "N1:" field
        text "N2: " field
        text "Product: " text 100
        button "Get product" [
            ; go back six faces from current face
            here: skip find face/parent/pane face -6
            here/6/text: form here/2/data * here/4/data
        ]
        return
    ]

    view compose [
        (row)
        (row)
    ]

## Group Selectors

As you seem to have complex needs and can\'t always enumerate the fields
you need, you can use the `extra` field to group fields together. We can
do this by using block to contain the `row-id` and the `field-id`:

    make-row: func [row-id][
        compose/deep [
            text "N1:" field extra [(row-id) "N1"]
            text "N2: " field extra [(row-id) "N2"]
            text "Product: " text 100 extra [(row-id) "Output"]

            button "Get product" extra (row-id) [
                ...
            ]
            return
        ]
    ]

    view compose [
        (make-row "A") 
        (make-row "B")
    ]

Within the button action, we can collect all of the faces associated
with the row:

    faces: make map! collect [
        foreach kid face/parent/pane [
            if all [
                block? kid/extra
                face/extra = kid/extra/1
            ][
                keep kid/extra/2
                keep kid
            ]
        ]
    ]

This gives you a nice map! with all associated faces and a simple
calculation:

    faces/("Output")/text: form faces/("N1")/data * faces/("N2")/data

If you\'re only going to use it for the product, then you don\'t even
need to collect:

    product: 0
    foreach kid face/parent/pane [
        if all [
            block? kid/extra
            face/extra = kid/extra/1
        ][
            product: product + kid/value
        ]
    ]

*Comment by rnso:* It is not working. On filling up fields and clicking
button, I get
`*** Script Error: path face/parent/pane/fld1A/text is not valid for none! type; *** Where: get; *** Stack: view do-events do-actor do-safe `
(even though there are numbers in both fld1A and fld2A).

*Comment by rgchris:* \@rnso As I said, there\'s more problems here than
the one you asked about.

*Comment by rnso:* I do not want to use numbers for finding fields
because that may not be easy if there are large number of fields and
also if any middle field is added or deleted, all numbers will have to
change. Can we get unique field names for different rows created by same
function as I was trying?

*Comment by rnso:* What is the best way to go if one has to create many
gui objects of same type? Can we do object oriented programming here?

*Comment by rgchris:* re. numbers: You can go with the first part wrt.
named fields, though I\'d still be inclined against it. Words are always
going to be middle-men and you\'re going to end up managing a lot of
names in addition to fields. wrt. object oriented---absolutely, though
you have to be careful the way you clone face objects.

*Comment by rnso:* Can you provide a link for OOP with gui elements in
Red/Rebol. Also when to to word! vs to-word. And can we keep fld1 etc as
global variables?

*Comment by rgchris:* \@rnso Update: Added a section on using `extra` as
a grouping mechanism; [Face
Object](https://doc.red-lang.org/en/view.html#_face_object){rel="nofollow noreferrer"}
documentation; `to-word` is shorthand for `to word!`; and note that I
answered your question in the first four lines.

*Comment by Graham Chiu:* Why don\'t you put the \'return inside \'row
as well?

*Comment by rgchris:* \@rnso *\'And can we keep fld1 etc as global
variables?\'* ---it\'s your code, I\'m just laying out the options for
you. The whole section \'Dynamic Named Selectors\' does exactly that.

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

a real challenge

    make-panel: func [sentchar][
        compose/deep [
            text "N1:"  (to-set-word rejoin['fld1 sentchar ]) field    ; TO BE NAMED fld1A and fld1B for 2 panels
            text "N2:"  (to-set-word rejoin['fld2 sentchar ]) field    ; TO BE NAMED fld2A and fld2B for 2 panels      
            text "Product: "  (to-set-word rejoin ['tout sentchar]) text    ; TO BE NAMED toutA and toutB for 2 panels
            button "Get product" [ 
                x:   ( to-path reduce   [ to-word  rejoin ["fld1" sentchar]  'text ])  
                y:    (to-path reduce   [ to-word  rejoin ["fld2" sentchar]  'text ])   
                (to-set-path reduce [to-word rejoin ["tout" sentchar] 'text])   form multiply load  x load  y
            ] 
        ]
    ]

    view v: compose   [
        (make-panel "A") return 
        (make-panel "B") return 
    ]

Of course, you do not need the intermediary words **x** and **y**. But
this you can do by yourself.

*Comment by sqlab:* Where does to to-word and to-path not work? Who
claims that?

*Comment by rgchris:* \@rnso Faces are objects that if currently
displayed are children or descendants of one of the screen faces
(`system/view/screens`). A child is simply a face object that is or
resides in a block set to `face/parent/pane`. This is covered quite well
in [the Red
documentation](https://doc.red-lang.org/en/view.html#_the_face_tree){rel="nofollow noreferrer"}

------------------------------------------------------------------------

## Comments on question
