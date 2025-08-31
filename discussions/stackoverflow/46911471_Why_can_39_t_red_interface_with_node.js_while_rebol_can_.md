# Why can&#39;t red interface with node.js while rebol can?

**Link:**
<https://stackoverflow.com/questions/46911471/why-cant-red-interface-with-node-js-while-rebol-can>

**Asked:** 2017-10-24 13:09:39 UTC

------------------------------------------------------------------------

I just stumbled upon this:

[https://trello.com/c/yGGIM3Hl/32-nodejs-interface-for-rebol-to-pave-the-way-for-red](https://trello.com/c/yGGIM3Hl/32-nodejs-interface-for-rebol-to-pave-the-way-for-red){rel="nofollow noreferrer"}

> While Red doesn\'t build on a standard toolchain and is not something
> you can add in wrapped up as a native node.js NPM package, Rebol can
> do just that today (if someone were willing to do a little work!) Then
> something like:
>
>      npm install rebol-eval
>
> Followed by something dumb; give it a string, get back a string:
>
>       var rebolEval = require("rebol-eval");
>
>      rebolEval.newContext(function (err, rebol) {
>          if (err) {
>              console.error("context alloc failure: " + err);
>              return;
>           }
>          rebol.eval("1 + 1", function (err, res)) {
>              if (err) {
>                  console.err("Evaluation failed " + err);
>              } else {
>                  console.log(res);
>              }
>          }
>      }

Is it about being able to call rebol from nodeJs ? Why would rebol be
able to and not red as I thought red was supposed to be compatible with
rebol.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by DocKimbel

> Why would rebol be able to and not red as I thought red was supposed
> to be compatible with rebol.

The fact that nobody did such integration does not mean that it cannot
be done. Moreover the \"compatibility\" you are mentioning is at the
language level, not toolchain level.

Actually, it should be fairly simple to achieve integration with
Node.js, thanks to the [libRed
API](https://doc.red-lang.org/en/libred.html){rel="nofollow noreferrer"},
which allow Red\'s runtime and interpreter to be embedded in pretty much
[any
software](http://www.red-lang.org/2017/03/062-libred-and-macros.html){rel="nofollow noreferrer"}.

*Comment by HostileFork says dont trust SE:* No such code exists, but
[see my note
above](https://stackoverflow.com/questions/46911471/why-cant-red-interface-with-node-js-while-rebol-can#comment80842482_46911471)
and links therein.

------------------------------------------------------------------------

## Comments on question

*Comment by jfriend00:* It appears that someone has done the work to
write a node.js interface so you can call rebol code from within
node.js, but apparently (according to you) one has not done that for
red. Even though red is another implementation of the rebol language, it
would still need its own implementation of a node.js interface in order
to be used from node.js because it is a separate binary from rebol.

*Comment by HostileFork says dont trust SE:* What you found here is a
proposal, it hasn\'t been done. In theory, given libRed as a C API
there\'s not really much difference between the two languages
interacting with the C++ toolchain. In practice there are some nebulous
issues affecting the external interface. See [handle
lifetime](https://forum.rebol.info/t/lifetime-of-handles-given-back-to-c-code/343){rel="nofollow noreferrer"}
and [handle
mutability](https://forum.rebol.info/t/should-values-given-to-c-through-api-handles-be-mutable/345){rel="nofollow noreferrer"}.
If this is an area you know about, I encourage you to weigh in.
