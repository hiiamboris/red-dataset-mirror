# How to link other scripts when compiling main program in Red language

**Link:**
<https://stackoverflow.com/questions/67144325/how-to-link-other-scripts-when-compiling-main-program-in-red-language>

**Asked:** 2021-04-18 00:58:21 UTC

------------------------------------------------------------------------

I put some functions\' defination in a file named \"funcs.red\",
functions in which would be invoked by main program. Here is the example
of \"funcs.red\":

    Red []
    myadd: func [x y] [x + y]

The content of main program(\"main.red\") is:

    Red [needs: view]
    do %funcs.red
    view [t: text "result" button "myadd" [t/text: to-string myadd 1 2]]

Both \"main.red\" and \"funcs.red\" are in the same path. In red
console, the \"main.red\" works right as expected by
`do %funcs.red do %main.red`. Then I tried to compile \"main.red\":
`red -r -t windows main.red` but it failed and an error message was
given:

`Compilation Error: undefined word myadd...`

So, in Red, how to link the main script with another script when
compiling?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by Dave Andersen

To reference other red sources at compile-time, you should use
`#include`. When you use `do`, it looks for that file, reads and
interprets it at run-time.

    #include %funcs.red

You can still use `#include` when interpreting a script too. The
interpreter will treat it the same as `do` in that case.

*Comment by lyl:* I tried `? #include` in red console, but get nothing.
Where to find out more details about `#include`?

*Comment by 9214:* \@lyl it\'s a [preprocessor
directive](https://github.com/red/docs/blob/master/en/preprocessor.adoc){rel="nofollow noreferrer"}.
`#include` pasted verbatim in the console is treated as an `issue!`
value, so calling `?` on it makes little sense.

*Comment by lyl:* Thank you all very much!

------------------------------------------------------------------------

## Comments on question
