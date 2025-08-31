# Why do I get error with show window in Rebol/Red?

**Link:**
<https://stackoverflow.com/questions/47873478/why-do-i-get-error-with-show-window-in-rebol-red>

**Asked:** 2017-12-18 17:27:03 UTC

------------------------------------------------------------------------

When I click on button refresh, I get an error

    v: [field1 "to refresh" field2 "to refresh" 
    button "refresh" [show v]]
    view v

How can refresh v ?

Update: I don\'t have error but it doesn\'t refresh:

        test: [
          ["a1" "b1"]
          ["a2" "b2"]  
        ]

        i: 1
        v: layout compose [
          field data test/:i/1 field data test/:i/2 button "refresh" [i: i + 1 show v]
        ]
        view v

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

Show expects a face, not a block. You want probably something along

      v: layout [
         f1: field "to refresh" 
         f2: field "to refresh" 
         button "refresh" [f1/text: f2/text show v ]
      ]

To see a change you should type something in the second input field
before clicking on the button.

To make something (usefully) working with your update you can use

    i: 1
    sw: true
    v: layout compose [
        f1: field data test/:i/1 
        f2: field data test/:i/2 
        button "refresh" [
            i: pick [1 2] sw: not sw
            f1/text: test/:i/1
            f2/text: test/:i/2
            show v
        ]
    ]

**show** does not load the face definition block again, but the
[red-gui-system
docs](http://www.red-lang.org/2016/03/060-red-gui-system.html){rel="nofollow noreferrer"}
say

\"Red/View will update both face and graphic objects in realtime as
their properties are changed. This is the default behavior, but it can
be switched off, when full control over screen updates is desirable.
This is achieved by:

    system/view/auto-sync?: off

When automatic syncing is turned off, you need to use show function on
faces to get the graphic objects updated on screen.\"

I guess you can get something similar to your intention by destroying
the old face object and building a new with the specification block.

     test: [
      ["a1" "b1"]
      ["a2" "b2"]  
    ]
    i: 1
    sw: true

    vvw: layout v:  [
      field data test/:i/1 
      field data test/:i/2 
      button "refresh" [
          i: pick [1 2] sw: not sw
          unview vvw
          view v
      ]
    ]
    view vvw

*Comment by user310291:* Thanks, I updated my code, no more error, but
it doesn\'t refresh

*Comment by sqlab:* It does refresh. The content of the first field
**f1** is updated to the content of the second field **f2**. But of
course you should change first the content of the second field to see a
change. Otherwise it will always be the same.

*Comment by user310291:* you put f1/text in button refresh It shouldn\'t
be required since layout has already f1: field data test/:i/1 so show
should reload v but it doesn\'t that\'s what I mean by refresh do as if
v was loaded the first time.

*Comment by sqlab:* show doesn not load the face definition block again,
but just triggers the updates of the changes in case the sync is off

*Comment by user310291:* sqlab so I understand there isn\'t any function
that can refresh.

*Comment by endo64:* I\'ve faced a similar refresh issue,
`face/text: ""`was the only solution. It somehow forces face to be
refreshed.

------------------------------------------------------------------------

### Answer (score: 0) --- by Eran W

Not sure what you mean by \"refresh\", but Red\'s GUI is *reactive*, you
don\'t need to explicitly tell it to update.

If you just want to update the text data (increment its value) - here\'s
a short working example:

    view [f: field "42" button "increment" [f/data: f/data + 1]]

That is, `f` is assigned to the just created `field`. On button press -
it receives new value, by acessing its `data` member.

------------------------------------------------------------------------

## Comments on question

*Comment by sqlab:* Can you show what do you expect what your script
should do? You are just counting up the value to which **i** is
pointing. That is totally independent of your layout.
