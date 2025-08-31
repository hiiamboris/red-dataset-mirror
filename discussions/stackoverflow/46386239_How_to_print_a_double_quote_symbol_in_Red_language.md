# How to print a double quote symbol in Red language

**Link:**
<https://stackoverflow.com/questions/46386239/how-to-print-a-double-quote-symbol-in-red-language>

**Asked:** 2017-09-24 03:15:59 UTC

------------------------------------------------------------------------

How can I print a double quote symbol (\"). I tried different methods
mentioned on
[http://r.789695.n4.nabble.com/How-to-print-a-variable-with-in-double-quotes-td905186.html](http://r.789695.n4.nabble.com/How-to-print-a-variable-with-in-double-quotes-td905186.html){rel="nofollow noreferrer"}
but they do not work:

    print "\""
    print as.character(x)  ; x should come in quotes
    print dQuote(x)

How can this be done?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by HostileFork says dont trust SE

There are two string formats\... `{This is a string}` and
`"This is too"`. Escaping is done with a caret, `^`.

If you use the braces you worry less about escaping. You can use single
quotes, double quotes, and even braces if they are matched naturally.
`{This is {a valid} string}`.

So you can say `print {"}` or if you insist `print "^""`. The former is
usually preferable.

*Comment by rnso:* {string} is really convenient.

*Comment by Graham Chiu:* Angle brackets are also string delimiters.

------------------------------------------------------------------------

## Comments on question

*Comment by rgchris:* See [2.11.2 String
Format](http://www.rebol.com/docs/core23/rebolcore-16.html#section-2.11.2){rel="nofollow noreferrer"}
