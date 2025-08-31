# Is there a way to make a function like ask but which accepts multiple lines in Red console?

**Link:**
<https://stackoverflow.com/questions/47108752/is-there-a-way-to-make-a-function-like-ask-but-which-accepts-multiple-lines-in-r>

**Asked:** 2017-11-04 08:06:42 UTC

------------------------------------------------------------------------

When using

ask \"your answer: \"

You cannot paste multiple lines.

Is it possible to control the console to accept multiple lines
temporarily ? Or am I obliged to create a GUI which I\'d like to avoid,
I don\'t want any GUI if possible.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

If you do not want to write your own Red/System routine, a crude
solution could be

    ask-2line: function [quest] [
        collect/into [ 
            keep ask  quest
            keep newline
            keep ask "[  "
        ] clear ""
    ]

    >> ask-2line "what: "
    what: 1st line
    [  second line
    == "1st line^/second line"

Of course you have to define how to terminate the input. e.g

    ask-nlines: function [quest] [
        collect/into [ 
            while [
                not empty? keep  ask  quest
            ] [
                keep newline
                quest: "{  "
            ]
        ] clear ""
    ]

*Comment by user310291:* a function argument can accept multiple lines,
would be great if ask behaved the same.

------------------------------------------------------------------------

## Comments on question
