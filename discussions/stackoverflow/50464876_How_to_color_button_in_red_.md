# How to color button in red?

**Link:**
<https://stackoverflow.com/questions/50464876/how-to-color-button-in-red>

**Asked:** 2018-05-22 10:00:54 UTC

------------------------------------------------------------------------

I tried this code snippet like in rebol:

    View [button "colored" 100.0.0]

but the button is still in grey.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 0) --- by DocKimbel

Such feature is not supported yet when using native button widget.
Though, you can create a custom button easily using the versatile `base`
face type:

    view [
        base red
            on-down [face/color: face/color / 2]
            on-up   [face/color: face/color * 2]
    ]

You can also create a new custom style out of that (requires at least
Red autobuild from master branch from Jan 3rd, 2019):

    view [
        style but: base
            on-down [face/color: face/color / 2 do-actor face event 'click]
            on-up   [face/color: face/color * 2]

        but "Say hi!" red on-click [print "hi"]
    ]

------------------------------------------------------------------------

## Comments on question

*Comment by endo64:* In Red buttons created using OS native widgets and
button color is not supported yet. It works on Rebol because Rebol\'s
buttons are not native OS buttons. And on Windows background color on
buttons supported only for owner-drawn buttons
([msdn.microsoft.com/en-us/library/windows/desktop/...](https://msdn.microsoft.com/en-us/library/windows/desktop/bb775943(v=vs.85).aspx){rel="nofollow noreferrer"})
So Red team needs to find a cross platform solution for Red, but they
have higher priority tasks.

*Comment by user310291:* \@endo64 ok thanks.

*Comment by endo64:* Should I put my comment as an answer? :) I thought
someone could provide a solution.
