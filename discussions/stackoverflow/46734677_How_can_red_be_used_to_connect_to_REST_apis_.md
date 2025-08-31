# How can red be used to connect to REST apis?

**Link:**
<https://stackoverflow.com/questions/46734677/how-can-red-be-used-to-connect-to-rest-apis>

**Asked:** 2017-10-13 16:56:35 UTC

------------------------------------------------------------------------

I found that there is a red command to download contents of a web page:

    read https://trello.com/c/8p75OiSE/26-test-card.json

However, I have two problems (at least on Linux Mint):

1.  Trello\'s response differs for this request than it does for simply
    [visiting this
    URL](https://trello.com/c/8p75OiSE/26-test-card.json){rel="nofollow noreferrer"}
    in a web browser (try it! it works fine in a browser).
2.  If I did need to add authorization headers (shouldn\'t for this
    public card), I don\'t see a way to do that.

It is even worse in
[Tio.run](https://tio.run/##K0pN@f8/KDVFITqWi6soNTFFIaOkpKDYSl@/pCg1JydfLzk/Vz9Z36LA3NQ/M9hV38hMtyS1uEQ3ObEoRS@rOD/v/38A "Red – Try It Online"){rel="nofollow noreferrer"},
but I\'m pretty sure that is not a problem with the language itself but
with Tio.run.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by rgchris

WRITE, and more specifically WRITE/INFO should give you enough leverage
to engage most APIs.

The most basic usage of WRITE returns the body of the HTTP response:

    probe write http://some.resource/api/method "Some Data"

You can get the header of the response by adding /INFO:

    probe write/info http://some.resource/api/method "Some Data"

And you can send different HTTP methods and headers using a BLOCK! as
your WRITE argument:

    probe write/info http://some.resource/api/method [
        put [Content-Type: "application/json"] {["Some Data"]}
    ]

*Comment by Dave Andersen:* For more help with `write`, check out
[rebolek/http-tools](https://github.com/rebolek/red-tools/blob/master/http-tools.red){rel="nofollow noreferrer"}
on Github. He also has REST API wrappers around Github and Gitter there.

------------------------------------------------------------------------

## Comments on question

*Comment by rgchris:* On point 1---I get the same response from Trello.
Is it different perhaps as you\'re signed in to Trello in the browser?

*Comment by NH.:* \@rgchris you get an error response? I tried in
private browsing too and it worked.

*Comment by HostileFork says dont trust SE:* Here\'s some code to [talk
to Trello in
Rebol2](http://www.codeconscious.com/rebol/articles/basic-trello-interface.html){rel="nofollow noreferrer"},
which may be of interest, but probably hasn\'t been checked for
operation with recent Trello.

*Comment by rgchris:* \@NH. No---I didn\'t get an error response.

*Comment by sqlab:* This shows a comparable issue
[stackoverflow.com/questions/31218141/...](https://stackoverflow.com/questions/31218141/trello-responds-invalid-key "trello responds invalid key")
