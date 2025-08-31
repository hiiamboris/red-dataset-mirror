# Is it possible to generate function dynamically in rebol or red

**Link:**
<https://stackoverflow.com/questions/46989426/is-it-possible-to-generate-function-dynamically-in-rebol-or-red>

**Asked:** 2017-10-28 11:53:37 UTC

------------------------------------------------------------------------

Instead of hard coding (contrived example here):

        f1: func[][print "f1"]
        f100: func[][print "f100"]
        etc...

Is it possible to do something like this

        for num 1 100 1 [ 
          set to-word rejoin ["f" num] func[][
            print rejoin ["f" num]
          ]
        ]

except it doesn\'t work, it always give \"f100\" (why in fact num is
equal to 100 is a mystery for me though it\'s not the question here:
closure ?).

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by sqlab

    for num 1 100 1 [ 
      set to-word rejoin ["f" num] func[] compose/deep [
        print rejoin  ["f"  (num)]
      ]
    ]

    >> f1
    f1
    >> f2
    f2
    >> f99
    f99

The result of your functions is always f100, because they all share the
same word **num** with the outcome of your for loop. You can see that if
you do e.g.`source f1`.

------------------------------------------------------------------------

## Comments on question

*Comment by DocKimbel:* See also the related Rosetta Code entry:
[rosettacode.org/wiki/Closures/Value_capture#Red](https://rosettacode.org/wiki/Closures/Value_capture#Red){rel="nofollow noreferrer"}
