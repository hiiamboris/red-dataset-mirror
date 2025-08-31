# Creating a layout in Rebol

**Link:**
<https://stackoverflow.com/questions/46849640/creating-a-layout-in-rebol>

**Asked:** 2017-10-20 13:01:52 UTC

------------------------------------------------------------------------

I am trying to create a layout to be shown by view in the manner
described in answer by \@GrahamChiu on [REBOL layout: How to create
layout words automatically - word has no
context?](https://stackoverflow.com/questions/37431247/rebol-layout-how-to-create-layout-words-automatically-word-has-no-context)
:

    REBOL []

    ; WANT TO CREATE A BLOCK: [across chvar: check label "test"] , so that I can run: 
    ; view layout [across chvar: check label "test"]

    toappend: [across (to-set-word "chvar") 'check 'label "test" ]
    probe toappend

    mylist: []
    foreach i toappend [append mylist i]
    probe mylist

    view layout mylist

I later want to create a loop to add many such sets to layout.

The `probe` output is:

    [across (to-set-word "chvar") 'check 'label "test"]
    [across to-set-word "chvar" check label "test"]

However, the \"chvar\" is not getting set to `chvar:` and I am getting
following error:

    Invalid args: [to-set-word "chvar" check label "test"]

Apparently, `(to-set-word "chvar")` is not getting evaluated before
being appended. How can this be corrected?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

You forgot **compose**

For Red

    toappend:  compose [across (to-set-word "chvar") check text "test" ]
    mylist: []
    foreach i toappend [append mylist i]
    view layout mylist

as Red does not know label, otherwise same as in Rebol

------------------------------------------------------------------------

## Comments on question
