# How can I pass around a function with args, in red?

**Link:**
<https://stackoverflow.com/questions/40123974/how-can-i-pass-around-a-function-with-args-in-red>

**Asked:** 2016-10-19 06:39:44 UTC

------------------------------------------------------------------------

How can I pass a function as an argument in red? Or would I not need
that in red?

Using `does` I can define a function \"with no arguments or local
variables\"

    f: does [print 1] do f
    >> 1

How can I make this work with (multiple) args? `does` is no the way,
what is?

I want something like: (the following does NOT work):

    ; does NOT work
    f: does-with-args [x][print x] do f 23
    >> 1

In the last paragraph of this article
[http://blog.revolucent.net/2009/05/javascript-rebol.html](http://blog.revolucent.net/2009/05/javascript-rebol.html){rel="nofollow"}
the author says \"allow functions to be passed as arguments\" so I got
excited, but it\'s also just using `does` :). But I learned it\'s
possible.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by rgchris

> How can I pass a function as an argument in red?

It doesn\'t seem this is the essence of your question, but you can pass
a function as an argument in a couple of ways:

    my-func: func [their-func [any-function!]][their-func "Stuff"]

    my-func :print
    my-func func [thing][probe uppercase thing]

> How can I make this work with (multiple) args?

There are two possibilities here. One is APPLY:

    my-func: func [thing][print uppercase thing]
    apply :my-func ["Foo"]

Another is to build up a block and DO it:

    do collect [keep 'my-func keep "Bar"]
    do collect [keep :my-func keep "Baz"] ; keeps the function itself

*Comment by DocKimbel:* `apply` is now fully supported in Red, adding
many new features. Use `? apply` from the console to see its
specification. See the related [blog
entry](https://www.red-lang.org/2023/06/dynamic-refinements-and-function.html){rel="nofollow noreferrer"}
for more info.

------------------------------------------------------------------------

## Comments on question
