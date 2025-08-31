# How to get values from the Red/System parts in a Red file

**Link:**
<https://stackoverflow.com/questions/26848718/how-to-get-values-from-the-red-system-parts-in-a-red-file>

**Asked:** 2014-11-10 16:46:25 UTC

------------------------------------------------------------------------

I am using the [Red
binding](http://red.esperconsultancy.nl/Red-C-library/tree?ci=trunk&expand){rel="nofollow"}
to read and write files, and the hard-coded-file-names version works
well. But I want to get file names from the command line dynamically. As
`Red` has no such utility right now. So I try to make it with
`Red/System`. I can get command line args now, but I don\'t know how to
pass it to the `Red` part. Like the example below, I need to pass
`source-file` and `target-file` to `read` and `write`:

    Red []

    #include %input-output.red

    #system-global [
        args: system/args-list
        args: args + 1
        source-file: args/item
        args: args + 1
        target-file: args/item

        print [source-file target-file ]

    ]

    data: read source-file
    probe data
    write target-file data

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by DocKimbel

Something like this should work, just convert your #system-global code
to a routine function:

    Red [
        File: "test-read.red"
    ]

    read-arg: routine [
        files [block!]
        /local
            str  [red-string!]
            args [str-array!]
    ][
        args: system/args-list
        args: args + 1

        str: string/load symbol/duplicate args/item  1 + length? args/item UTF-8
        block/rs-append files as red-value! str

        args: args + 1
        str: string/load symbol/duplicate args/item  1 + length? args/item UTF-8
        block/rs-append files as red-value! str
    ]

    probe read-arg []

Then once compiled, you should get this result:

    C:\Dev\Red>test-read fileA fileB
    ["fileA" "fileB"]

------------------------------------------------------------------------

### Answer (score: 1) --- by Peter W A Wood

Presuming that the arguments to the read and write functions are
string!, you will need to write a routine that will return a red-string!
of a Red/System c-string!.

The Red API is understandably not documented yet as Nenad is busy
working on getting to Red 1.0. This is a function which goes the other
way, string! to c-string! that might help show some light on what is
needed -
[https://github.com/PeterWAWood/Red-System-Libs/blob/master/UTF8/string-c-string.reds](https://github.com/PeterWAWood/Red-System-Libs/blob/master/UTF8/string-c-string.reds){rel="nofollow"}
.

There may be an easer way to use the Red api that somebody else can
suggest.

------------------------------------------------------------------------

## Comments on question
