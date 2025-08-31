# Rebo/Red parse: Is it possible to copy between two marks embedding nested div

**Link:**
<https://stackoverflow.com/questions/50088909/rebo-red-parse-is-it-possible-to-copy-between-two-marks-embedding-nested-div>

**Asked:** 2018-04-29 16:32:51 UTC

------------------------------------------------------------------------

Subsequent to [Rebol/Red parse: how to copy between 2
marks](https://stackoverflow.com/questions/50087327/rebol-red-parse-how-to-copy-between-2-marks)
let\'s now suppose I achieve to mark a string with some marks with a
complex parse rule having nested div (whatever that rule), is there a
general way to copy between mark1 and mark2, at least is there a
specific way for this kind of nested div example:

        {
            <div>
            a ; <- mark1
                <div>
                    b
                </div>
                <div>
                c
                </div>
            d ; <- mark2
            </div> 

            <div>
            e
                <div>
                    f
                </div>
                <div>
                g
                </div>
            h
            </div>  
        }


        rule: [
            mark1:
            ...
            mark2:
            copy mark1 to mark2
        ]

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

This is no problem with the already shown solutions, but if you want to
make it a little bit more complicated you could go back to an already
defined / marked point in your src as in this example.

    src: {1234567890abcdefghijklmnopqrstuvxyz}
    >> parse src [ skip mark: to "a" mark2:  :mark   to "3" mark1: to end]  
    == true
    >> mark1
    == "34567890abcdefghijklmnopqrstuvxyz"

pay attention to *`:mark`* It set back the pointer to an prior defined
point.

So the answer to your former question would look like that

    rule: [
        to "b" mark1: thru "e" mark2: 
        :mark1 copy text to mark2
    ]

Here replace \"b\" and \"e\" according your your wished points, maybe
\"a\" and \"d\".

*Comment by user310291:* sorry my example not good what I wanted to get
is nth div block not a value especially.

*Comment by sqlab:* Then prefix the wanted number of occurences in front
of a sub rule or count the occurences as you did in one of your former
questions

*Comment by user310291:* what I tried to get is rather this
[stackoverflow.com/questions/50097970/red-parse-with-break](https://stackoverflow.com/questions/50097970/red-parse-with-break "red parse with break")

------------------------------------------------------------------------

## Comments on question

*Comment by HostileFork says dont trust SE:* Are you able to get the
`mark1` and `mark2` positions to hold the locations you\'ve specified?
If so, it\'s not clear how this would be any different from the previous
question. PARSE\'s COPY keyword does not work how you are trying to use
it. It means `copy <target-variable> <rule>`, not
`copy <starting-position> to <ending-position>`. There is no PARSE
keyword that does what you are asking, for two arbitrarily found
locations. PARSE\'s copy always starts copying from the current parse
position, where you are, and always ends after a rule match, if the rule
matches.

*Comment by user310291:* \@HostileFork ok thanks that\'s what I fear.
This makes parsing very difficult in some simple use case scenarios,
that\'s a pity.

*Comment by HostileFork says dont trust SE:* What is particularly
difficult about `(text: copy/part mark1 mark2)`? If you would like to
return it from the parse as the overall result, RETURN is a parse
keyword in Rebol3, so you can also say `return (copy/part mark1 mark2)`.

*Comment by user310291:* \@Hostilefork like this ?
[stackoverflow.com/questions/50097970/red-parse-with-break](https://stackoverflow.com/questions/50097970/red-parse-with-break "red parse with break")
