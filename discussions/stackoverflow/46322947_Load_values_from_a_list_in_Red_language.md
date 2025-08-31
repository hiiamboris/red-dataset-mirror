# Load values from a list in Red language

**Link:**
<https://stackoverflow.com/questions/46322947/load-values-from-a-list-in-red-language>

**Asked:** 2017-09-20 13:08:09 UTC

------------------------------------------------------------------------

I am trying following code to read values from a list to be put into
field elements which are also placed in another list:

    Red [needs: view]

    view [
        text "N1:"
        ff: field ""
        text "N2:"
        gg: field ""

        do [fldlist: [ff gg] 
            vv: 5  ww: 10
            varlist: [vv ww]   ]

        button "Click" [
            repeat i (length? varlist) 
                [to-set-path to-word fldlist/i/text:  varlist/:i]  ] ]

However, it is not working. The error is:

    *** Script Error: path fldlist/i/text: is not valid for none! type
    *** Where: set-path
    *** Stack: view do-events do-actor do-safe to-set-path to-word 

I also tried `:i` `(i)` and `(:i)` instead of just `i` but it is not
working. Where is the problem and how can it be solved? Thanks for your
help.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by sqlab

Use

     button "Click" [
        repeat i (length? varlist)   [
            tmp: get fldlist/:i
            tmp/text:  form get varlist/:i
        ]  
    ]

I think, you should start to read some documentation about the concepts
of
[Red](http://www.red-lang.org/p/documentation.html){rel="nofollow noreferrer"}
and [Rebol](http://www.rebol.com/docs.html){rel="nofollow noreferrer"}
and/or just debug the code in the console.

**Update**

I have to concede, that in this regards Red does not behave as I was
expecting from Rebol experience. But I got another tricky solution
without temporary words.

    button "Click" [
        repeat i (length? varlist) [
            set first find words-of get fldlist/:i  'text form get varlist/:i
        ]  
    ] 

------------------------------------------------------------------------

### Answer (score: 1) --- by rgchris

This answer uses a map to coalesce the values you\'re looking to apply,
cycles through the value names and compares them to field names with a
corresponding `extra` value, setting them to that value.

    values: #(foo: 5 bar: 10)
    fields: #()

    ui: layout [
        text "N1:"
        field 100 extra 'foo
        text "N2:"
        field 100 extra 'bar

        button "Click" [
            foreach word intersect words-of values words-of fields [
                fields/:word/text: form values/:word
            ]
        ]
    ]

    foreach kid ui/pane [
        if kid/extra [
            put fields kid/extra kid
        ]
    ]

    view ui

I would suggest however that the second example in [this
answer](https://stackoverflow.com/a/46354461/292969) is a better
approach.

------------------------------------------------------------------------

## Comments on question
