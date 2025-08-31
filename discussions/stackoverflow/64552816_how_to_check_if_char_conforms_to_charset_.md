# how to check if char conforms to charset?

**Link:**
<https://stackoverflow.com/questions/64552816/how-to-check-if-char-conforms-to-charset>

**Asked:** 2020-10-27 10:49:18 UTC

------------------------------------------------------------------------

tl;dr can\'t get parse to work with single letter

I\'m currently learning Red, so I may be missing basic things, but in
general I want to check if a password contains uppercase characters;
this was my first attempt (I know it\'s logically invalid):

    num-uppercase: (length? (difference/case password (lowercase password))) / 2

The idea was to convert to a lowercase string and then compare each, but
`difference` seems to convert a string to a set(?).

Now I moved on from that to looping over each letter like so:

    is-uppercase: false
    foreach letter password [
        if letter <> lowercase letter [
            is-uppercase: true
            break
        ]
    ]

But then I wanted to check if a single `char!` `letter` is a special
character:

    foreach letter password [
        if parse letter special [
            is-special: true
        ]
    ]

But I get an error:

    *** Script Error: parse does not allow char! for its input argument
    *** Where: parse
    *** Stack:  

I\'ve been looking for something to be able to check if a char conforms
to a charset, but wasn\'t able.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by 9214

Parse works with almost any kind of series: that is, with a collection
of items put in a succession. `string!` is such a series, but `char!` is
not.

    >> series? #"."
    == false
    >> scalar? #"."
    == true

To check if your password contains uppercase characters, you first need
to create a `bitset!` that represents such characters:

    >> upper: charset [#"A" - #"Z"]
    == make bitset! #{00000000000000007FFFFFE0}

After that, you can use it to construct a Parse *rule* and check the
conformity of input; for example, is password all uppercased? Some
inputs will match, some will not.

    >> parse "YES" [some upper]
    == true
    >> parse "no" [some upper]
    == false

Is it written in sentence-case? Different grammars you\'ll come up with
can yield the same result.

    >> parse "Sentence" [upper to end]
    == true
    >> parse "Sentence" [upper any [not upper skip]]
    == true

Finally, if you want to check if there\'s at least one uppercase letter,
something like this should do:

    >> parse "aBc" [to upper to end]
    == true
    >> parse "abc" [to upper to end]
    == false

If you are looking for password with only one single uppercased letter
and no more, then:

    >> parse "aBc" [thru upper any [not upper skip]]
    == true
    >> parse "aBC" [thru upper any [not upper skip]]
    == false

To answer the original question directly: if you have a `charset!` and a
`char!`, then you can check if the latter belongs to the former with:

    >> pick upper #"a"
    == false
    >> pick upper #"A"
    == true
    >> pick upper [#"A" #"b"]
    == false
    >> pick upper [#"A" #"B"]
    == true
    >> pick upper "Ab"
    == false
    >> pick upper "AB"
    == true

------------------------------------------------------------------------

I strongly recommend getting your bearings with Red prior to tackling
Parse (which FYI has an official
[documentation](https://github.com/red/red/wiki/%5BLINKS%5D-Learning-resources){rel="nofollow noreferrer"}).
The best way to do that is by joining [Gitter
chat](https://gitter.im/red/help){rel="nofollow noreferrer"} to get
promptly help with your questions and code, and by studying
community-provided [learning
resources](https://github.com/red/red/wiki/%5BLINKS%5D-Learning-resources){rel="nofollow noreferrer"};
[Rebol/Core User
Guide](http://www.rebol.com/docs/core23/rebolcore.html){rel="nofollow noreferrer"}
is a good starting point.

*Comment by Jakub Koralewski:* `pick` is very nice, although for
checking whether somehting is uppercase I still would prefer to use the
`uppercase` function in case the string has diacritics and other
non-standard characters. Thanks!

------------------------------------------------------------------------

### Answer (score: 1) --- by Maciej Łoziński

Another solution in Red would be to convert `char!` to `integer!` and
use [path
notation](https://github.com/red/docs/blob/master/en/datatypes/bitset.adoc#5-path-notation){rel="nofollow noreferrer"}:

    >> special: charset ".:?"
    == make bitset! #{0000000000020021}
    >> special/(to integer! #"a")
    == false
    >> special/(to integer! #".")
    == true

*Comment by 9214:* That doesn\'t look very idiomatic.
`pick special character` does the same and does not require any
conversions.

*Comment by 9214:* Moreso, conversion to `integer!` is not required in
such case, try e.g. `special/(#".")`.

------------------------------------------------------------------------

### Answer (score: 0) --- by Jakub Koralewski

I can use `to-string` to convert the char to a string. It\'s one way to
do it.

    parse to-string #"." [special]

------------------------------------------------------------------------

### Answer (score: 0) --- by sqlab

Without parse, but according to what you want to get with your first
attempt

    >> strict-equal? lowercase copy pass: "ABcc"  pass
    == false
    >> strict-equal? lowercase copy pass: "abcc"  pass
    == true

You need *copy* because it alters the original, *strict-equal?* because
plain *equal?* does not distinguish between uppercase and lowercase.

*difference* shows the diiferent items of two sets. see *help
difference*. A solution with difference you can get with

    >> same: empty? difference/case pass: "ABcc" lowercase copy pass
    == false
    >> same:  empty? difference/case pass: "aabc" lowercase copy pass
    == true

------------------------------------------------------------------------

### Answer (score: 0) --- by Dave Andersen

For individual characters, `find` can also be used with a charset.

    >> upper: charset [#"A" - #"Z"]
    == make bitset! #{00000000000000007FFFFFE0}
    >> find upper #"x"
    == none
    >> find upper #"X"
    == true

------------------------------------------------------------------------

## Comments on question
