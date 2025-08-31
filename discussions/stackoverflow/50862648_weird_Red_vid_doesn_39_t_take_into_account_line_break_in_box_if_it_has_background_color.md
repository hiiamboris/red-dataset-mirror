# weird: Red vid doesn&#39;t take into account line break in box if it has background color

**Link:**
<https://stackoverflow.com/questions/50862648/weird-red-vid-doesnt-take-into-account-line-break-in-box-if-it-has-background>

**Asked:** 2018-06-14 17:06:27 UTC

------------------------------------------------------------------------

1°) align: \'left doesn\'t work (is my syntax right ?)

2°) \^/ sometimes not taken into account:

        view layout [
            box 400x400
            font [align: 'left size: 40 color: red] "line1^/line2"
        ]

[![enter image description
here](https://i.sstatic.net/HsuFv.png)](https://i.sstatic.net/HsuFv.png){rel="nofollow noreferrer"}

but if I just add white to box:

        view layout [
            box white 400x400
            font [align: 'left size: 40 color: red] "line1^/line2"
        ]

[![enter image description
here](https://i.sstatic.net/vFXSt.png)](https://i.sstatic.net/vFXSt.png){rel="nofollow noreferrer"}

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 0) --- by DocKimbel

StackOverflow is not the place where bugs or issues for Red language
should be reported. We have specific channels for that. Please report
the issue on Red\'s [issue
tracker](https://github.com/red/red/issues){rel="nofollow noreferrer"}.

------------------------------------------------------------------------

## Comments on question

*Comment by Alexander Ryan Baggett:* This seems like a bug that should
be filed in the red github. Also, try reaching out to people in one of
the red language gitter channels.
