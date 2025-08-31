# Red vid open window with maximize

**Link:**
<https://stackoverflow.com/questions/43262139/red-vid-open-window-with-maximize>

**Asked:** 2017-04-06 17:37:00 UTC

------------------------------------------------------------------------

When run this code, it will open the window with a default size:

    View [
        text "window open with default size"
    ]

If a give a size explicitly, it will open a window with that size:

    View [
        size 400x400
        text "window open with fixed size"
    ]

But how do I open a window with the maximum size / maximized?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by Geeky I

Here\'s what kinda works for now on at least *Microsoft* Windows

    offset: 0x60
    max-size: system/view/screens/1/size - offset
    view [
        size max-size
        text "window open with max screen size"
    ]

But, this is because of the way it\'s currently handled, as you can see,
most window handling features aren\'t currently implemented:

[![enter image description
here](https://i.sstatic.net/CWa6H.png)](https://i.sstatic.net/CWa6H.png){rel="nofollow noreferrer"}

(based on chat):

------------------------------------------------------------------------

## Comments on question
