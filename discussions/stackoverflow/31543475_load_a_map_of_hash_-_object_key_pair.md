# load a map of hash - object key pair

**Link:**
<https://stackoverflow.com/questions/31543475/load-a-map-of-hash-object-key-pair>

**Asked:** 2015-07-21 15:32:02 UTC

------------------------------------------------------------------------

Please consider this example where I save a `map!` to a file and want to
load it back and access its keys and values. Its keys are hashes
(INTEGER!, calculated by `checksum`) and its values are blocks:

    Rebol []

    bl1: make object! [
            name: "first"
            age: 42
    ]

    bl2: make bl1 []

    bl2/name: "second"
    bl2/age: 30

    hash1: checksum to-binary to-string bl1
    hash2: checksum to-binary to-string bl2

    m1: make map! []
    repend m1 [hash1 bl1]
    repend m1 [hash2 bl2]

    save %./map_example.ls m1

    m2: do load %./map_example.ls
    probe join "m2: " type? m2

It returns `"m2: map!"`

The file **%map_example.ls** consists of:

    make map! [
        2749161 make object! [
            name: "first"
            age: 42
        ]
        4111405 make object! [
            name: "second"
            age: 30
        ]
    ]

How can I read the `map!` back to access its keys and values that are
objects?

Is `foreach` a way to go?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by rebolek

`SAVE` uses an imperfect but more readable format. Use `SAVE/ALL` to
preserve all values exactly as they should be (`SAVE/ALL` uses so call
serialization format in form of `#[datatype! value]`).

Also, just use `LOAD` and not `DO LOAD` to get the data back. `DO` is
not required in this case - `LOAD` converts the string to Rebol values
and as it\'s just data, not a script, there\'s no need to `DO` it (you
can, but it just returns itself).

------------------------------------------------------------------------

## Comments on question
