# Remove special characters from string in Red language

**Link:**
<https://stackoverflow.com/questions/46328905/remove-special-characters-from-string-in-red-language>

**Asked:** 2017-09-20 18:03:00 UTC

------------------------------------------------------------------------

I want to remove all characters in a string except:

-   `-` or `_` or `.`
-   `A` thru `Z`
-   `a` thru `z`
-   `0` to `9`
-   space

On linux command line, using `sed` I would do this:

    $ echo "testing-#$% yes.no" | sed 's/[^-_.a-zA-Z0-9 ]//g'

Output:

    testing- yes.no

How can I achieve the same effect in Red language with PARSE? I looked
at:

-   [http://www.rebol.com/docs/core23/rebolcore-15.html#section-1](http://www.rebol.com/docs/core23/rebolcore-15.html#section-1){rel="nofollow noreferrer"}
-   [http://rebol-land.blogspot.in/2013/03/rebols-answer-to-regex-parse-and-rebol.html](http://rebol-land.blogspot.in/2013/03/rebols-answer-to-regex-parse-and-rebol.html){rel="nofollow noreferrer"}
-   [http://ross-gill.com/page/Beyond_Regular_Expressions](http://ross-gill.com/page/Beyond_Regular_Expressions){rel="nofollow noreferrer"}

However, I could not codify it. I tried:

    >> parse "mystring%^&" [#a - #z #A - #Z #0 - #9]
    == false
    >> parse "mystring%^&" [#a-#z#A-#Z#0-#9]        
    == false

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 6) --- by rgchris

First note the difference between ISSUE! and CHAR!

    #a #b #c  ; issues
    #"a" #"b" #"c"   ; chars

You can then establish a character set (BITSET! type) either for the
characters you want to keep or those you wish to discard. We\'ll do the
former here:

    good-chars: charset [#"a" - #"z" #"A" - #"Z" #"0" - #"9"]

Now that we have that, we can approach this in some different ways:

# Parse

A fairly basic parse loop---skips any `good-chars` and removes anything
else.

    parse "mystring%^&" [any [some good-chars | remove skip]]

# Remove-Each

Hopefully self-explanatory:

    remove-each char "mystring%^&" [not find good-chars char]

*Comment by rnso:* On Red command line, your first answer (parse\...)
`produces ==true` as output. The second answer (remove-each\...)
produces no output. Why is this happening?

*Comment by rgchris:* \@rnso Parse returns **true** if the rule matches.
In Red, you can wrap the rule thus:
`take parse "mystring%^&" [collect [keep any [some good-chars | remove skip]]]`
but that copies the string. Apparently **remove-each** returns the
product of the last iteration---in Rebol 2 it would return the modified
series. Note that both my answers as-is modify the existing string, they
do not create new strings.

*Comment by rgchris:* \@rnso If your string is set to a word, you can
use ALSO: **also mystring parse mystring \[any \[\...\]\]** or: **also
mystring remove-each char mystring \[\...\]**

*Comment by rnso:* Good information. You may add these comments to your
answer above since many readers just read answers and not comments.

*Comment by rgchris:* \@rnso It\'s implied in that I answered your
question as asked. Your chosen answer actually creates several new
strings in the process.

------------------------------------------------------------------------

### Answer (score: 4) --- by rebolek

First, characters must be in quotes, `#a` is `issue!`, `char!` is
`#"a"`. You\'ve got the specification right, but you must pass it to
`charset` function, to make a `bitset!` form it.

Then you can `parse` your string, `keep`ing valid characters and
`skip`ing invalid:

    >> chars: charset [#"a" - #"z" #"A" - #"Z" #"0" - #"9"]
    == make bitset! #{000000000000FFC07FFFFFE07FFFFFE0}
    >> rejoin parse "mystring%^&asdf" [collect some [keep chars | skip]]
    == "mystringasdf"

------------------------------------------------------------------------

### Answer (score: 2) --- by draegtun

An alternative solution to `PARSE` would be to use
[`REPLACE`](http://www.rebol.com/r3/docs/functions/replace.html){rel="nofollow noreferrer"}
here with a
[`COMPLEMENT`](http://www.rebol.com/r3/docs/functions/complement.html){rel="nofollow noreferrer"}
[`CHARSET`](http://www.rebol.com/r3/docs/functions/charset.html){rel="nofollow noreferrer"}:

``` {.lang-lisp .prettyprint-override}
replace/all "mystring%^&" complement charset [{-_. } #"a" - #"z" #"0" - #"9"] {}
```

NB. Above works in Rebol (2 & 3). Unfortunately it currently hangs in
Red (tested on 0.63 on MacOS).

------------------------------------------------------------------------

## Comments on question

*Comment by endo64:* Remember to use `trim` if you want to remove some
chars. `trim/with "testing-#$% yes.no" "-#$%." == "testing yesno"`
