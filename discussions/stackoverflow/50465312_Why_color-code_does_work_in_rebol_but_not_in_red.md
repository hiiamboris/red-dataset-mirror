# Why color-code does work in rebol but not in red

**Link:**
<https://stackoverflow.com/questions/50465312/why-color-code-does-work-in-rebol-but-not-in-red>

**Asked:** 2018-05-22 10:22:22 UTC

------------------------------------------------------------------------

I have replace parse/all by parse in
[http://www.rebol.org/view-script.r?script=color-code.r](http://www.rebol.org/view-script.r?script=color-code.r){rel="nofollow noreferrer"}

as for the rest I can see why it doesn\'t work

> **\* Syntax Error: invalid char! at {#\"\^\^(1)\" - #\" \"\] parse
> text blk} \*** Where: do \*\*\* Stack: run load

    color-coder: make object! [

        ; Set the color you want for each datatype:
        colors: [
             char!          0.120.40
             date!          0.120.150
             decimal!       0.120.150
             email!         0.120.40
             file!          0.120.40
             integer!       0.120.150
             issue!         0.120.40
             money!         0.120.150
             pair!          0.120.150
             string!        0.120.40
             tag!           0.120.40
             time!          0.120.150
             tuple!         0.120.150
             url!           0.120.40
             refinement!    160.120.40
             cmt            10.10.160
        ]

        out: none

        emit: func [data] [repend out data]

        to-color: func [tuple][
            result: copy "#"
            repeat n 3 [append result back back tail to-hex pick tuple n]
            result
        ]

        emit-color: func [value start stop /local color][
            either none? :value [color: select colors 'cmt][
                if path? :value [value: first :value]
                color: either word? :value [
                    any [
                        all [value? :value any-function? get :value 140.0.0]
                        all [value? :value datatype? get :value 120.60.100]
                    ]
                ][
                    any [select colors type?/word :value]
                ]
            ]
            either color [ ; (Done this way so script can color itself.)
                emit ["-[" {-font color="} to-color color {"-} "]-"
                    copy/part start stop "-[" "-/font-" "]-"]
            ][
                emit copy/part start stop
            ]
        ]

        set 'color-code func [
            "Return color source code as HTML."
            text [string!] "Source code text"
            /local str new value
        ][
            out: make string! 3 * length? text

            set [value text] load/next/header detab text
            emit copy/part head text text
            spc: charset [#"^(1)" - #" "] ; treat like space

            parse text blk-rule: [
                some [
                    str:
                    some spc new: (emit copy/part str new) |
                    newline (emit newline)|
                    #";" [thru newline | to end] new: 
                        (emit-color none str new) |
                    [#"[" | #"("] (emit first str) blk-rule |
                    [#"]" | #")"] (emit first str) break |
                    skip (
                        set [value new] load/next str
                        emit-color :value str new
                    ) :new
                ]
            ]

            foreach [from to] reduce [ ; (join avoids the pattern)
                "&" "&" "<" "<" ">" ">"
                join "-[" "-" "<" join "-" "]-" ">"
            ][
                replace/all out from to
            ]

            insert out {<html><body bgcolor="#ffffff"><pre>}
            append out {</pre></body></html>}
        ]
    ]

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by DocKimbel

As the error message says, the `#"^(1)"` syntax is not correct in Red.
The
[char!](https://doc.red-lang.org/en/char.html#_literal_syntax){rel="nofollow noreferrer"}
documentation indicates that it needs to be a valid hexadecimal number,
which requires 2, 4 or 6 characters. So, if you just replace that
invalid value by `#"^(01)"`, it will load fine in Red.

------------------------------------------------------------------------

## Comments on question

*Comment by rgchris:* See also: [Color Code for
Red](https://github.com/rgchris/Scripts/blob/master/red/color-code.red){rel="nofollow noreferrer"}
