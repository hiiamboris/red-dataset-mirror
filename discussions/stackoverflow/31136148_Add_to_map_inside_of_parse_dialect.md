# Add to map inside of parse dialect

**Link:**
<https://stackoverflow.com/questions/31136148/add-to-map-inside-of-parse-dialect>

**Asked:** 2015-06-30 10:44:47 UTC

------------------------------------------------------------------------

I want to create a `map` where a hash is associated to a url in order to
check if some url is or is not in the `map`. If it\'s not yet in the
`map`, add it (and the url) to it.

    parseContainer: func [cstr [string!]] [
        parse cstr [
            thru "<a href=" to {"}
            thru "http://" copy quarto_url to {"}
            (
                quarto_hash: checksum/method to-binary quarto_url 'md5
                old: find words-of checksums 'quarto_hash
                if not old [append checksums [quarto_hash quarto_url ]]
            )
        ]
    ]

But the words `quarto_hash` and `quarto_url` are not converted to their
values. This is maybe not the simplest approach for the problem, so
I\'ll wait for your input. One other question: is `map` able to address
insertion and search of elements quickly for thousands of elements, or
is there any other more appropriate type?

FYI, I\'m using `Rebol3`, but included the `Red` tag as well because
I\'ll also be using `Red` in a short future. What is the best approach
for this?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by sqlab

You need to reduce the words **quarto_hash** and **quarto_url**

    if not old [append checksums reduce [quarto_hash quarto_url ]]

There is also no need to extract the words of the map, you should be
faster with a select direct on the map

I would use

    if not select checksums quarto_hash [
        append checksums reduce [quarto_hash quarto_url ]
    ]

------------------------------------------------------------------------

### Answer (score: 2) --- by draegtun

You need to do one of the following:

    if not old [repend checksums [quarto_hash quarto_url]]

or

    if not old [append checksums reduce [quarto_hash quarto_url]]

You will now find that `quarto_hash` and `quarto_url` are evaluated
before adding into the `checksums` (hash)map.

With regards to `map` insertion/searching you will find examples below
easier/faster:

    >> checksums: map []
    == make map! [
    ]

    >> quarto-url: "www.draegtun.com"
    == "www.draegtun.com"

    >> quarto-hash: checksum/method to-binary quarto-url 'md5
    == #{D9F71DD455C3E84E7C5C8F2C23FDF174}

    >> checksums/:quarto-hash
    == none

    >> ;;  returns NONE if key not present in map

    >> checksums/:quarto-hash: quarto-url    
    == "www.draegtun.com"

    >> checksums
    == make map! [
        #{D9F71DD455C3E84E7C5C8F2C23FDF174} "www.draegtun.com"
    ]

*Comment by Luis:* Interesting syntax of
`checksums/:quarto-hash: quarto-url` but doesn\'t work in my 3.0.0.4.40
Rebol 3 interpreter.

*Comment by draegtun:* Hi \@Luis, The above examples use the
[path!](http://www.rebol.com/r3/docs/datatypes/path.html){rel="nofollow noreferrer"}
syntax and this usage was designed specifically for Rebol 3 (they were
entered verbatim into Rebol console here and copy/pasted into answer).
What errors did you get?

*Comment by Luis:* Sorry, tried again in a new console and it worked :-)
Thank you very much for your explanation!

------------------------------------------------------------------------

## Comments on question
