# How to use \`parse\` to get all lines with all search strings in Red language

**Link:**
<https://stackoverflow.com/questions/46410208/how-to-use-parse-to-get-all-lines-with-all-search-strings-in-red-language>

**Asked:** 2017-09-25 16:45:06 UTC

------------------------------------------------------------------------

I am trying to extract from a list of lines which have all of the
strings from a list of search strings. I am trying following code using
`and` keyword (as mentioned on
[http://rebol.com/r3/docs/concepts/parsing-summary.html](http://rebol.com/r3/docs/concepts/parsing-summary.html){rel="nofollow noreferrer"}
) to include only those lines that have all strings of srchstr block:

    lines: [ 
        "this is first (1st) line"
        "second line"
        "third line"
        "this is second sentence"
        "first line or sentence"
        "third sentence"    ]

    srchstr: ["line" "first"]

    probe parse lines [and reduce srchstr]
    probe parse lines [and srchstr]  

There is no error message but the output is only:

    false
    false

I also tried:

    foreach line lines 
        [parse line [and srchstr]
            (print line)]

But this prints all lines.

Desired output is:

        [ 
        "this is first (1st) line"
        "first line or sentence"
        ]

It will be obvious from these codes that I am very new to this, though I
have tried to read about it.

Where is the problem and how can I get the desired output?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by sqlab

This is no typical task for parse, but better solved with foreach ..
..\[all \[..\]\]

    >> foreach line lines [all [find line srchstr/1 find line srchstr/2 print line]]
    this is first (1st) line
    first line or sentence

a variant with the condition composed dynamically from multiple search
strings

    foreach line lines compose/only  [ 
        all   (
            collect [ 
                foreach str srchstr [
                    keep compose [find line (str)] 
                ] 
                keep [print line]
            ]  
        ) 
    ]

Ok, a crude parse solution with multiple strings in the search block

    >> rule:  [collect some into [   keep to end | to end ] ]
    == [collect some into [keep to end | to end]]
    >> foreach str srchstr [ insert  rule/4  compose [ahead to (str)] ] 
    == [ahead to "line" keep to end | to end]
    >> parse lines rule
    == ["this is first (1st) line" "first line or sentence"]

*Comment by rnso:* There may be more than 2 strings in srchstr block so
it has to be able to take variable number of entries in srchstr.

*Comment by rgchris:* Hm, could do as an extra long one-liner:
`parse lines compose/deep [collect some into [(collect [foreach str srchstr [keep [ahead to] keep str]]) keep to end | to end]]`.
Could probably use some explanation though\...

*Comment by rnso:* It will be useful if you could mention parse code if
just one string is to be tested for multiple search strings present in a
series (srchstr here).

------------------------------------------------------------------------

### Answer (score: 2) --- by rgchris

To match whole words, both versions will use a `parse` pre-pass to
extract said words:

    extract-words: func [series [string!]][
        letters: charset [#"0" - #"9" #"a" - #"z"]
        series: parse series [collect any [keep some letters | skip]]
    ]

## Using FIND

This creates a block of `find` results and confirms compliance with
`all`:

    contains-all: func [series [string!] words [block!] /local word][
        series: extract-words series

        all collect [
            foreach word words [
                keep find series word 
            ]
            keep true
        ]
    ]

Then you can loop through your strings to find matches:

    collect [
        foreach line [ 
            "this is first (1st) line"
            "second line"
            "third line"
            "this is second sentence"
            "first line or sentence"
            "third sentence"
        ][
            if contains-all line ["line" "first"][keep line]
        ]
    ]

## Using PARSE

This version creates a `parse` rule that will match against `sort`ed
words:

    contains-all: function [series [string!] words [block!]][
        parse sort extract-words series collect [
            foreach word sort copy words [
                keep 'thru
                keep word
            ]
            keep [to end]
        ]
    ]

*Comment by rnso:* I find that I can remove `to logic!` without any loss
of correct output. Is it really needed?

*Comment by rnso:* Also, this simple code gives error:
`foreach line lines if contains-all line srchstr [probe line]` . The
error is : \*\*\* Script Error: line has no value; \*\*\* Where:
contains-all; \*\*\* Stack: contains-all . Why is this not working?

*Comment by rgchris:* \@rnso Updated to reflect the \'whole words\'
stipulation. Should work now. `to logic!` gives you a `true` or `false`
result. Without it, you get either a string (successful `find`) or none
(unsuccessful).

*Comment by rnso:* I think `all` returns true if none of them is `none`,
else it returns false, hence it works without `to logic!` also.

*Comment by rgchris:* \@rnso Not so---try `all [find "foo" "f"]`. It
will still work, but the return value may be misleading.

*Comment by rnso:* I think you should also keep \'contains-all\' version
without extract-series that you had posted earlier. It was easy to
understand.

------------------------------------------------------------------------

## Comments on question

*Comment by rgchris:* Are you only looking for whole words or any
substring?

*Comment by rnso:* Only whole words (to keep it simple for the moment!).

*Comment by Geeky I:* `probe` is more useful in the middle. Also
`parse-trace`

*Comment by DocKimbel:* The `and` command in Red\'s Parse is called
`ahead`.

*Comment by rnso:* Is it `ahead` or \"`ahead to`\" (as used everywhere
on this page) ? Also `ahead` is not mentioned on
[rebol.com/r3/docs/concepts/parsing-summary.html](http://rebol.com/r3/docs/concepts/parsing-summary.html){rel="nofollow noreferrer"}
