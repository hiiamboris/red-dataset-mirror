# Change file paths

**Link:**
<https://stackoverflow.com/questions/44051866/change-file-paths>

**Asked:** 2017-05-18 15:23:37 UTC

------------------------------------------------------------------------

I want to change `[%a/b]` to `[%a/c]`. Basically, the same as [Change
path or
refinement](https://stackoverflow.com/questions/42696779/change-path-or-refinement),
but with `file!` instead:

> I want to change the `a/b` inside a block to `a/c`

    test: [a/b]

In this case, either `change next test/1 'c` or `test/1/2: 'c` works.
But not when `test` is a `file!`:

    >> test: [%a/b]
    == [%a/b]
    >> test/1
    == %a/b
    >> test/1/2         ; can't access 2nd value
    == %a/b/2
    >> next first test  ; not quite what you expect
    == %/b

Trying to `change` it gives not something you\'d expect:

    >> change next test/1 'c
    == %b
    >> test
    == [%acb]

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by DocKimbel

You are confusing `path!` and `file!` series, they can look similar, but
their nature are very different.

A `path!` is a collection of values (often `word!` values) separated by
a slash symbol, a `file!` is a collection of `char!` values. Slash
characters in `file!` series are just characters, so `file!` has no
knowledge about any sub-structures. It has (mostly) the semantics of
`string!` series, while `path!` has the semantics of a `block!` series.

Now that this is cleared, about the `test/1/2` result, **path notation
on a `file!` series has a different behavior than on `string!`**, it
will do a smart *concatenation* instead of acting as an accessor. It\'s
called *smart* because it will nicely handle extra slash characters
present in left and right parts. For example:

    >> file: %/index.html
    == %/index.html

    >> path: %www/
    == %www/

    >> path/file
    == %www/file

    >> path/:file
    == %www/index.html

Same path notation rule applies to `url!` series too:

    >> url: http://red-lang.org
    == http://red-lang.org

    >> url/index.html
    == http://red-lang.org/index.html

    >> file: %/index.html
    == %/index.html

    >> url/:file
    == http://red-lang.org/index.html

So for changing the nested content of `test: [%a/b]`, as `file!` behaves
basically as `string!`, you can use any available method for strings to
modify it. For example:

    >> test: [%a/b]
    == [%a/b]

    >> change skip test/1 2 %c
    == %""

    >> test
    == [%a/c]

    >> change next find test/1 slash "d"
    == %""

    >> test
    == [%a/d]

    >> parse test/1 [thru slash change skip "e"]
    == true

    >> test
    == [%a/e]

*Comment by Geeky I:* `parse test/1 [thru slash change to end "e"]` was
what I needed. Thanks

------------------------------------------------------------------------

### Answer (score: 3) --- by rgchris

Files are string types and can be manipulated in the same way you\'d
modify a string. For example:

    test: [%a/b]
    replace test/1 %/b %/c

------------------------------------------------------------------------

### Answer (score: 3) --- by Shixin Zeng

This is because file! is an any-string!, not any-array!

    >> any-string? %a/c
    == true
    >> any-array? 'a/c
    == true

So the directory separator \'/\' in a file! doesn\'t mean anything
special with the action CHANGE. So \'a\', \'/\', and \'b\' in %a/b are
treated the same way, and the interpreter isn\'t trying to parse it into
a two segment file path \[a b\].

While for a path!, because it\'s an array, each component is a rebol
value, and the interpreter knows that. For instance, \'bcd\' in a/bcd
will be seen as a whole (a word!), instead of three characters \'b\',
\'c\' and \'d\'.

I agree that the file! being an any-string! is not convenient.

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

Here is a maybe cumbersome solution, but suitable for directories
treating them as files

    test/1:  to-file head change skip split-path test/1 1 %c

------------------------------------------------------------------------

## Comments on question
