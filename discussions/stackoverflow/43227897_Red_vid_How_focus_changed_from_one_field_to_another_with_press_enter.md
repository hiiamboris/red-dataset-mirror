# Red vid How focus changed from one field to another with press enter

**Link:**
<https://stackoverflow.com/questions/43227897/red-vid-how-focus-changed-from-one-field-to-another-with-press-enter>

**Asked:** 2017-04-05 10:00:05 UTC

------------------------------------------------------------------------

    View [
         f1:  field focus
         f2:  field
    ]

When run this code cursor get focus in `f1` But I want to press enter
and focus will be in `f2`. How can I do that?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by DocKimbel

From inside a `on-enter` handler, you need to change the
[`selected`](https://doc.red-lang.org/en/view.html#_window){rel="nofollow noreferrer"}
facet of the window face (just the parent face in this case) to point to
the face you want to focus on. So your code becomes:

    view [ f1: field focus on-enter [face/parent/selected: f2] f2: field ]

If you need to change focus often, you can define a convenient shortcut
function:

    set-focus: function [face [object!]][
        p: face/parent
        while [p/type <> 'window][p: p/parent]
        p/selected: face
    ]

    view [ f1: field focus on-enter [set-focus f2] f2: field ]

Red/View will provide a built-in `set-focus` function in future
versions, so you won\'t have to define it in your own code.

*Comment by Raton Kumar:* It\'s my pleasure to have response from the
father of red . thanks

------------------------------------------------------------------------

## Comments on question

*Comment by Graham Chiu:* Is there a set-focus f2 command in red?

*Comment by DocKimbel:* No built-in `set-focus` function yet.

*Comment by DocKimbel:* Ok, now [it
has](https://github.com/red/red/commit/4e621a9a899c613a9538105464c04a9da7e0157c){rel="nofollow noreferrer"}.
