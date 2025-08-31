# When do Red looping structures require interpretation

**Link:**
<https://stackoverflow.com/questions/36603785/when-do-red-looping-structures-require-interpretation>

**Asked:** 2016-04-13 15:59:58 UTC

------------------------------------------------------------------------

Under what circumstances does a looping construct require evaluation by
the interpreter in Red? Which looping constructs do not?

***Update (4/20/2015):***

Below is an small program I wrote to demo the language to some students.
Two of the functions \'list and \'find have foreach loops in them. But
the foreach loops will not run unless they are wrapped in a do block.
This scenario in particular is what prompted the original question,
since the body of the foreach loops are not indirectly specified.

**Model.red**

    Red [
        Title: "Model"
        Author: "Thomas Royko"
        Version: 0.0.1
    ]

    entry!: make object! [
        name: ""
        quantity: 0
        notes: ""
        display: does [
            print ["-- " name]
            print ["-- " quantity]
            print ["-- " notes newline]
        ]
    ]

    enter: func [
        entries value
        /local quantity notes
    ] [
        qt: load ask "Enter quantity: "
        nt: ask "Enter notes: "
        append entries make entry! copy [
            name: value
            quantity: qt
            notes: nt
        ]
        print ""
    ]

    find: func [
        entries value
        /local found entry
    ] [
        found: false
        do [
            foreach entry entries [
                if entry/name = value [
                    entry/display
                    found: true
                    break
                ]
            ]
        ]
        if not found [
            print ["** No entry with code" value newline]
        ]
    ]

    list: func [
        entries
    ] [
        do [
            foreach entry entries [
                entry/display
            ]
        ]
    ]

    finish: func [
        entries
    ] [
        save %inventory.db entries
        quit
    ]

**Console.red**

    Red [
        Title: "Console"
        Author: "Thomas Royko"
        Version: 0.0.1
    ]

    #include %Bindings.red
    #include %Model.red

    entries: either exists? %inventory.db [
        reduce load %inventory.db
    ] [
        copy []
    ]

    rule: [
        (value: "")
        1 [
            ["e" space copy value to end (enter entries value)] |
            ["f" space copy value to end (find entries value)] |
            ["l" to end (list entries)] |
            ["q" to end (finish entries)] |
            [(print ["** Code not recognized" newline])]
        ]
    ]

    forever [
        parse ask "Command: " rule
    ]

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by DocKimbel

It is not dependent on the looping construct, but on the way you specify
the looping body block and (when it applies), the conditional block. If
those blocks are not specified literally, but indirectly using words,
then it will be interpreted, as the compiler cannot then statically
determine them. For example:

    n: 3 until [print n n = 0]

is compilable, while:

    body: [print n n = 0]
    n: 3 until body

is not.

------------------------------------------------------------------------

## Comments on question
