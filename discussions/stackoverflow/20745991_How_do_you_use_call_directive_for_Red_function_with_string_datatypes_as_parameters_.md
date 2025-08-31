# How do you use #call directive for Red function with string datatypes as parameters?

**Link:**
<https://stackoverflow.com/questions/20745991/how-do-you-use-call-directive-for-red-function-with-string-datatypes-as-paramet>

**Asked:** 2013-12-23 14:58:21 UTC

------------------------------------------------------------------------

Given a script, such as below, which does not compile yet, how can I use
`#call` to use my Red function from within Red/System?

    Red []

    pff: function [a [string!] ][print a]  

    #system [
        #call [pff "hello"]    
    ]

There is a type mismatch. What do you need to do to convert the string
to the proper Red/System datatype?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by Peter W A Wood

You need to make calls to the Red runtime API to perform the
transformation. The Red runtime API isn\'t documented yet so you either
have to read the code or ask one of the few people who are familiar with
it. (I did a little of both).

I wrote a function to convert a Red string! to a UTF-8 encoded
Red/System c-string!, it\'s on
[github](https://github.com/PeterWAWood/Red-System-Libs/blob/master/UTF8/string-c-string.reds){rel="nofollow"}.

------------------------------------------------------------------------

### Answer (score: 1) --- by DocKimbel

To expand on Peter\'s correct answer, in this particular case, you need
to *internalize* the c-string as a red-string!, using `string/load`,
like this:

    Red []

    pff: function [a [string!] ][print a]  

    #system [
        s: "hello"
        hello: string/load s 1 + length? s UTF-8
        #call [pff hello]
    ]

Notes:

-   Red/System\'s strings are ASCII only for now, so you need to specify
    UTF-8 as the source encoding format.

-   You need to pass the size of the c-string accounting for the
    terminal NUL (hence the `+ 1`).

The internal API is not documented as it is not finalized. Feel free to
ask here or on our other communication channels if you need any info
about it.

------------------------------------------------------------------------

## Comments on question
