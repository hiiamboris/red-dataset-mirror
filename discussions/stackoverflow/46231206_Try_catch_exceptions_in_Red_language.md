# Try/catch exceptions in Red language

**Link:**
<https://stackoverflow.com/questions/46231206/try-catch-exceptions-in-red-language>

**Asked:** 2017-09-15 03:23:49 UTC

------------------------------------------------------------------------

I have a small GUI application with a text-field and a button. The
button triggers a function which tries to read a number from text-field.
An exception is raised if the text-field is blank or has non-numeric
text.

I am trying to catch error if text-field does not have a value or has
text value rather than a valid number:

    calc: does [
        try [x: to integer! num_field/text]
        catch [ print "Could not get number"]
        print "Number read"
    ]

Following also does not work:

    calc: does [
        try [x: to integer! num_field/text]
        throw 123
        print "Number read"
    ]
    catch 123 [ print "Could not get number"]

I am not sure how to use try, throw and catch here. I tried to check
section 10 of
[http://static.red-lang.org/red-system-specs.html](http://static.red-lang.org/red-system-specs.html){rel="nofollow noreferrer"}
but could not really understand.

How can this be solved? Thanks for your help.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by rgchris

`TRY` will still pass an error if one is generated, however it isn\'t
triggered unless it\'s the last value evaluated.

You could use the following:

    calc: does [
        case [
            error? value: try [
                to integer! num_field/text
            ][
                ... do error handling ...
                probe make map! body-of :value
            ]

            integer? value [
                ... do successful thing ...
            ]
        ]
    ]

Aside from `TRY`, there is also `ATTEMPT` which will just return `NONE`
if an error occurs. Unlike `TRY`, you can\'t analyze the error object.

    attempt [to integer! "Foo"]

`CATCH` and `THROW` are more flow control functions in Rebol/Red than
error handlers, they break out of however many stack levels they cross:

    catch [
        repeat x 10 [
            probe x
            if x = 3 [throw x]
        ]
    ]

*Comment by rnso:* Can we use `if` instead of `case` if we do not need
successful part (`integer? value ...`)?

*Comment by rgchris:* \@rnso Yep. `case` is like a super-`if`.
`if error? foo: try [to integer! "Foo"][... your error handler here ...]`

------------------------------------------------------------------------

### Answer (score: 3) --- by DocKimbel

You can simply use `attempt` to catch eventual conversion errors and
test the resulting value:

    calc: does [
        either integer? x: attempt [to-integer num_field/text][
            print "Number read"
        ][
            print "Could not get number"
        ]
    ]

However, there is an even simpler option in this specific case:

    calc: does [
        either integer? x: num_field/data [
            print "Number read"
        ][
            print "Could not get number"
        ]
    ]

The `/data` facet contains a converted version of `/text` already, or
`none` if no conversion is possible, so you can just read/write that
facet for numerical values to be displayed in `text` or `field` faces.

> I tried to check section 10 of
> [http://static.red-lang.org/red-system-specs.html](http://static.red-lang.org/red-system-specs.html){rel="nofollow noreferrer"}
> but could not really understand.

That documentation is for Red/System, the system programming DSL
embedded in Red. The Red language documentation is at
[http://docs.red-lang.org](http://docs.red-lang.org){rel="nofollow noreferrer"}
(still under heavy work).

------------------------------------------------------------------------

## Comments on question
