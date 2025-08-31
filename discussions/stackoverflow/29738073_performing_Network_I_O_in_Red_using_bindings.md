# performing Network I/O in Red using bindings

**Link:**
<https://stackoverflow.com/questions/29738073/performing-network-i-o-in-red-using-bindings>

**Asked:** 2015-04-20 01:46:24 UTC

------------------------------------------------------------------------

I read that there were bindings to perform GET and POST in the Red
programming language. Could someone kindly show me a simple example that
does something like \"wget
[http://www.google.com](http://www.google.com){rel="nofollow"}\"?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by johnk

There is a cURL binding for Red which is described in more detail in
this question.

[How do I use the Red cURL
binding?](https://stackoverflow.com/questions/21724042/how-do-i-use-the-red-curl-binding)

It will not give you the nice `print read http://red-lang.org` syntax,
but I understand that adding this protocol to Red is on the road mapfor
the future.

------------------------------------------------------------------------

## Comments on question

*Comment by HostileFork says dont trust SE:* Red will ultimately be
aiming to do things like Rebol does, e.g.
**`read http://hostilefork.com`** and such. The interim state until the
port model is implemented will require use of a binding to something
like cURL, [and there is
one](http://red.esperconsultancy.nl/Red-cURL/artifact/c8403b9beb94ee6e){rel="nofollow noreferrer"}
if you want to chase that down. *(My personal suggestion is generally to
learn Rebol and trust the goal of Red is to be no lesser, so a library
binding is a poor substitute.)*
