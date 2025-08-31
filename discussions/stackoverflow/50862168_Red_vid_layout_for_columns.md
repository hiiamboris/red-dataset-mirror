# Red vid layout for columns

**Link:**
<https://stackoverflow.com/questions/50862168/red-vid-layout-for-columns>

**Asked:** 2018-06-14 16:34:20 UTC

------------------------------------------------------------------------

How to align columns nicely:

Things OK for :

        view layout [

            title "How to align ?"

            panel [
                text "" text "col1" text "col2"
            ]

            return

            panel [
                text "very short" field "" field ""
            ]
            return
            panel [
                text "short" field "" field ""
            ]

        ]

[![enter image description
here](https://i.sstatic.net/zsOjh.png)](https://i.sstatic.net/zsOjh.png){rel="nofollow noreferrer"}

Things gets wrong with:

        view layout [

            title "How to align ?"

            panel [
                text "" text "col1" text "col2"
            ]

            return

            panel [
                text "very short" field "" field ""
            ]
            return
            panel [
                text "short" field "" field ""
            ]
            return
            panel [
                text "but if very very long" field "" field ""
            ]

        ]

[![enter image description
here](https://i.sstatic.net/uqY8K.png)](https://i.sstatic.net/uqY8K.png){rel="nofollow noreferrer"}

Subsequent question: how to narrow space between rows ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by Alexander Ryan Baggett

You need to do your panels as columns instead of rows, then you give
them specific widths that will serve your needs.

    view layout  [

        title "How to align ?"

        panel 120x300 [
            text "" return
            text "very short" return
            text "short" return
            text "but if very very long" return

        ]

        panel 120x300 [
            text "col1" return 
            field return
            field return
            field return
        ]

        panel 120x300 [
            text "col2" return 
            field return
            field return
            field return
        ]
    ]

[![enter image description
here](https://i.sstatic.net/oCxhl.png)](https://i.sstatic.net/oCxhl.png){rel="nofollow noreferrer"}

------------------------------------------------------------------------

## Comments on question
