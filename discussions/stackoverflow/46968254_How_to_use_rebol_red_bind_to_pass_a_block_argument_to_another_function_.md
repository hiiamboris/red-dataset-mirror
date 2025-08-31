# How to use rebol/red bind to pass a block argument to another function?

**Link:**
<https://stackoverflow.com/questions/46968254/how-to-use-rebol-red-bind-to-pass-a-block-argument-to-another-function>

**Asked:** 2017-10-27 05:45:44 UTC

------------------------------------------------------------------------

I don\'t really understand if it can be done with bind or anything else,
the documentation
[http://www.rebol.com/docs/words/wbind.html](http://www.rebol.com/docs/words/wbind.html){rel="nofollow noreferrer"}
doesn\'t help as for me. I want to pass block argument from f2 to f1 :

      f1: func[block][
        foreach b block [
          print b
        ]
      ]

      f2: func[][
        a: 1
        b: 2
        block: [a b]
        f1 block
      ]

When calling

     f2

It prints out

     a
     b

How to make it print out

     1
     2

while passing \[a b\] (I don\'t want to pass \[1 2\] since it can change
all the time and that is not elegant) ? Is it possible with bind or
anything else ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

    f1: func[block /local i][
        foreach i block [
          print get i
        ]
    ]

or

    f1: func[block /local b][
        foreach b reduce block [
           print  b
        ]
    ]

There is a need for the local word in Red, as the foreach variable word
in Red is not local to the foreach loop.

*Comment by DocKimbel:* Use `function` constructor in Red and you won\'t
need to declare the local word.

------------------------------------------------------------------------

## Comments on question
