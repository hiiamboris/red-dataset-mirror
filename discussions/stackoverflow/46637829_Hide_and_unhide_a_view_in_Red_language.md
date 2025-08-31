# Hide and unhide a view in Red language

**Link:**
<https://stackoverflow.com/questions/46637829/hide-and-unhide-a-view-in-red-language>

**Asked:** 2017-10-09 01:53:23 UTC

------------------------------------------------------------------------

I am trying following code to have a second view which can be hidden and
shown again repeatedly while preserving values in its fields:

    Red []

    secondFstr: ""
    secondshownonce: false
    secondshowing: false

    secondview: does [
        secondshownonce: true
        if not secondshowing [
          secondshowing: true
          view [ below
            text "second view"
            f2: field secondFstr []
            b3: button "Hide" [
                secondshowing: false
                unview ]]]]

    view [ below
        text "first view"
        b1: button "Print f2 text" [
              either not secondshownonce 
                [print "not shown"]
                [print f2/text] ]
        b2: button "Show 2nd view" [secondview] ]

It works all right if \'hide\' button is used for second view. But if
the second view is closed by clicking \'x\' at its top right corner, it
cannot be shown again. How can I solve this problem?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by DocKimbel

You need to add an handler to the `close` event on that child window, in
order to reset your flag properly, like this:

    view/options [
        below
        text "second view"
        f2: field secondFstr []
        b3: button "Hide" [
            secondshowing: false
            unview
        ]
    ][
        actors: object [
            on-close: func [face event][
                secondshowing: false
            ]
        ]
    ]

*Comment by rnso:* After closing second view by top right corner \'x\',
I cannot reopen it. (It reopens if I use \'hide\' button).

*Comment by DocKimbel:* It works fine after replacing your second view
code with the one I posted here. Didn\'t you try it?

------------------------------------------------------------------------

## Comments on question

*Comment by Graham Chiu:* Is there a way to hook into the close event?

*Comment by rnso:* on-close documentation is not available:
[red-by-example.org/index.html#0on-close](http://www.red-by-example.org/index.html#0on-close){rel="nofollow noreferrer"}
. Also not there on this page:
[mycode4fun.co.uk/red-beginners-reference-guide](http://www.mycode4fun.co.uk/red-beginners-reference-guide){rel="nofollow noreferrer"}
or on
[doc.red-lang.org/en/view.html](https://doc.red-lang.org/en/view.html){rel="nofollow noreferrer"}
