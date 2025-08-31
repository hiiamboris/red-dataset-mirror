# Protecting object attributes in Rebol

**Link:**
<https://stackoverflow.com/questions/17432024/protecting-object-attributes-in-rebol>

**Asked:** 2013-07-02 17:29:47 UTC

------------------------------------------------------------------------

I\'m trying something quite basic in Rebol. I want to have a simple
instance hierarchy - a `question` base instance and some `question`
sub-instances. And I want to have some instance attributes protected.

What I\'m doing now is:

    _question: make object! [
        id: none
        type: none
        text: none ]

        question-text: make _question [
            type: 'text

        new: func [
            id' [integer!]
            text' [string!]
        ] [
            make self [
                id: id'
                text: text'

                protect [ id type text ]
            ]
        ]
    ]

But then this fails:

    qt1: question-text/new 1 "q-text1"
    qt2: question-text/new 2 "q-text2"

Once I make the second instance qt2, I get:

> Script Error: Word id is protected, cannot modify

Next idea is then to move the protected fields out of `_question` and
put them into `question_text` - even if I wouldn\'t like that. But that
just leads to the same error.

*Note: I\'m currently doing this with Rebol2, but would ideally also get
my things running in Rebol3 and in Red. And I would like to avoid hacks
(sure - that\'s vague, things like Python `getitem()/setitem()` tricks
would be fine). Then I\'d prefer to have the fields unprotected.*

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 0) --- by rgchris

There are some binding considerations here. This works, but is subject
to the quirky nature of Rebol 2\'s `'protect` function and contexts:

    new: func [
        id' [integer!]
        text' [string!]
        /local object
    ][
        object: make self []
        object/id: id'
        object/text: text'
        protect bind [ id type text ] 'object
        object
    ]

*Comment by rgchris:* Note that this doesn\'t *protect* you from
`new-question/id: 12` notation, just `do bind [id: 12] new-question`.

*Comment by Frank Ruben:* Thanks! Works as advertised and is just below
the hack-threshold ;)

------------------------------------------------------------------------

## Comments on question
