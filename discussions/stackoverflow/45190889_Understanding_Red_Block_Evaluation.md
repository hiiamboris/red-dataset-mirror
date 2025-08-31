# Understanding Red Block Evaluation

**Link:**
<https://stackoverflow.com/questions/45190889/understanding-red-block-evaluation>

**Asked:** 2017-07-19 12:38:53 UTC

------------------------------------------------------------------------

Just starting with Red and am having a difficult time understanding how
to evaluate blocks. The following gives me a
`*** Script Error: panel has no value` error:

    Red [ 
        needs: 'view
    ]

    my-panel: [
        panel 300x300 [
            text "World"
        ]
    ]

    view [
        title "Hello"

        do my-panel
    ]

I can get it working if I inline the contents of the `my-panel` block,
but can\'t find a way to split code up and then include it inside the
view function\'s block. Could anyone give me a real quick pointer to
what is wrong with the above code?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by DocKimbel

Red language contains several DSLs, the one you are using above after
`view` call is
[VID](https://doc.red-lang.org/en/vid.html){rel="nofollow noreferrer"}.
The `do` word has different meanings in different contexts. In Red
regular language, it evaluates a block of Red Code, in VID, it\'s a
keyword, that allows to embed Red code into VID. So far so good, but you
are not passing a block of Red code to `do`, but a block of VID code.

I guess that you want to achieve is inserting the `my-panel` block
dynamically. That can be achieved using different means, the easiest
would be using `compose` function:

    Red [ 
        needs: 'view
    ]

    my-panel: [
        panel 300x300 [
            text "World"
        ]
    ]

    view compose [
        title "Hello"

        (my-panel)
    ]

We have several [chat
rooms](https://gitter.im/red/help){rel="nofollow noreferrer"} on Gitter
in case you need a more interactive help.

Cheers!

------------------------------------------------------------------------

## Comments on question
