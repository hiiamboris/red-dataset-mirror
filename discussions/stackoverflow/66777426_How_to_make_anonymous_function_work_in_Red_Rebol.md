# How to make anonymous function work in Red/Rebol

**Link:**
<https://stackoverflow.com/questions/66777426/how-to-make-anonymous-function-work-in-red-rebol>

**Asked:** 2021-03-24 08:38:32 UTC

------------------------------------------------------------------------

In Red/Rebol, parentheses `()` can be used to evaluate expressions like
this:

    >> (1 + 2 3 + 4)
    == 7

However, when I use parentheses to evalute an anonymous function, it
fails(please see the following code). Why? And how to make an anonymous
function work?

    >> (func [x y][x + y] 2 3)
    == 3  ;;I think it should be 5.

PS:

    >> do func [x y] [x + y]
    == func [x y][x + y]
    >> type? do func [x y] [x + y]
    == function!
    >> (do func [x y] [x + y]) 2 3
    == 3  ;; why does this anonymous function still not work?
    >> ((do func [x y] [x + y]) 2 3)
    == 3  ;; This does not work too.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by 9214

> Why?

The reason is quite simple: there\'s no anonymous function in your code.
It will become more evident if you scan its content as data:

    >> code: quote (func [x y][x + y] 2 3)
    == (func [x y] [x + y] 2 3)
    >> forall code [probe type? code/1]
    word!
    block!
    block!
    integer!
    integer!
    == integer!

That is to say: `func [x y][x + y]` is a `word!` followed by 2
`block!`s, not a function. Once evaluated though, it will yield back a
function whose literal form will look exactly the same. `func` is itself
a function (aka function constructor) that *creates* another function.

    >> type? probe func [x y][x + y]
    func [x y][x + y]
    == function!

In your example `3` is returned exactly for that reason: the interpreter
evaluates each expression in sequence; the first expression is a
function call `func [x y][x + y]` that takes two blocks and returns a
function; the remaining expressions are literals `2` and `3` that
evaluate to themselves; the result of the last expression is always
returned in Red, so you get `3`. Parentheses in such case are
superfluous.

    >> 0 + 1 2 3
    == 3
    >> func [x y][x + y] 2 3
    == 3

So, if you want to evaluate a function anonymously, you first need to
create a `function!` value from spec and body blocks with the help of
function constructor (e.g. `func`, `function`, `has`, `does` or some
other one that you wrote yourself), and only then apply it to the
arguments. The most common way to do so is `do reduce` pattern:

    >> do reduce [func [x y][x + y] 2 3]
    == 5

`reduce` evaluates each sub-expression within a block (`func` creates a
`function!`, `2` and `3` evaluate to themselves), and `do` then
interprets it (applies an anonymous function to two arguments).

Here are some other approaches, so that you can get a grip of the
concept:

    >> do compose [(func [x y][x + y]) 2 3]
    == 5
    >> do head insert [2 3] function [x y][x + y]
    == 5
    >> do reverse append [3 2] make function! [[x y][x + y]]
    == 5
    >> λ: func [spec body code][do compose [(func spec body) (code)]]
    == func [spec body code][do compose [(func spec body) (code)]]
    >> λ [x y][x + y][2 3]
    == 5

------------------------------------------------------------------------

As to why `do func [x y][x + y]` works that way: this by design, to
prevent variadic function calls. You can read a bit more on the
rationale of it
[here](https://github.com/red/red/issues/3553){rel="nofollow noreferrer"}.

All functions in Rebol/Red have a fixed arity and evaluate only as many
expressions as they need; function returning to the call-site and
consuming the remaining arguments (like e.g. in Lisp) would go against
this rule.

       ((lambda (x y)(+ x y)) 1 2)
    => 3

As a historical curiosity, Rebol3 had a `return/redo` refinement which
allowed functions to do just that, and which was later
[removed](https://www.curecode.org/rebol3/ticket.rsp?id=2121){rel="nofollow noreferrer"}
for the reasons I outlined above.

Evaluation in the Rebol family is \"layered\", so to speak: values
returned as results from functions don\'t get immediately re-evaluated
if they are applicative, but rather need an extra pass from a top-level
call to the evaluator (e.g. `do` or `reduce`).

*Comment by lyl:* `func` `[x y]` `[x + y]` in a block are just three
elements of the block. They must be `reduce`d before being a function.
Many thanks for these detail description!

*Comment by lyl:* And I updated my query. Would you have a look at it?
Thank you

*Comment by 9214:* \@lyl Sure. I\'ve extended my answer to address your
post-scriptum.

------------------------------------------------------------------------

## Comments on question
